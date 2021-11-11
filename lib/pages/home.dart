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
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.indigo[900],
            ),
          ),
        ],
      ),
      body: (data != null)
          ? GridSview(
              data: data!,
            )
          : Center(
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 20,
              ),
            ),
    );
  }
}
