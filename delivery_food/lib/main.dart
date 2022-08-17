import 'package:delivery_food/authenticated/details/restaurant_detail.dart';
import 'package:delivery_food/data/cloud_database/phu_test_page.dart';
import 'package:delivery_food/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Scaffold(),
      // home: const RestaurantDetail(isRestaurant: true),
      home: TestPage(),
      // initialRoute: RouteGenerator.splash,
      // onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
