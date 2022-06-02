class FirebaseHouseModel {
  String? id;
  final String sellType;
  final String homeType;
  final String city;
  final String district;
  final String street;
  final Geo geo;
  final List<bool> houseConveniences;
  final String bedsCount;
  final String bathCount;
  final String roomsCount;
  final String houseSize;
  final List<String> houseImages;

  FirebaseHouseModel({
    this.id,
    required this.sellType,
    required this.homeType,
    required this.city,
    required this.district,
    required this.street,
    required this.geo,
    required this.houseConveniences,
    required this.bedsCount,
    required this.bathCount,
    required this.roomsCount,
    required this.houseSize,
    required this.houseImages,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sellType': sellType,
      'homeType': homeType,
      'city': city,
      'district': district,
      'street': street,
      'geo': geo.toJson(),
      'houseConveniences': houseConveniences,
      'bedsCount': bedsCount,
      'bathCount': bathCount,
      'roomsCount': roomsCount,
      'houseSize': houseSize,
      'houseImages': houseImages,
    };
  }

  factory FirebaseHouseModel.fromJson(Map<String, dynamic> json) {
    return FirebaseHouseModel(
      id: json['id'] as String,
      sellType: json['sellType'] as String,
      homeType: json['homeType'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      street: json['street'] as String,
      geo: Geo.fromJson(json['geo']),
      houseConveniences: json['houseConveniences'] as List<bool>,
      bedsCount: json['bedsCount'] as String,
      bathCount: json['bathCount'] as String,
      roomsCount: json['roomsCount'] as String,
      houseSize: json['houseSize'] as String,
      houseImages: json['houseImages'] as List<String>,
    );
  }

  @override
  String toString() {
    return 'FirebaseHouseModel{'
        'id: $id,'
        'sellType: $sellType,'
        'homeType: $homeType,'
        'city: $city,'
        'district: $district,'
        'street: $street,'
        'geo: $geo,'
        'houseConveniences: $houseConveniences,'
        'bedsCount: $bedsCount,'
        'bathCount: $bathCount,'
        'roomsCount: $roomsCount,'
        'houseSize: $houseSize,'
        'houseImages: $houseImages}';
  }
}

class Geo {
  final double latitude;
  final double longitude;

  const Geo({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  @override
  String toString() {
    return 'Geo{ latitude: $latitude, longitude: $longitude, }';
  }
}

const houseSellType = {
  'Buy Houses': 'buy_houses',
  'Rent Houses': 'rent_houses',
};

const houseCategoryType = {
  'House': 'house',
  'Buildings for business': 'buildings_for_business',
  'New Building': 'new_building',
  'Country Houses': 'country_houses',
  'Cottage': 'cottage',
  'Hotel': 'hotel',
};