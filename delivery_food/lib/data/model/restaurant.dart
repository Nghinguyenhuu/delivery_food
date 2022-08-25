import 'package:delivery_food/data/model/menu.dart';

class Restaurant {
  final int id;
  final String name;
  final String assetImage;
  final int deliveryTime;
  final List<Dish> menu ;

  const Restaurant(
      {required this.menu,required this.assetImage, required this.deliveryTime, required this.id,required this.name});
}
