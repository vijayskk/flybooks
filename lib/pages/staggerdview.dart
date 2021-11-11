// ignore_for_file: unnecessary_new, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class GridSview extends StatelessWidget {
  List data;
  GridSview({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.count(
        mainAxisSpacing: 50,
        crossAxisCount: 2,
        children: data.map((e) => ImageBook(image: e["image_url"])).toList(),
      ),
    );
  }
}

class ImageBook extends StatelessWidget {
  String image;
  ImageBook({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        image,
        fit: BoxFit.fitHeight,
        width: 100,
      ),
    );
  }
}
