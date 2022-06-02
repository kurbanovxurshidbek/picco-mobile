class SimilarAdsModel {
  final int id;
  final String image;
  final String locationName;
  final String prise;
  bool liked;
  final String space;
  final int roomsCount;

  SimilarAdsModel({
    required this.id,
    required this.image,
    required this.locationName,
    required this.prise,
    required this.liked,
    required this.space,
    required this.roomsCount,
  });

  @override
  String toString() {
    return 'SimilarAdsModel{id: $id,'
        'image: $image,'
        'locationName: $locationName,'
        'prise: $prise,'
        'liked: $liked,'
        'space: $space,'
        'roomsCount: $roomsCount}';
  }
}

List<SimilarAdsModel> simAdsData = [
  SimilarAdsModel(
      id: 1,
      image: 'assets/images/hotel.jpg',
      locationName: 'Yunusobod tumani',
      prise: '\$5800',
      liked: false,
      space: '2000m',
      roomsCount: 3),
  SimilarAdsModel(
      id: 2,
      image: 'assets/images/hotel.jpg',
      locationName: 'Yunusobod tumani',
      prise: '\$5800',
      liked: false,
      space: '2000m',
      roomsCount: 3),
  SimilarAdsModel(
      id: 3,
      image: 'assets/images/hotel.jpg',
      locationName: 'Yunusobod tumani',
      prise: '\$5800',
      liked: false,
      space: '2000m',
      roomsCount: 3),
];
