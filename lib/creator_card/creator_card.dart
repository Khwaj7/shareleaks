import 'package:flutter/material.dart';
import 'package:shareleaks/content_card/content_page.dart';
import 'package:shareleaks/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'creator.dart';

@immutable
class CreatorCard extends StatelessWidget {
  final Creator data;
  List<Widget> originButtons = [];

  CreatorCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    // clear links if not empty in case of resizing window
    if (originButtons.isNotEmpty) {
      originButtons.clear();
    }
    for (final Link element in data.links) {
      originButtons.add(TextButton(
        child: Text(element.name),
        onPressed: () async {
          // go to link
          if (await canLaunchUrl(Uri.parse(element.url))) {
            await launchUrl(Uri.parse(element.url));
          } else {
            // can't launch url
            debugPrint('ERROR - Can\'t launch URL ${element.url}');
          }
        },
      ));
    }

    return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(255),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContentPage(
                        title: data.creatorName,
                        creator: data,
                      )),
            );
            debugPrint(
                '${data.creatorName} tapped. Sets : ${data.nbSets} / ${data.sets.length}');
          },
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_pin),
                title: Text(
                  data.creatorName,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: Image.asset(data.avatar).image,
                      ),
                    ),
                  )),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 12.0)),
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
                children: originButtons,
              ),
            ],
          ),
        ));
  }
}
/*
body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: widget.creatorsData.length,
        itemBuilder: (BuildContext context, index) {
          String creatorKey = widget.creatorsData.keys.toList()[index];
          return CreatorCard(
              data: CreatorCardData.creatorCardDataWithAvatar(
                  creatorName: widget.creatorsData[creatorKey]["name"],
                  nbSets: widget.creatorsData[creatorKey]["sets"].length,
                  avatar: widget.creatorsData[creatorKey]["avatar"]));
        },
      ),
*/