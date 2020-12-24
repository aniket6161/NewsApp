import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:url_launcher/url_launcher.dart';

class Category extends StatefulWidget {
  String q;
  Category(this.q);
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var _data;

  @override
  void initState() {
    fetchData(widget.q);
    super.initState();
  }

  void fetchData(String q) async {
    var url =
        "https://newsapi.org/v2/top-headlines?category=${q}&country=in&apiKey=c44d7e2b78a943549f159ec7ad7482d0";
    http.Response res = await http.get(url);
    setState(() {
      print(q);
      _data = jsonDecode(res.body);
    });
  }

  openURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not override";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.q}"),
        ),
        body: _data == null
            ? Center(child: CircularProgressIndicator())
            : _data["articles"].isEmpty
                ? Center(
                    child: Image.network(
                        "https://img.icons8.com/color/452/nothing-found.png"))
                : ListView.builder(
                    itemCount: _data["articles"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return _data["articles"][index]["urlToImage"] != null
                          ? Container(
                              child: Card(
                                  child: Center(
                                  child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () {
                                      openURL(
                                          "${_data["articles"][index]["url"]}");
                                    },
                                    title: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                      Image.network(
                                        "${_data["articles"][index]["urlToImage"]}",
                                        ),
                                      Text("${_data["articles"][index]["title"]}"),

                                    ],),
                                    subtitle:
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text("${_data["articles"][index]["source"]["name"]}"),
                                        ),
                                  ),
                                )),
                              ),
                            )
                          : Divider(color: Colors.transparent);
                    }));
  }
}
