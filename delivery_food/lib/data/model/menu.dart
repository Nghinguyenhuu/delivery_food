class Dish {
  int id;
  String imageName;
  String name;
  String ofRestaurant;
  int price;
  final int deliveryTime;

  Dish(
      {required this.imageName,
      required this.deliveryTime,
      required this.id,
      required this.name,
      required this.ofRestaurant,
      required this.price});
}
