class HomeModelList {
  final int id;
  final String name;
  final String image;
  final String prise;

  const HomeModelList({
    required this.id,
    required this.name,
    required this.image,
    required this.prise,
  });
}

///! data
List<HomeModelList> homesData = const [
  HomeModelList(
    id: 1,
    name: 'home 1',
    image: 'assets/images/1.png',
    prise: '100\$',
  ),
  HomeModelList(
    id: 2,
    name: 'home 2',
    image: 'assets/images/2.png',
    prise: '100\$',
  ),
  HomeModelList(
    id: 3,
    name: 'home 3',
    image: 'assets/images/3.png',
    prise: '300\$',
  ),
  HomeModelList(
    id: 4,
    name: 'home 4',
    image: 'assets/images/4.png',
    prise: '200\$',
  ),
  HomeModelList(
    id: 5,
    name: 'home 5',
    image: 'assets/images/5.png',
    prise: '100\$',
  ),
  HomeModelList(
    id: 6,
    name: 'home 6',
    image: 'assets/images/6.png',
    prise: '300\$',
  ),
];