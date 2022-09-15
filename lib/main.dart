import 'package:flutter/material.dart';
import 'package:shareleaks/creator_card/creator_card.dart';
import 'package:shareleaks/creator_card/creator.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:shareleaks/link.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseReference ref = FirebaseDatabase.instance.ref('creators/');
  ref.onValue.listen((DatabaseEvent event) {
    final creators = event.snapshot.value;
    runApp(MyApp(
      creatorsData: creators,
    ));
  });
}

class MyApp extends StatelessWidget {
  var creatorsData;
  MyApp({Key? key, required this.creatorsData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shareleaks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: 'Shareleaks',
        creatorsData: creatorsData,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title, required this.creatorsData})
      : super(key: key);

  final String title;
  final creatorsData;

  static const bool allowNSFW = false;
  static const String avatarsFolderConfig =
      allowNSFW ? 'assets/avatars/' : 'assets/avatars/sfw/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: widget.creatorsData.length,
        itemBuilder: (BuildContext context, index) {
          String creatorKey = widget.creatorsData.keys.toList()[index];
          List<Link> links = getLinks(widget.creatorsData[creatorKey]["links"]);
          return CreatorCard(
              data: Creator.creatorWithAvatar(
                  id: creatorKey,
                  creatorName: widget.creatorsData[creatorKey]["name"],
                  nbSets: widget.creatorsData[creatorKey]["sets"].length,
                  avatar: widget.creatorsData[creatorKey]["avatar"],
                  links: links));
        },
      ),
    );
  }

  List<Link> getLinks(List<dynamic> links) {
    List<Link> linksList = [];
    for (final aLink in links) {
      if (aLink != null) {
        linksList.add(Link(name: aLink['name'], url: aLink['url']));
      }
    }
    return linksList;
  }
}

/*
GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 5.0,
          children: [
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Niece Waidhofer',
                    nbSets: 28,
                    avatar:
                        '${HomePage.avatarsFolderConfig}niece-waidhofer.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Caprice',
                    nbSets: 15,
                    avatar: '${HomePage.avatarsFolderConfig}caprice.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Eva Elfie',
                    nbSets: 17,
                    avatar: '${HomePage.avatarsFolderConfig}eva-elfie.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Stefany Kyler',
                    nbSets: 38,
                    avatar:
                        '${HomePage.avatarsFolderConfig}stefany-kyler.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Marlen Valderrama Alvarez',
                    nbSets: 15,
                    avatar:
                        '${HomePage.avatarsFolderConfig}marlen-valderrama-alvarez.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Amy Jackson',
                    nbSets: 17,
                    avatar: '${HomePage.avatarsFolderConfig}amy-jackson.jpg')),
            CreatorCard(
                data: CreatorCardData.creatorCardDataWithAvatar(
                    creatorName: 'Viki Odintcova',
                    nbSets: 38,
                    avatar:
                        '${HomePage.avatarsFolderConfig}viki-odintcova.jpg')),
          ],
        ))
*/