import 'package:flutter/material.dart';
import 'package:instagram/Repository/Model/Instagram_model.dart';

class VideosGrid extends StatelessWidget {
  final List<Edges> edges;

  const VideosGrid({super.key, required this.edges});

  @override
  Widget build(BuildContext context) {

    final videos = edges.where((e) =>
        e.node?.videoVersions != null).toList();

    return GridView.builder(
      itemCount: videos.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (_, i) {

        final thumb =
            videos[i].node?.imageVersions2?.candidates?.first.url ?? "";

        return Stack(
          children: [
            Image.network(thumb, fit: BoxFit.cover),
            const Center(
              child: Icon(Icons.play_circle,
                  color: Colors.white, size: 40),
            )
          ],
        );
      },
    );
  }
}
