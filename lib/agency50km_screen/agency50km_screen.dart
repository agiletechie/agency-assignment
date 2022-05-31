import 'package:flutter/material.dart';
import 'package:santhe/model/agency.dart';
import '../home_screen/home_screen.dart';

class Agency50KmScreen extends StatelessWidget {
  final List<Agency> agencyList;
  const Agency50KmScreen({
    Key? key,
    required this.agencyList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agencies within 50Km'),
      ),
      body: ListView.builder(
        itemCount: agencyList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("Agency Name: " + agencyList[index].aname!),
              subtitle: Text("Address: " + agencyList[index].address!),
            ),
          );
        },
      ),
    );
  }
}
