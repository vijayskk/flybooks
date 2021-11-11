// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flybooks/pages/staggerdview.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List? data;
  List? temp;
  bool showSearch = false;
  getdata() async {
    Response res =
        await get(Uri.parse('https://apiflybooks.vercel.app/api/books/getall'));
    List getdata = jsonDecode(res.body);
    setState(() {
      data = getdata;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.indigo[900],
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "All books",
            style: TextStyle(color: Colors.indigo[900]),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  showSearch = !showSearch;
                });
              },
              icon: Icon(
                Icons.search,
                color: Colors.indigo[900],
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            (data != null)
                ? Container(
                    child: (data!.length != 0)
                        ? AnimatedPadding(
                            duration: Duration(milliseconds: 300),
                            padding: EdgeInsets.only(top: showSearch ? 80 : 0),
                            child: GridSview(
                              data: data!,
                            ),
                          )
                        : Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No Books Found",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.error)
                              ],
                            ),
                          ),
                  )
                : Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                      radius: 20,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 300),
                width: MediaQuery.of(context).size.width,
                height: showSearch ? 80 : 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: showSearch ? 1 : 0,
                  child: TextField(
                    onSubmitted: (e) {
                      if (e == "") {
                        getdata();
                      } else {
                        searchBook(e);
                      }
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showSearch = false;
                              });
                              getdata();
                            },
                            icon: Icon(Icons.close)),
                        border: OutlineInputBorder(),
                        hintText: "Search..",
                        focusColor: Colors.indigo[900]),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  searchBook(String str) async {
    setState(() {
      temp = data;
      data = null;
    });
    Response res = await get(Uri.parse(
        'https://apiflybooks.vercel.app/api/books/search/keyword?keyword=$str'));
    List getdata = jsonDecode(res.body);
    print(getdata);
    setState(() {
      data = getdata;
    });
  }
}
