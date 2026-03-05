import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Repository/Model/highlightStories.dart';
import 'package:video_player/video_player.dart';
import 'package:instagram/bloc/highlight_stories_bloc.dart';
import 'package:instagram/bloc/highlight_stories_state.dart';

class HighlightViewer extends StatefulWidget {
  final String hilight_id;
  const HighlightViewer({super.key, required this.hilight_id});

  @override
  State<HighlightViewer> createState() => _HighlightViewerState();
}

class _HighlightViewerState extends State<HighlightViewer> {
  int currentIndex = 0;
  VideoPlayerController? _controller;
  Timer? _timer;
  double progress = 0.0;
  List<Result>? _stories; // Changed to match the Model type

  @override
  void initState() {
    super.initState();
    context.read<HighlightStoriesBloc>().add(FetchHighlightStories(id: widget.hilight_id));
  }

  void _loadStory() {
    if (_stories == null || _stories!.isEmpty) return;

    _controller?.dispose();
    _controller = null;
    _timer?.cancel();
    progress = 0.0;

    final story = _stories![currentIndex];

    // Check if video versions exist to determine if it's a video
    bool isVideo = story.videoVersions != null && story.videoVersions!.isNotEmpty;

    if (isVideo) {
      final videoUrl = story.videoVersions![0].url ?? "";
      if (videoUrl.isNotEmpty) {
        _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
          ..initialize().then((_) {
            if (!mounted) return;
            setState(() {});
            _controller!.play();
            _startVideoProgress();
          });
      } else {
        _nextStory(); // Skip if URL is broken
      }
    } else {
      _startImageProgress();
    }
  }

  void _startImageProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) return;
      setState(() {
        progress += 0.01; // Approx 5 seconds per image
      });

      if (progress >= 1.0) {
        _nextStory();
      }
    });
  }

  void _startVideoProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) return;

      if (_controller != null && _controller!.value.isInitialized) {
        final position = _controller!.value.position.inMilliseconds;
        final duration = _controller!.value.duration.inMilliseconds;

        if (duration > 0) {
          setState(() {
            progress = position / duration;
          });
        }

        if (position >= duration && duration > 0) {
          _nextStory();
        }
      }
    });
  }

  void _nextStory() {
    if (_stories != null && currentIndex < _stories!.length - 1) {
      currentIndex++;
      _loadStory();
    } else {
      Navigator.pop(context);
    }
  }

  void _previousStory() {
    if (currentIndex > 0) {
      currentIndex--;
      _loadStory();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HighlightStoriesBloc, HighlightStoriesState>(
      listener: (context, state) {
        if (state is HighlightStoriesloaded) {
          // Fix: Access the result list from your model
          _stories = state.data.result;
          if (_stories != null && _stories!.isNotEmpty) {
            _loadStory();
          }
        }
      },
      builder: (context, state) {
        if (state is HighlightStoriesloading) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        }

        if (state is HighlightStoriesError) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: Text(state.message, style: const TextStyle(color: Colors.white))),
          );
        }

        if (state is HighlightStoriesloaded && _stories != null && _stories!.isNotEmpty) {
          final story = _stories![currentIndex];
          bool isVideo = story.videoVersions != null && story.videoVersions!.isNotEmpty;

          return Scaffold(
            backgroundColor: Colors.black,
            body: GestureDetector(
              onTapDown: (details) {
                final width = MediaQuery.of(context).size.width;
                if (details.globalPosition.dx < width / 2) {
                  _previousStory();
                } else {
                  _nextStory();
                }
              },
              child: Stack(
                children: [
                  /// Story Content
                  Center(
                    child: !isVideo
                        ? Image.network(
                            story.imageVersions2?.candidates?.first.url ?? "",
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => 
                              const Icon(Icons.broken_image, color: Colors.white),
                          )
                        : (_controller != null && _controller!.value.isInitialized)
                            ? AspectRatio(
                                aspectRatio: _controller!.value.aspectRatio,
                                child: VideoPlayer(_controller!),
                              )
                            : const CircularProgressIndicator(color: Colors.white),
                  ),

                  /// Progress Bars
                  Positioned(
                    top: 50,
                    left: 10,
                    right: 10,
                    child: Row(
                      children: List.generate(
                        _stories!.length,
                        (index) => Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            height: 3,
                            child: LinearProgressIndicator(
                              value: index == currentIndex
                                  ? progress
                                  : (index < currentIndex ? 1.0 : 0.0),
                              backgroundColor: Colors.grey.shade700,
                              valueColor: const AlwaysStoppedAnimation(Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Close Button
                  Positioned(
                    top: 45,
                    right: 15,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}