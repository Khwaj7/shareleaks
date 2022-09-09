import 'package:flutter/material.dart';
import 'package:shareleaks/content_card/content_card.dart';
import 'package:shareleaks/creator_card/creator_card.dart';
import 'package:shareleaks/creator_card/creator_card_data.dart';

import 'content_card/content_card_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shareleaks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shareleaks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          children: [
            CreatorCard(
                data: CreatorCardData(
                    creatorName: 'Niece Waidhofer', nbSets: 28)),
            CreatorCard(
                data: CreatorCardData(creatorName: 'Caprice', nbSets: 15)),
            CreatorCard(
                data: CreatorCardData(creatorName: 'Eva Elfie', nbSets: 17)),
            CreatorCard(
                data:
                    CreatorCardData(creatorName: 'Stefani Kyler', nbSets: 38)),
            CreatorCard(
                data: CreatorCardData(creatorName: 'Caprice', nbSets: 15)),
            CreatorCard(
                data: CreatorCardData(creatorName: 'Eva Elfie', nbSets: 17)),
            CreatorCard(
                data:
                    CreatorCardData(creatorName: 'Stefani Kyler', nbSets: 38)),
          ],
        ));
  }
}
