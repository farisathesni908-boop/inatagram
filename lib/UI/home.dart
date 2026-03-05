import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Repository/Model/Instagram_model.dart';
import 'package:instagram/Repository/Model/Profile_Model.dart';
import 'package:instagram/UI/fullpage.dart';
import 'package:instagram/UI/story%20viewer.dart';
import 'package:instagram/bloc/highlight_stories_bloc.dart';
import 'package:instagram/bloc/highlight_stories_state.dart';
import 'package:instagram/bloc/highlights_bloc.dart';
import 'package:instagram/bloc/hilights/bloc/hilights_bloc.dart';
import 'package:instagram/bloc/instagram_bloc.dart';
import 'package:instagram/bloc/instagram_event.dart';
import 'package:instagram/bloc/instagram_state.dart';
import 'package:instagram/bloc/profile/bloc/profile_bloc.dart';
import 'package:instagram/bloc/profile/bloc/profile_event.dart';
import 'package:instagram/bloc/profile/bloc/profile_state.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  final String user_name;

  const Home({super.key, required this.user_name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<InstagramBloc>()..add(FetchInstagram(user: widget.user_name));
    context.read<ProfileBloc>().add(FetchProfile(user: widget.user_name));
    context.read<HighlightsBloc>().add(FetchHighlights(user: widget.user_name));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.add, size: 30),
          title: Text(
            widget.user_name,
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu, size: 28),
            ),
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, profileState) {
            if (profileState is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (profileState is ProfileError) {
              return Center(child: Text(profileState.message));
            }

            if (profileState is ProfileLoaded) {
              //   final  _username= profileState.data.result!.username.toString();
              // setState(() {
              //    username=_username;
              // });
              // ✅ Get highlight ID from profile model

              // final highlightId = "17988022760691756";
              // /// ✅ Call HighlightStoriesBloc AFTER profile loaded
              // context.read<HighlightStoriesBloc>().add(
              //       FetchHighlightStories(id: highlightId),
              //     );

              return BlocBuilder<InstagramBloc, InstagramState>(
                builder: (context, postState) {
                  if (postState is InstagramLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (postState is InstagramError) {
                    return Center(child: Text(postState.message));
                  }

                  if (postState is InstagramLoaded) {
                    return _buildScrollView(profileState.data, postState.data);
                  }

                  return const SizedBox();
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildScrollView(
    InstagramProfileModel profileModel,
    InstagramModel postModel,
  ) {
    final profile = profileModel.result;
    final posts = postModel.result?.edges ?? [];

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: profile?.profilePicUrl != null
                          ? NetworkImage(profile!.profilePicUrl!)
                          : null,
                      child: profile?.profilePicUrl == null
                          ? const Icon(Icons.person, size: 40)
                          : null,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _statColumn(
                            profile?.edgeOwnerToTimelineMedia?.count ?? 0,
                            "Posts",
                          ),
                          _statColumn(
                            profile?.edgeFollowedBy?.count ?? 0,
                            "Followers",
                          ),
                          _statColumn(
                            profile?.edgeFollow?.count ?? 0,
                            "Following",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    profile?.username ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 15),

                /// 🔥 Highlight  Section
                BlocBuilder<HighlightsBloc, HighlightsState>(
                  builder: (context, state) {
                    if (state is Highlightsloading) {
                      return const CircularProgressIndicator();
                    }

                    if (state is HighlightSError) {
                      return Text(state.message);
                    }

                    if (state is Highlightsloaded) {
                      final highlights = state.data.result ?? [];

                      if (highlights.isEmpty) {
                        return const SizedBox();
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: highlights.length,
                          itemBuilder: (context, index) {
                            final item = highlights[index];

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => HighlightViewer(
                                        hilight_id: highlights[index].id
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage:
                                          item
                                                  .coverMedia
                                                  ?.croppedImageVersion
                                                  ?.url !=
                                              null
                                          ? NetworkImage(
                                              item
                                                  .coverMedia!
                                                  .croppedImageVersion!
                                                  .url!,
                                            )
                                          : null,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      item.title ?? "",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),

        SliverPersistentHeader(
          pinned: true,
          delegate: _TabBarDelegate(
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.video_collection)),
                Tab(icon: Icon(Icons.person_pin)),
              ],
            ),
          ),
        ),
      ],
      body: TabBarView(
        children: [
          _buildPostsGrid(posts),
          VideoGridWidget(edges: posts),
          TaggedGridWidget(edges: posts),
        ],
      ),
    );
  }

  Widget _buildPostsGrid(List edges) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: edges.length,
      itemBuilder: (context, index) {
        final node = edges[index].node;
        final imageUrl = node?.imageVersions2?.candidates?.first.url;

        final isVideo =
            node?.videoVersions != null && node!.videoVersions!.isNotEmpty;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Fullpage(imageUrl: imageUrl)),
            );
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: imageUrl != null
                    ? Image.network(imageUrl, fit: BoxFit.cover)
                    : Container(color: Colors.grey),
              ),
              if (isVideo)
                const Positioned(
                  right: 5,
                  top: 5,
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _statColumn(int count, String label) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label),
      ],
    );
  }
}

/// ================= VIDEO GRID =================

class VideoGridWidget extends StatelessWidget {
  final List edges;
  const VideoGridWidget({required this.edges, super.key});

  @override
  Widget build(BuildContext context) {
    final videoPosts = edges
        .where(
          (e) =>
              e.node?.videoVersions != null &&
              e.node!.videoVersions!.isNotEmpty,
        )
        .toList();

    if (videoPosts.isEmpty) {
      return const Center(child: Text("No Videos"));
    }

    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: videoPosts.length,
      itemBuilder: (context, index) {
        final node = videoPosts[index].node;
        final videoUrl = node!.videoVersions!.first.url;
        final thumbnail = node.imageVersions2?.candidates?.first.url;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FullScreenVideoPage(videoUrl: videoUrl),
              ),
            );
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: thumbnail != null
                    ? Image.network(thumbnail, fit: BoxFit.cover)
                    : Container(color: Colors.grey),
              ),
              const Positioned(
                right: 5,
                top: 5,
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// ================= TAGGED GRID =================

class TaggedGridWidget extends StatelessWidget {
  final List edges;
  const TaggedGridWidget({required this.edges, super.key});

  @override
  Widget build(BuildContext context) {
    final taggedPosts = edges
        .where(
          (e) =>
              e.node?.usertags != null &&
              e.node!.usertags!.toString().isNotEmpty,
        )
        .toList();

    if (taggedPosts.isEmpty) {
      return const Center(child: Text("No Tagged Posts"));
    }

    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: taggedPosts.length,
      itemBuilder: (context, index) {
        final node = taggedPosts[index].node;
        final image = node?.imageVersions2?.candidates?.first.url;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Fullpage(imageUrl: image)),
            );
          },
          child: image != null
              ? Image.network(image, fit: BoxFit.cover)
              : Container(color: Colors.grey),
        );
      },
    );
  }
}

/// ================= FULLSCREEN VIDEO =================

class FullScreenVideoPage extends StatefulWidget {
  final String videoUrl;
  const FullScreenVideoPage({required this.videoUrl, super.key});

  @override
  State<FullScreenVideoPage> createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  _TabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: _tabBar);
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) => false;
}
