import 'package:flutter/material.dart';
import 'package:fnews_app/ui/category.dart';
import 'package:fnews_app/ui/homepage.dart';

class CategoryDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Image(
            height: 100,
            width: 100,
            image: NetworkImage(
                "https://cdn3.iconfinder.com/data/icons/ballicons-reloaded-free/512/icon-70-512.png")),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        ListTile(
          leading: Icon(Icons.business_center),
          title: Text("Business"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Category("Business")));
          },
        ),
        ListTile(
          leading: Icon(Icons.sports_cricket),
          title: Text("Sports"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Category("Sports")));
          },
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Entertainment"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Category("Entertainment")));
          },
        ),
        ListTile(
          leading: Icon(Icons.business_center),
          title: Text("Finance"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Category("Finance")));
          },
        ),
        ListTile(
          leading: Icon(Icons.sports_cricket),
          title: Text("Cricket"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Category("Cricket")));
          },
        ),
      ],
    ));
  }
}
