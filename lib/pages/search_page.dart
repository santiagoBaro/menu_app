import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/data_types/data_types_export.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchBarController<Local> _searchBarController = SearchBarController();

  Future<List<Local>> _getALlPosts(String text) async {
    // TODO
  }

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
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
        child: SearchBar(
          hintText: "search",
          textStyle: TextStyle(color: Colors.black87, fontSize: 20),
          searchBarController: _searchBarController,
          loader: Text("loading..."),
          onSearch: _getALlPosts,
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          suggestions: getSearchedTearms(),
          onItemFound: (Object item, int index) {},
        ),
      ),
    );
  }

  List<String> getSearchedTearms() {
    if (storedUserCredentials.searchedTerms == null) {
      return List<String>();
    }
    return storedUserCredentials.searchedTerms;
  }
}
