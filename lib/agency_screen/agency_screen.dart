import 'package:flutter/material.dart';
import 'package:santhe/model/agency.dart';
import '../db/db_helper.dart';

class AgencyScreen extends StatelessWidget {
  const AgencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agencies'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
      body: FutureBuilder(
        future: DBHelper.fetchAgencyList(),
        builder: (BuildContext context, AsyncSnapshot<List<Agency>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var agencyList = snapshot.data!;
              agencyList.sort(
                (a, b) => a.aname!.toLowerCase().toString().compareTo(
                      b.aname!.toLowerCase().toString(),
                    ),
              );
              return ListView(
                children: agencyList
                    .map(
                      (agency) => Card(
                        child: ListTile(
                          title: Text("Agency Name: " + agency.aname!),
                          subtitle: Text("Address: " + agency.address!),
                        ),
                      ),
                    )
                    .toList(),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: Text('Something went wrong'),
          );
        },
      ),
    );
  }
}
