import 'package:delivery_food/data/model/restaurant.dart';

import '../model/menu.dart';

List<Restaurant> allRestaurant = [
  Restaurant(
      imageName: 'assets/images/Logo.png',
      id: '1',
      name: 'Herbal Pancake',
      rate: 5),
  Restaurant(
      imageName: 'assets/images/Logo.png',
      id: '2',
      name: 'Herbal Pancake',
      rate: 5),
  Restaurant(
      imageName: 'assets/images/Logo.png',
      id: '3',
      name: 'Herbal Pancake',
      rate: 5),
  Restaurant(
      imageName: 'assets/images/Logo.png',
      id: '4',
      name: 'Herbal Pancake',
      rate: 5),
];

List<Dish> allMenu = [
  Dish(
      imageName: 'assets/images/MenuPhoto.png',
      id: '1',
      name: 'Herbal Pancake',
      ofRestaurant: 'Warung Herbal',
      deliveryTime: 12,
      price: 7),
  Dish(
      imageName: 'assets/images/MenuPhoto.png',
      id: '2',
      name: 'Herbal Pancake',
      deliveryTime: 12,
      ofRestaurant: 'Warung Herbal',
      price: 7),
  Dish(
      imageName: 'assets/images/MenuPhoto.png',
      id: '3',
      name: 'Herbal Pancake',
      deliveryTime: 12,
      ofRestaurant: 'Warung Herbal',
      price: 7),
  Dish(
      imageName: 'assets/images/MenuPhoto.png',
      id: '4',
      name: 'Herbal Pancake',
      ofRestaurant: 'Warung Herbal',
      deliveryTime: 12,
      price: 7)
];
