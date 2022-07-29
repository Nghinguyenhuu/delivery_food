import 'package:delivery_food/data/model/restaurant.dart';

import '../model/menu.dart';

List<Restaurant> allRestaurant = [
   Restaurant(assetImage: 'assets/images/Logo.png', deliveryTime: 12, id: 1),
   Restaurant(assetImage: 'assets/images/Logo.png', deliveryTime: 12, id: 2),
   Restaurant(assetImage: 'assets/images/Logo.png', deliveryTime: 12, id: 3),
   Restaurant(assetImage: 'assets/images/Logo.png', deliveryTime: 12, id: 4),
];

List<Menu> allMenu = [
  Menu(assetImage:'assets/images/MenuPhoto.png' , id: 1, name: 'Herbal Pancake', ofRestaurant: 'Warung Herbal', price: 7),
  Menu(assetImage:'assets/images/MenuPhoto.png' , id: 2, name: 'Herbal Pancake', ofRestaurant: 'Warung Herbal', price: 7),
  Menu(assetImage:'assets/images/MenuPhoto.png' , id: 3, name: 'Herbal Pancake', ofRestaurant: 'Warung Herbal', price: 7),
  Menu(assetImage:'assets/images/MenuPhoto.png' , id: 4, name: 'Herbal Pancake', ofRestaurant: 'Warung Herbal', price: 7)
];