import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:picco/models/home_model.dart';
import 'package:picco/models/user_model.dart';

class FirestoreService {
  static final _instance = FirebaseFirestore.instance;

  static const String usersFolder = 'users';
  static const String homesFolder = 'homes';

  // * User Related
  static Future<void> storeUser(UserModel user) async {
    _instance.collection(usersFolder).doc(user.id).set(user.toJson());
  }

  // * House Related
  static Future<void> storeHouse(HomeModel house) async {
    final sellType = homeSellType[house.sellType];
    final categoryType = homeCategoryType[house.homeType];

    final query = _instance
        .collection(homesFolder)
        .doc(sellType!)
        .collection(categoryType!);

    house.id = query.doc().id;

    await query.doc(house.id).set(house.toJson());
  }

  static Future<List<HomeModel>> getHouses({
    required String sellType,
    required String categoryType,
  }) async {
    List<HomeModel> houses = [];

    var querySnapshot = await _instance
        .collection(homesFolder)
        .doc(sellType)
        .collection(categoryType)
        .get();

    for (var element in querySnapshot.docs) {
      houses.add(HomeModel.fromJson(element.data()));
    }

    return houses;
  }

  static Future<List<HomeModel>> getCountryHouses({
    required String sellType,
    required String categoryType,
    required String country,
  }) async {
    List<HomeModel> houses = [];

    var querySnapshot = await _instance
        .collection(homesFolder)
        .doc(sellType)
        .collection(categoryType)
        .orderBy('city')
        .startAt([country]).endAt([country + '\uf8ff']).get();

    for (var element in querySnapshot.docs) {
      houses.add(HomeModel.fromJson(element.data()));
    }

    return houses;
  }
}
