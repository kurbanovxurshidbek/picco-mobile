import 'home_model_map.dart';

class FavouriteModel {
  final int id;
  final String favouriteName;
  final List<HomeModelMap> homes;
  final String rooms;

  const FavouriteModel({
    required this.rooms,
    required this.id,
    required this.favouriteName,
    required this.homes,
  });
}

///! data
List<FavouriteModel> favourites = const [
  FavouriteModel(
    id: 1,
    favouriteName: 'Houses Folder 1',
    homes: [
      HomeModelMap(
        id: 1,
        name: 'Home 1',
        mainImage: 'assets/images/1.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.311081,
          longitude: 69.240562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 2,
        name: 'Home 2',
        mainImage: 'assets/images/2.png',
        price: '300\$',
        geo: Geo(
          latitude: 41.331081,
          longitude: 69.240562,
        ),
        images: [],
      ),
    ], rooms: 'beds',
  ),
  FavouriteModel(
    id: 1,
    favouriteName: 'Houses Folder 3',
    homes: [
      HomeModelMap(
        id: 1,
        name: 'Home 1',
        mainImage: 'assets/images/1.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.315081,
          longitude: 69.240562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 2,
        name: 'Home 2',
        mainImage: 'assets/images/2.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.311081,
          longitude: 69.220562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 3,
        name: 'Home 3',
        mainImage: 'assets/images/3.png',
        price: '300\$',
        geo: Geo(
          latitude: 41.310081,
          longitude: 69.240562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 4,
        name: 'Home 4',
        mainImage: 'assets/images/4.png',
        price: '300\$',
        geo: Geo(
          latitude: 41.311881,
          longitude: 69.240562,
        ),
        images: [],
      ),
    ], rooms: 'bath',
  ),
  FavouriteModel(
    id: 1,
    favouriteName: 'Houses Folder 4',
    homes: [
      HomeModelMap(
        id: 1,
        name: 'Home 1',
        mainImage: 'assets/images/1.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.352081,
          longitude: 69.240562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 2,
        name: 'Home 2',
        mainImage: 'assets/images/2.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.311081,
          longitude: 69.247562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 3,
        name: 'Home 3',
        mainImage: 'assets/images/3.png',
        price: '300\$',
        geo: Geo(
          latitude: 41.311081,
          longitude: 69.200562,
        ),
        images: [],
      ),
    ], rooms: 'rooms',
  ),
  FavouriteModel(
    id: 1,
    favouriteName: 'Houses Folder 5',
    homes: [
      HomeModelMap(
        id: 1,
        name: 'Home 1',
        mainImage: 'assets/images/1.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.322081,
          longitude: 69.240562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 2,
        name: 'Home 2',
        mainImage: 'assets/images/2.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.333081,
          longitude: 69.240562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 3,
        name: 'Home 3',
        mainImage: 'assets/images/3.png',
        price: '300\$',
        geo: Geo(
          latitude: 41.312081,
          longitude: 69.220562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 4,
        name: 'Home 4',
        mainImage: 'assets/images/4.png',
        price: '200\$',
        geo: Geo(
          latitude: 41.311281,
          longitude: 69.241562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 5,
        name: 'Home 5',
        mainImage: 'assets/images/5.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.311281,
          longitude: 69.243562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 6,
        name: 'home 6',
        mainImage: 'assets/images/6.png',
        price: '300\$',
        geo: Geo(
          latitude: 41.311081,
          longitude: 69.24051262,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 1,
        name: 'Home 1',
        mainImage: 'assets/images/1.png',
        price: '100\$',geo: Geo(
        latitude: 41.3117081,
        longitude: 69.240562,
      ),

        images: [],
      ),
      HomeModelMap(
        id: 2,
        name: 'home 2',
        mainImage: 'assets/images/2.png',
        price: '300\$',
        geo: Geo(
          latitude: 41.351081,
          longitude: 69.240562,
        ),
        images: [],
      ),
    ], rooms: 'm.kv',
  ),
  FavouriteModel(
    id: 1,
    favouriteName: 'Houses Folder 2',
    homes: [
      HomeModelMap(
        id: 1,
        name: 'Home 1',
        mainImage: 'assets/images/1.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.355581,
          longitude: 69.240562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 2,
        name: 'Home 2',
        mainImage: 'assets/images/2.png',
        price: '300\$',
        geo: Geo(
          latitude: 41.311981,
          longitude: 69.249562,
        ),
        images: [],
      ),
    ], rooms: 'kitchens',
  ),
  FavouriteModel(
    id: 1,
    favouriteName: 'Houses Folder 2',
    homes: [
      HomeModelMap(
        id: 1,
        name: 'Home 1',
        mainImage: 'assets/images/1.png',
        price: '100\$',
        geo: Geo(
          latitude: 41.355581,
          longitude: 69.240562,
        ),
        images: [],
      ),
      HomeModelMap(
        id: 2,
        name: 'Home 2',
        mainImage: 'assets/images/2.png',
        price: '300\$',
        geo: Geo(
          latitude: 41.311981,
          longitude: 69.249562,
        ),
        images: [],
      ),
    ], rooms: 'kitchens',
  ),
];
