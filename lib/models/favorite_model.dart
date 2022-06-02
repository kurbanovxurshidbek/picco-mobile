import 'home_model.dart';

class FavouriteModel {
  final int id;
  final String favouriteName;
  final List<HomeModel> homes;
  final String rooms;

  const FavouriteModel({
    required this.rooms,
    required this.id,
    required this.favouriteName,
    required this.homes,
  });
}

///! data
List<FavouriteModel> favourites = const [];