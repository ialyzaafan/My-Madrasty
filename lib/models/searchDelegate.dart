import 'package:flutter/material.dart';
import 'package:madrasty/style/style.dart';
import 'package:madrasty/views/profileUI/myAcc.dart';

class DataSearch extends SearchDelegate<String> {
  final List list;
  DataSearch(this.list, this.recentSearch);
  final List recentSearch;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          progress: transitionAnimation,
          icon: AnimatedIcons.menu_arrow,
          color: mainColor,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return MyProfile(list[list.indexWhere((element) =>
        element.name.contains(query.substring(0, 1).toUpperCase()))]);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearch
        : list
            .where((element) =>
                element.name.startsWith(query.substring(0, 1).toUpperCase()))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context);
            },
            leading: CircleAvatar(
              backgroundColor: secondryColor,
              radius: 30,
              backgroundImage: AssetImage(suggestionList[index].imgUrl),
            ),
            title: RichText(
              text: TextSpan(
                  text: suggestionList[index].name.substring(0, query.length),
                  children: [
                    TextSpan(
                        text:
                            suggestionList[index].name.substring(query.length),
                        style: backgroundTextStyle)
                  ],
                  style: smallTitleStyle),
            )));
  }
}
