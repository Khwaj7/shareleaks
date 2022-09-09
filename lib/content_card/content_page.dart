import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content_card.dart';
import 'content_card_data.dart';

class ContentPage extends StatefulWidget {
  final String title;

  const ContentPage({Key? key, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 5.0,
        //scrollDirection: Axis.vertical,
        children: [
          ContentCard(
              data: ContentCardData(
                  creatorName: "Niece",
                  nbElements: 54,
                  origin: "OF",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2012-02-27"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Caprice",
                  nbElements: 27,
                  origin: "MYM",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2021-04-18"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Eva",
                  nbElements: 98,
                  origin: "PAT",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2019-11-24"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Stefani",
                  nbElements: 52,
                  origin: "UNC",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2017-07-17"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Waidhofer",
                  nbElements: 12,
                  origin: "OF",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2018-11-09"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Elfie",
                  nbElements: 47,
                  origin: "OF",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2018-07-31"))),
          ContentCard(
              data: ContentCardData(
                  creatorName: "Cam",
                  nbElements: 68,
                  origin: "OF",
                  originUrl: "http://www.google.com",
                  uploadDate: DateTime.parse("2021-02-17"))),
        ],
      ),
    );
  }
}
