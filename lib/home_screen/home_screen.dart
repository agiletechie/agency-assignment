import 'package:flutter/material.dart';
import 'package:santhe/agency50km_screen/agency50km_screen.dart';
import 'package:santhe/agency_screen/agency_screen.dart';
import '../model/agency.dart';
import 'components/input_field.dart';
import 'package:geocoding/geocoding.dart';
import '../db/db_helper.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initDB();
  }

  void initDB() async {
    try {
      await DBHelper.createDB();
      // await DBHelper.insertAgencyData();
      // await DBHelper.fetchAgencyList();
    } catch (e) {
      print(e);
    }
  }

  void _saveForm() {
    _formState.currentState?.save();
  }

  Future<List<Agency>> getAgenciesWithin50(String address) async {
    final newList = <Agency>[];
    double startLatitude, startLongitude;
    late List<Location> coord;
    try {
      coord = await locationFromAddress(address, localeIdentifier: 'en_IN');
    } catch (e) {
      print("Coord fail:" + e.toString());
    }
    print(coord);
    // List<Placemark> addr = await placemarkFromCoordinates(12.912, 77.644,
    //     localeIdentifier: 'en_IN');
    List<Agency>? agencyList = await DBHelper.fetchAgencyList();
    startLatitude = double.parse(coord[0].latitude.toStringAsFixed(3));
    startLongitude = double.parse(coord[0].longitude.toStringAsFixed(3));

    for (final agency in agencyList!) {
      double distance = Geolocator.distanceBetween(
        startLatitude,
        startLongitude,
        agency.lat!,
        agency.long!,
      );

      if ((distance * 0.001) <= 50) {
        newList.add(agency);
      }
    }
    // print(newList[0].address! + newList[1].address! + newList[2].address!);
    return newList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Santhe'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AgencyScreen(),
            ),
          );
        },
        child: const Text('List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32.0),
            Form(
              key: _formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  InputField(
                    labelText: 'Enter Phone',
                    inputType: TextInputType.phone,
                    onSaved: (val) {
                      print("phone: " + val!);
                    },
                  ),
                  const SizedBox(height: 16.0),
                  InputField(
                    labelText: 'Enter Address',
                    inputType: TextInputType.text,
                    onSaved: (val) async {
                      // final list = await getAgenciesWithin50(val.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Agency50KmScreen(
                              onGetAgencies50: getAgenciesWithin50(val!)),
                        ),
                      );
                      print("address" + val.toString());
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      _saveForm();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Get Agency'),
                    ),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
