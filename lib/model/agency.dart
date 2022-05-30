class Agency {
  final int aid;
  final String aname, address;
  final double lat, long;

  Agency({
    required this.aid,
    required this.aname,
    required this.address,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toMap() {
    return {
      'aid': aid,
      'aname': aname,
      'address': address,
      'lat': lat,
      'long': long,
    };
  }

  final List<Agency> _listAgency = [
    Agency(
      aid: 1,
      aname: 'ABC',
      address: 'HSR Layout,Bengaluru',
      lat: 12.912,
      long: 77.644,
    ),
    Agency(
      aid: 2,
      aname: 'DEF',
      address: 'Kengeri,Bengaluru',
      lat: 12.899,
      long: 77.482,
    ),
    Agency(
      aid: 3,
      aname: 'GHI',
      address: 'Electronic City,Bengaluru',
      lat: 12.843,
      long: 77.656,
    ),
    Agency(
      aid: 4,
      aname: 'JKL',
      address: 'Anna Nagar,Chennai',
      lat: 13.085,
      long: 80.210,
    ),
    Agency(
      aid: 5,
      aname: 'MNO',
      address: 'Basant Nagar,Chennai',
      lat: 13.000,
      long: 80.266,
    ),
    Agency(
      aid: 6,
      aname: 'PQR',
      address: 'Mysore Palace,Mysore',
      lat: 12.305,
      long: 76.655,
    )
  ];

  List<Agency> get agencies {
    return [..._listAgency];
  }
}
