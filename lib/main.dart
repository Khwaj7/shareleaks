import 'package:flutter/material.dart';

import 'item_card_data.dart';
import 'item_card_layout_grid.dart';

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
          childAspectRatio: .7,
          crossAxisCount: 1,
          scrollDirection: Axis.vertical,
          children: [
            ItemCardLayoutGrid(
              crossAxisCount: 2,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                const ItemCardData(data: 'test'),
                const ItemCardData(data: 'test'),
                const ItemCardData(data: 'test'),
                const ItemCardData(data: 'test')
              ],
            )
          ],
        ));
  }
}
