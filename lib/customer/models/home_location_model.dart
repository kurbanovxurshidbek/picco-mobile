class HomeLocationModel {
  final int id;
  final String prise;
  final Geo geo;

  const HomeLocationModel({
    required this.id,
    required this.prise,
    required this.geo,
  });

  factory HomeLocationModel.fromJson(Map<String, dynamic> json) {
    return HomeLocationModel(
      id: json['id'] as int,
      prise: json['prise'] as String,
      geo: json['geo'] as Geo,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'prise': prise,
    'geo': geo,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is HomeLocationModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              prise == other.prise &&
              geo == other.geo);

  @override
  int get hashCode => prise.hashCode ^ geo.hashCode;

  @override
  String toString() {
    return 'HomeLocationModel{ id: $id, prise: $prise, geo: $geo, }';
  }
}

class Geo {
  final double latitude;
  final double longitude;

  const Geo({
    required this.latitude,
    required this.longitude,
  });

  factory Geo.fromMap(Map<String, dynamic> json) {
    return Geo(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  Map<String, dynamic> toMap() => {
    'latitude': latitude,
    'longitude': longitude,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Geo &&
              runtimeType == other.runtimeType &&
              latitude == other.latitude &&
              longitude == other.longitude);

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() {
    return 'Geo{ latitude: $latitude, longitude: $longitude, }';
  }
}

List<HomeLocationModel> homes = [
  const HomeLocationModel(
    id: 1,
    prise: '100\$',
    geo: Geo(
      latitude: 41.311081,
      longitude: 69.240562,
    ),
  ),
  const HomeLocationModel(
    id: 2,
    prise: '200\$',
    geo: Geo(
      latitude: 41.312081,
      longitude: 69.230562,
    ),
  ),
  const HomeLocationModel(
    id: 3,
    prise: '350\$',
    geo: Geo(
      latitude: 41.313081,
      longitude: 69.220562,
    ),
  ),
  const HomeLocationModel(
    id: 4,
    prise: '50\$',
    geo: Geo(
      latitude: 41.314081,
      longitude: 69.210562,
    ),
  ),
  const HomeLocationModel(
    id: 5,
    prise: '555\$',
    geo: Geo(
      latitude: 41.315081,
      longitude: 69.200562,
    ),
  ),
];