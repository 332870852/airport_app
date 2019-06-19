import 'package:flutter/material.dart';
import 'package:airport_app/model/Station.dart';

class searchBarDelegate extends SearchDelegate<String> {
  List<Station> station;

  searchBarDelegate({this.station});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  //结果展示
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    suggestionList = query.isEmpty
        ? station
        : station
            .where((input) =>
                input.name.startsWith(query) || input.quanpin.startsWith(query))
            .toList();
      List<Widget> results;

    return Container(
      width: 100,
      height: 100,
      child:  buildSuggestions(context),
    );
  }

  List<Station> suggestionList;

  //推荐
  @override
  Widget buildSuggestions(BuildContext context) {
    if (station == null) station = new List<Station>(); //////////////////处理*

    suggestionList = query.isEmpty
        ? station
        : station
            .where((input) =>
                input.name.startsWith(query) || input.quanpin.startsWith(query))
            .toList();

    return ListView.builder(
        itemCount: suggestionList == "" ? "" : suggestionList.length,
        itemBuilder: (context, index) {
          //print("llll: $query");

          if (query.length > 0) {
            if (checkPY(query)) {
              return ListTile(
                onTap: (){
                  print("点击了${suggestionList[index].name}");
                  Navigator.pop(context,null);//返回页面
                  Navigator.pop(context,suggestionList[index]);//

                },
                title: RichText(
                  text: TextSpan(
                    text: suggestionList[index].name,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
            return ListTile(
              onTap: (){
                print("点击了${suggestionList[index].name}");
                Navigator.pop(context,null);//返回页面
                Navigator.pop(context,suggestionList[index]);//

              },
              title: RichText(
                text: TextSpan(
                  text: suggestionList[index].name.substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: suggestionList[index].name.substring(query.length),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return null;
          }
        });
  }
}

bool checkPY(String fstrData) {
  if (fstrData.codeUnitAt(0) > 96 && fstrData.codeUnitAt(0) < 124)
    return true;
  else
    return false;
}
