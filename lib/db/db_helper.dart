import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import '../model/agency.dart';

class DBHelper {
  static sql.Database? agencyDB;
  static Future<void> createDB() async {
    String dbFullPath = path.join(await sql.getDatabasesPath(), 'agency_db.db');
    agencyDB =
        await sql.openDatabase(dbFullPath, version: 1, onCreate: (db, version) {
      return db.execute('Create table LPGAgency('
          'aid integer primary key,'
          'aname Text,'
          'address Text,'
          'lat double,'
          'long double)');
    });
  }

  static Future<void> insertAgencyData() async {
    // final agency = Agency();
    if (agencyDB != null) {
      print('Hwe');
      for (var item in Agency.agencies) {
        await agencyDB!.insert(
          'LPGAgency',
          item.toMap(),
        );
      }
    }
  }

  static Future<List<Agency>?> fetchAgencyList() async {
    final List<Map<String, dynamic>> dbData;
    if (agencyDB != null) {
      dbData = await agencyDB!.query('LPGAgency');
      return List.generate(
        dbData.length,
        (index) => Agency(
          aid: dbData[index]['aid'],
          aname: dbData[index]['aname'],
          address: dbData[index]['address'],
          lat: dbData[index]['lat'],
          long: dbData[index]['long'],
        ),
      );
    }
    return null;
  }
}
