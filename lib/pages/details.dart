// ignore_for_file: prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  Map data;
  String image;
  Details({Key? key, required this.data, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backwardsCompatibility: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo[900],
            )),
      ),
      body: ListView(
        children: [
          Hero(
            tag: image,
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 60, right: 60),
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.network(
                  image,
                  width: 400,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 28.0, top: 20),
                child: Text(
                  data["original_title"],
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 8),
                child: Text(
                  data["authors"],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Average Rating"),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          value: data["average_rating"] / 5,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Five Star Rating"),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          value: data["ratings_5"] / data["ratings_count"],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Four Star Rating"),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          value: data["ratings_4"] / data["ratings_count"],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Three Star Rating"),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          value: data["ratings_3"] / data["ratings_count"],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Two Star Rating"),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          value: data["ratings_2"] / data["ratings_count"],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("One Star Rating"),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          value: data["ratings_1"] / data["ratings_count"],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      _launchURL(
                          "https://www.goodreads.com/book/show/${data["goodreads_book_id"]}");
                    },
                    child: Text("See in Goodreads"),
                    color: Colors.indigo,
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: () {
                      _launchURL(
                          "https://www.goodreads.com/book/show/${data["goodreads_book_id"]}");
                    },
                    child: Text("Copy Share link"),
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              )
            ],
          )
        ],
      ),
    );
  }

  _launchURL(String url) async {
    await launch(url);
  }
}
