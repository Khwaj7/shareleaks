import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shareleaks/creator_card/creator.dart';

import 'content_card.dart';
import 'content_card_data.dart';

class ContentPage extends StatefulWidget {
  final String title;
  final Creator creator;

  ContentPage({Key? key, required this.title, required this.creator})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  static List<Set> getSetsFromCreator(List<int> sets) {
    dynamic sets;
    DatabaseReference ref = FirebaseDatabase.instance.ref('sets/${sets[0]}');
    ref.onValue.listen((DatabaseEvent event) {
      print(event.snapshot.value);
      sets = event.snapshot.value;
    });
    return sets;
  }

  @override
  Widget build(BuildContext context) {
    dynamic sets = widget.creator.sets;
    print("sets : $sets");
    getSetsFromCreator([1]);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 5.0,
        children: [
          ContentCard(
              data: ContentCardData(
                  creatorName: "Set 1",
                  nbElements: 54,
                  origin: "OF",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2012-02-27"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Set 2",
                  nbElements: 27,
                  origin: "MYM",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2021-04-18"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Set 3",
                  nbElements: 98,
                  origin: "PAT",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2019-11-24"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Set 4",
                  nbElements: 52,
                  origin: "UNC",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2017-07-17"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Set 5",
                  nbElements: 12,
                  origin: "OF",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2018-11-09"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Set 6",
                  nbElements: 47,
                  origin: "OF",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2018-07-31"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Set 7",
                  nbElements: 68,
                  origin: "OF",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2021-02-17"))),
        ],
      ),
    );
  }
}
