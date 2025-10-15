class TravelModels {
  String name;
  String image;
  String location;
  String description;
  String distance;
  int temp;
  double rate;
  int price;

  TravelModels({
    required this.name,
    required this.image,
    required this.location,
    required this.description,
    required this.distance,
    required this.temp,
    required this.rate,
    required this.price,
  });
}

List<TravelModels> travelList = [
  TravelModels(
    name: 'New York',
    image: 'assets/images/1.jpg',
    location: 'us',
    distance: '500',
    temp: 23,
    rate: 4.3,
    price: 2100,
    description: 'new york is the most beautiful city in america and the world',
  ),
  TravelModels(
    name: 'Edinburgh',
    image: 'assets/images/2.jpg',
    location: 'uk',
    distance: '1200',
    temp: 12,
    rate: 4.9,
    price: 6100,
    description: 'Edinburgh is the most beautiful city in uk and the world',
  ),
  TravelModels(
    name: 'Los Angeles',
    image: 'assets/images/3.jpg',
    location: 'us',
    distance: '500',
    temp: 34,
    rate: 4,
    price: 1100,
    description: 'Los Angeles is the most beautiful city in usa and the world',
  ),
  TravelModels(
    name: 'London',
    image: 'assets/images/1.jpg',
    location: 'uk',
    distance: '1450',
    temp: 13,
    rate: 2.3,
    price: 3100,
    description: 'London is the most beautiful city in uk and the world',
  ),
];
