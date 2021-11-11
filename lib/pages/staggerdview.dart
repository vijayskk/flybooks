// ignore_for_file: unnecessary_new, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flybooks/pages/details.dart';

class GridSview extends StatelessWidget {
  List data;
  GridSview({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: GridView.count(
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: data
            .map((e) => ImageBook(
                  image: e["image_url"],
                  data: e,
                ))
            .toList(),
      ),
    );
  }
}

class ImageBook extends StatelessWidget {
  String image;
  Map data;
  ImageBook({Key? key, required this.image, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        clipBehavior: Clip.hardEdge,
        child: Hero(
          tag: image,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return Details(data: data, image: image);
                  },
                ),
              );
            },
            child: Image.network(
              image,
              fit: BoxFit.fitHeight,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
