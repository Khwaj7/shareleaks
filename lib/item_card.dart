import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({data: String});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.arrow_drop_down_circle),
              title: const Text('Card title 1'),
              subtitle: Text(
                'Secondary Text',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
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
            Image.asset('assets/card-sample-image-2.jpg'),
          ],
        ),
      ),
    );
  }
}
