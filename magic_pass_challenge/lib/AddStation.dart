import 'package:flutter/material.dart';
import 'package:magic_pass_challenge/src/constants/Margins.dart';
import 'package:magic_pass_challenge/src/constants/Translation.dart';
import 'package:magic_pass_challenge/src/features/stations/FileStationDropDown.dart';

class AddStationPage extends StatefulWidget{
  const AddStationPage({super.key});

  final String title = Translation.addStationTitle;

  @override
  State<AddStationPage> createState() => _AddStationPageState();
}

class _AddStationPageState extends State<AddStationPage> {

  void _saveStation() {
    Navigator.pop(context);
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
          children: const <Widget>[
            FileStationDropDown(),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'addStationHeroTag',
        label: Row(
          children: const [Icon(Icons.save), Text(Translation.addStationSaveLabel)],
        ), onPressed: _saveStation,
      ),
    );
  }
}