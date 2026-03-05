import 'dart:ui' show Image;

import 'package:flutter/material.dart';
import 'package:instagram/Repository/Model/Instagram_model.dart';

class TaggedGrid extends StatelessWidget {
  final List<Edges> edges;

  const TaggedGrid({super.key, required this.edges});

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      itemCount: edges.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (_, i) {

        final url =
            edges[i].node?.imageVersions2?.candidates?.first.url ?? "";

        return Image.network(url, fit: BoxFit.cover);
      },
    );
  }
}
