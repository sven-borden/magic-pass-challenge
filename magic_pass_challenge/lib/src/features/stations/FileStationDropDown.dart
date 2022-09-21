
import 'package:flutter/material.dart';

class FileStationDropDown extends StatefulWidget {
  const FileStationDropDown({super.key});

  @override
  State<FileStationDropDown> createState() => _FileStationDropDownState();
}

const List<String> stationList = <String>['One', 'Two', 'Three', 'Four'];

class _FileStationDropDownState extends State<FileStationDropDown> {
  String dropdownValue = stationList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: stationList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}