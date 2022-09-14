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

  static const bool allowNSFW = false;
  static const String avatarsFolderConfig =
      allowNSFW ? 'assets/avatars/' : 'assets/avatars/sfw/';

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
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Niece Waidhofer',
                    nbSets: 28,
                    avatar:
                        '${MyHomePage.avatarsFolderConfig}niece-waidhofer.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Caprice',
                    nbSets: 15,
                    avatar: '${MyHomePage.avatarsFolderConfig}caprice.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Eva Elfie',
                    nbSets: 17,
                    avatar: '${MyHomePage.avatarsFolderConfig}eva-elfie.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Stefany Kyler',
                    nbSets: 38,
                    avatar:
                        '${MyHomePage.avatarsFolderConfig}stefany-kyler.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Marlen Valderrama Alvarez',
                    nbSets: 15,
                    avatar:
                        '${MyHomePage.avatarsFolderConfig}marlen-valderrama-alvarez.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Amy Jackson',
                    nbSets: 17,
                    avatar:
                        '${MyHomePage.avatarsFolderConfig}amy-jackson.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Viki Odintcova',
                    nbSets: 38,
                    avatar:
                        '${MyHomePage.avatarsFolderConfig}viki-odintcova.jpg')),
          ],
        ));
  }
}
