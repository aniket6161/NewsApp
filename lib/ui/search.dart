import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fnews_app/ui/searchResults.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 10,
              color: Colors.transparent,
            ),
            TextField(
              controller: _searchQuery,
              onSubmitted: (query) {
                query = _searchQuery.text;

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchResults(_searchQuery.text.toString()))
                    );
              },
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search here.....",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
