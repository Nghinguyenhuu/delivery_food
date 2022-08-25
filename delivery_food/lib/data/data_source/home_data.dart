import 'package:delivery_food/data/model/restaurant.dart';

import '../model/menu.dart';


List<Dish> allMenu = [
  Dish(
      assetImage: 'assets/images/PhotoMenuItem1.png',
      id: 1,
      name: 'Herbal Pancake',
      ofRestaurant: 'Warung Herbal',
      price: 7),
  Dish(
      assetImage: 'assets/images/PhotoMenuItem2.png',
      id: 2,
      name: 'Herbal Pancake',
      ofRestaurant: 'Warung Herbal',
      price: 7),
  Dish(
      assetImage: 'assets/images/MenuPhotoItem3.png',
      id: 3,
      name: 'Herbal Pancake',
      ofRestaurant: 'Warung Herbal',
      price: 7),
  Dish(
      assetImage: 'assets/images/MenuPhotoItem1.png',
      id: 4,
      name: 'Herbal Pancake',
      ofRestaurant: 'Warung Herbal',
      price: 7)
];


List<Restaurant> allRestaurant = [
  Restaurant(
      assetImage: 'assets/images/ResturantImage1.png',
      deliveryTime: 12,
      id: 1,
      menu: allMenu,
      name: 'Vegan Resto'),
      
  Restaurant(
      assetImage: 'assets/images/RestaurantImage2.png',
      deliveryTime: 8,
      id: 2,
      menu: allMenu,
      name: 'Healthy Food'),
  Restaurant(
      assetImage: 'assets/images/RestaurantImage3.png',
      deliveryTime: 9,
      id: 3,
      menu: allMenu,
      name: 'Good Food'),
  Restaurant(
      assetImage: 'assets/images/RestaurantImage4.png',
      deliveryTime: 20,
      id: 4,
      menu: allMenu,
      name: 'Smart Resto'),
  Restaurant(
      assetImage: 'assets/images/RestaurantImage5.png',
      deliveryTime: 15,
      id: 5,
      menu: allMenu,
      name: 'Healthy Food'),
  Restaurant(
      assetImage: 'assets/images/RestaurantImage6.png',
      deliveryTime: 10,
      menu: allMenu,
      id: 6,
      name: 'Good Food'),
];


final List<String> assetsPayment = ['paypal.png', 'visa.png', 'payoneer.png'];
