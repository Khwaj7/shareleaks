import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'item_card_data.dart';

final Uri _url = Uri.parse('https://flutter.dev');

@immutable
class ItemCard extends StatelessWidget {
  final ItemCardData data;

  const ItemCard({Key? key, required this.data}) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(data.originUrl))) {
      throw 'Could not launch $Uri.parse(data.originUrl)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_pin),
            title: Text(data.creatorName),
            subtitle: InkWell(
              onTap: _launchUrl,
              child: Text('source: ${data.origin}',
                  style: const TextStyle(color: Colors.blue)),
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
                  'Added on ${data.uploadDate.year}-${data.uploadDate.month}-${data.uploadDate.day}',
                  style: TextStyle(color: Colors.black.withOpacity(0.6))),
              const Spacer(),
              Text(
                  textAlign: TextAlign.right,
                  '${data.nbElements} elements',
                  style: TextStyle(color: Colors.black.withOpacity(0.6))),
              const Padding(padding: EdgeInsets.all(8.0)),
            ],
          ),

          /*
          Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Colors.red,
                      child: Text(
                          textAlign: TextAlign.left,
                          '${data.uploadDate.year}-${data.uploadDate.month}-${data.uploadDate.day}',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6))),
                    ),
                  ),



            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  textColor: const Color(0xFF6200EE),
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('ACTION 1'),
                ),
                FlatButton(
                  textColor: const Color(0xFF6200EE),
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('ACTION 2'),
                ),
              ],
            ),
            //Image.asset('assets/card-sample-image.jpg'),
            */
        ],
      ),
    );
  }
}
