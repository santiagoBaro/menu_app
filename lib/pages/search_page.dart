import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 15,
            blurRadius: 12,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      constraints: BoxConstraints(maxWidth: 700),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                child: SearchBar(
                  hintText: "search",
                  textStyle: TextStyle(color: Colors.black87, fontSize: 20),
                  loader: Text("loading..."),
                  onSearch: (String text) {
                    //TODO
                  },
                  onItemFound: (item, int index) {
                    //TODO
                  },
                ),
              ),
              height: MediaQuery.of(context).size.height - 58,
            ),
          ],
        ),
      ),
    );
  }
}
