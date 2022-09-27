import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  List stationData = [];

  Future<void> getStationData() async {
    final String response = await rootBundle.loadString('lib/src/constants/stations.json');
    final data = await json.decode(response);

    setState(() {
      stationData = data["stations"];
    });

  }

  @override
  void initState() {
    super.initState();
    getStationData();
  }

  void _saveStation() {
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(25),
          child: stationData.isNotEmpty
              ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: stationData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Text(stationData[index]["id"].toString()),
                        title: Text(stationData[index]["name"]),
                        subtitle: Text(stationData[index]["canton"]),
                      ),
                    );
                  },
                ),
              )
            ],
          )
              : const Center(child: CircularProgressIndicator())
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