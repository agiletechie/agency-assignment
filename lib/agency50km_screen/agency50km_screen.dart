import 'package:flutter/material.dart';
import 'package:santhe/model/agency.dart';

class Agency50KmScreen extends StatelessWidget {
  final Future<List<Agency>> onGetAgencies50;
  const Agency50KmScreen({
    Key? key,
    required this.onGetAgencies50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agencies within 50Km'),
      ),
      body: FutureBuilder(
        future: onGetAgencies50,
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
