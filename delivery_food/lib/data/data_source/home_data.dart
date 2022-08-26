import 'package:delivery_food/data/model/comment.dart';
import 'package:delivery_food/data/model/restaurant.dart';

import '../model/menu.dart';

List<Dish> allMenu = [
  Dish(
      assetImage: 'assets/images/PhotoMenuItem1.png',
      id: 1,
      name: 'Herbal Pancake',
      ofRestaurant: 'Warung Herbal',
      comments: allComment,
      food: 'Cake',
      price: 7),
  Dish(
      assetImage: 'assets/images/PhotoMenuItem2.png',
      id: 2,
      name: 'Fruit Salad',
      ofRestaurant: 'Vegan Resto',
      comments: allComment,
      food: 'Dessert',
      price: 5),
  Dish(
      assetImage: 'assets/images/MenuPhotoItem3.png',
      id: 3,
      name: 'Green Noddle',
      ofRestaurant: 'Smart Resto',
      comments: allComment,
      food: 'Main Course',
      price: 35),
  Dish(

      assetImage: 'assets/images/MenuPhotoItem4.png',
      id: 4,
      name: 'SanWich Cake',
      ofRestaurant: 'Good Food',
      comments: allComment,
      food: 'Appetizer',
      price: 8),
  Dish(
      assetImage: 'assets/images/PhotoMenuItem5.png',
      id: 5,
      name: 'SanWich Cake',
      ofRestaurant: 'Good Food',
      comments: allComment,
      food: 'Cake',
      price: 12),
  Dish(
      assetImage: 'assets/images/PhotoMenuItem6.png',
      id: 6,
      name: 'Spacy fresh crab',
      ofRestaurant: 'Good Food',
      comments: allComment,
      food: 'Cake',
      price: 25),
  Dish(
      assetImage: 'assets/images/PhotoMenuItem7.png',
      id: 7,
      name: 'Phở',
      ofRestaurant: 'Good Food',
      comments: allComment,
      food: 'Soup',
      price: 20),
  Dish(
      assetImage: 'assets/images/PhotoMenuItem8.png',
      id: 8,
      name: 'Cơm Sườn',
      ofRestaurant: 'Good Food',
      comments: allComment,
      food: 'Main Course',
      price: 10)
];

List<Restaurant> allRestaurant = [
  Restaurant(
      assetImage: 'assets/images/ResturantImage1.png',
      deliveryTime: 12,
      id: 1,
      menu: allMenu,
      comments: allComment,
      name: 'Vegan Resto'),
  Restaurant(
      assetImage: 'assets/images/RestaurantImage2.png',
      deliveryTime: 8,
      id: 2,
      menu: allMenu,
      comments: allComment,
      name: 'Healthy Food'),
  Restaurant(
      assetImage: 'assets/images/RestaurantImage3.png',
      deliveryTime: 9,
      id: 3,
      menu: allMenu,
      comments: allComment,
      name: 'Good Food'),
  Restaurant(
      assetImage: 'assets/images/RestaurantImage4.png',
      deliveryTime: 20,
      id: 4,
      menu: allMenu,
      comments: allComment,
      name: 'Smart Resto'),
  Restaurant(
      assetImage: 'assets/images/RestaurantImage5.png',
      deliveryTime: 15,
      id: 5,
      menu: allMenu,
      comments: allComment,
      name: 'Healthy Food'),
  Restaurant(
      assetImage: 'assets/images/RestaurantImage6.png',
      deliveryTime: 10,
      menu: allMenu,
      comments: allComment,
      id: 6,
      name: 'Good Food'),
];

List<Comment> allComment = [
  Comment(
      name: 'Daniel Russell',
      date: '26 August 2022',
      description:
          'This Is great, So delicious! You Must Here, With Your family . . ',
      image: 'assets/images/AvatarRussell.png',
      start: '5'),
  Comment(
      name: 'Nghi Nguyen',
      date: '26 August 2022',
      description:
          'Món ăn quá dỡ Chê ... ',
      image: 'assets/images/AvatarNinja.png',
      start: '1'),
  Comment(
      name: 'Daniel Russell',
      date: '26 August 2022',
      description:
          'Chắc là không Giòn đâu .... ',
      image: 'assets/images/AvatarDefault.png',
      start: '5'),
  Comment(
      name: 'Daniel Russell',
      date: '26 August 2022',
      description:
          'This Is great, So delicious! You Must Here, With Your family . . ',
      image: 'assets/images/AvatarRussell.png',
      start: '5')
];
final List<String> assetsPayment = ['paypal.png', 'visa.png', 'payoneer.png'];
