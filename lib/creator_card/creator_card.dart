import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shareleaks/content_card/content_card.dart';
import 'package:shareleaks/content_card/content_card_data.dart';
import 'package:shareleaks/content_card/content_page.dart';

import 'creator_card_data.dart';

@immutable
class CreatorCard extends StatelessWidget {
  final CreatorCardData data;

  const CreatorCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContentPage(title: data.creatorName)),
            );
            debugPrint('${data.creatorName} tapped.');
          },
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_pin),
                title: Text(
                  data.creatorName,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/card-sample-image-2.jpg'),
              ),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(8.0)),
                  Text(
                      textAlign: TextAlign.left,
                      '${data.nbSets} elements',
                      style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  const Spacer(),
                  Text(
                      textAlign: TextAlign.right,
                      'Last updated : ${data.lastUpdated.year}-${data.lastUpdated.month}-${data.lastUpdated.day}',
                      style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  const Padding(padding: EdgeInsets.all(8.0)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text('OF'),
                    onPressed: () {/* ... */},
                  ),
                  TextButton(
                    child: const Text('MYM'),
                    onPressed: () {/* ... */},
                  ),
                  TextButton(
                    child: const Text('UNC'),
                    onPressed: () {/* ... */},
                  ),
                  //const Padding(padding: EdgeInsets.all(4.0)),
                ],
              ),
            ],
          ),
        ));
  }
}
