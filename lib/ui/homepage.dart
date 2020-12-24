import 'package:flutter/material.dart';
import 'package:fnews_app/ui/categoryDrawer.dart';
import 'package:fnews_app/ui/home.dart';
import 'package:fnews_app/ui/search.dart';
import 'package:fnews_app/ui/searchResults.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("News App"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.search)),
            ],
          ),
          elevation: 0,
        ),

        drawer: CategoryDrawer(),
        body: TabBarView(
          children: [
              HomeContent(),
              Search(),
          ],
          ),
      ),
      
    );
  }
}