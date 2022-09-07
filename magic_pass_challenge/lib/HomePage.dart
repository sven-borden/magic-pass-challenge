import 'package:flutter/material.dart';
import 'package:magic_pass_challenge/AddStation.dart';
import 'package:magic_pass_challenge/src/constants/Margins.dart';
import 'package:magic_pass_challenge/src/constants/Translation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String title = Translation.appTitle;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _addStation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddStationPage())
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: Margins.defaultMargin,
              child: const Text(Translation.homeMyScoreLabel),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStation,
        tooltip: Translation.homeFloatingActionAddStationTooltip,
        child: const Icon(Icons.add),
        heroTag: 'addStationHeroTag',
      ),
    );
  }
}