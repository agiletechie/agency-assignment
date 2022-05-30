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
}
