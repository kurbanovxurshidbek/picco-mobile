class HomeModelMap {
  final int id;
  final String name;
  final String mainImage;
  final String price;
  final Geo geo;
  final List<String> images;

  const HomeModelMap({
    required this.id,
    required this.name,
    required this.mainImage,
    required this.price,
    required this.geo,
    required this.images,
  });

  @override
  String toString() {
    return 'HomeModelMap{id: $id, name: $name, mainImage: $mainImage, price: $price, geo: $geo, images: $images}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeModelMap &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          mainImage == other.mainImage &&
          price == other.price &&
          geo == other.geo &&
          images == other.images;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      mainImage.hashCode ^
      price.hashCode ^
      geo.hashCode ^
      images.hashCode;
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

List<HomeModelMap> homeModels = [
  const HomeModelMap(
    id: 1,
    name: 'House 1',
    mainImage: 'assets/images/khiva.jpg',
    price: "\$200",
    geo: Geo(
      latitude: 41.311081,
      longitude: 69.240562,
    ),
    images: [
      'assets/images/khiva.jpg',
      'assets/images/tashkent.jpg',
      'assets/images/samarkand.jpg',
      'assets/images/tashkent.jpg',
    ],
  ),
  const HomeModelMap(
    id: 2,
    name: 'House 2',
    mainImage: 'assets/images/tashkent.jpg',
    price: "\$500",
    geo: Geo(
      latitude: 41.321081,
      longitude: 69.240562,
    ),
    images: [
      'assets/images/khiva.jpg',
      'assets/images/tashkent.jpg',
      'assets/images/samarkand.jpg',
      'assets/images/tashkent.jpg',
    ],
  ),
  const HomeModelMap(
    id: 3,
    name: 'House 3',
    mainImage: 'assets/images/khiva.jpg',
    price: "\$220",
    geo: Geo(
      latitude: 41.311081,
      longitude: 69.26562,
    ),
    images: [
      'assets/images/khiva.jpg',
      'assets/images/tashkent.jpg',
      'assets/images/samarkand.jpg',
      'assets/images/tashkent.jpg',
    ],
  ),
  const HomeModelMap(
    id: 4,
    name: 'House 4',
    mainImage: 'assets/images/khiva.jpg',
    price: "\$250",
    geo: Geo(
      latitude: 41.311081,
      longitude: 69.230562,
    ),
    images: [
      'assets/images/khiva.jpg',
      'assets/images/tashkent.jpg',
      'assets/images/samarkand.jpg',
      'assets/images/tashkent.jpg',
    ],
  ),
  const HomeModelMap(
    id: 5,
    name: 'House 5',
    mainImage: 'assets/images/tashkent.jpg',
    price: "\$300",
    geo: Geo(
      latitude: 41.312081,
      longitude: 69.250562,
    ),
    images: [
      'assets/images/khiva.jpg',
      'assets/images/tashkent.jpg',
      'assets/images/samarkand.jpg',
      'assets/images/tashkent.jpg',
    ],
  ),
];
