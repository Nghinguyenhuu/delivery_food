import 'package:delivery_food/data/model/comment.dart';

class Dish {
  int id;
  String assetImage;
  String name;
  String ofRestaurant;
  List<Comment> comments;
  int price;
  String food;

  Dish(
      {required this.assetImage,
      required this.comments,
      required this.id,
      required this.name,
      required this.ofRestaurant,
      required this.price,
      required this.food});
}
