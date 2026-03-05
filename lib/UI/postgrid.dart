import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/Repository/Model/Instagram_model.dart';

class PostsGrid extends StatelessWidget {
  final List<Edges> edges;

  const PostsGrid({super.key, required this.edges});

  @override
  Widget build(BuildContext context) {

    final posts = edges.where((e) =>
        e.node?.imageVersions2?.candidates != null).toList();

    return GridView.builder(
      itemCount: posts.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (_, i) {
        final url =
            posts[i].node!.imageVersions2!.candidates!.first.url!;

        return Image.network(url, fit: BoxFit.cover);
      },
    );
  }
}
