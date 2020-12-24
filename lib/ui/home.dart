import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeContentState();
  }
}

class _HomeContentState extends State<HomeContent> {
  var getList;
  var _do = true;

  Future fetchData() async {
    http.Response response;
    response = await http.get(
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=c44d7e2b78a943549f159ec7ad7482d0");
    getList = jsonDecode(response.body);
    if (getList["status"] == "ok") {
      setState(() {
        print(getList["totalResults"]);
        print(getList["articles"][0]["title"]);
      });
    }
  }
  
  @override
  void initState() {
    super.initState();
      fetchData();
      _do = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getList == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: getList["articles"].length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () async{
                          if (await canLaunch(getList["articles"][index]["url"])) {
                            await launch(getList["articles"][index]["url"]);
                          } else {
                            throw "Could not override";
                          }
                        },
                        child: Card(
                          child: Container(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.network("${getList["articles"][index]["urlToImage"]}"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    getList["articles"][index]["title"].length > 70 ?
                                    "${getList["articles"][index]["title"].substring(0,70)}..."
                                    : "${getList["articles"][index]["title"]}",
                                    style: TextStyle(
                                      fontSize: 20
                                    ),
                                    ),
                                ),
                              ]                          
                              ),
                      ),
                    ),
                  ),    
                );
                  }),
            ));
  }
}
