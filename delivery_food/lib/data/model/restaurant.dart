import 'package:delivery_food/data/model/comment.dart';
import 'package:delivery_food/data/model/menu.dart';

class Restaurant {
  final int id;
  final String name;
  final String assetImage;
  final int deliveryTime;
  final List<Dish> menu;
  final List<Comment> comments;

  const Restaurant( 
      {required this.comments,required this.menu,required this.assetImage, required this.deliveryTime, required this.id,required this.name});
}
