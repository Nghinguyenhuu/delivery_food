import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_food/data/cloud_database/get_firestore_image.dart';
import 'package:delivery_food/data/cloud_database/restaurent_getter.dart';
import 'package:delivery_food/data/model/restaurant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    final restaurentsCollection =
        FirebaseFirestore.instance.collection('restaurents');
    final listResDoc = restaurentsCollection
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Restaurant.fromJson(doc.data())))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Testpage")),
      // body: Column(children: [
      //   Text("fir"),
      // ListView.builder(
      //     // itemCount: restaurents.length,
      //     itemCount: 2,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Card(
      //           child: ListTile(
      //               leading: Icon(Icons.add), title: Text(index.toString())));
      //       // return RestaurentBuilderForTestOnly(
      //       //     restaurent: restaurents[index]);
      //     }),
      body: StreamBuilder<List<Restaurant>>(
        stream: RestaurentInfoGetter.getListOfRestaurentStreamly(
            restaurentsCollection),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final restaurents = snapshot.data!;
            return ListView.builder(
                // itemCount: restaurents.length,
                scrollDirection: Axis.vertical,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  // return ListTile(title: Text(index.toString()));
                  return RestaurentBuilderForTestOnly(
                      restaurent: restaurents[index]);
                });
            // return RestaurentBuilderForTestOnly(restaurent: restaurents[0]);
            // return Text(restaurents[0].name.toString());
          }
          return Text("restaurents data not loaded");
        }),
      ),
      // body: FutureBuilder<Image>(
      //     future: FireStorageService.getImage(context, "PhotoRestaurant.png"),
      //     builder: ((context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         return Container(child: snapshot.data);
      //       }
      //       return Text("image not loaded");
      //     })),
      // RestaurentBuilderForTestOnly(
      //   restaurent: Restaurent(
      //     id: "asdfasdf",
      //     name: "gigo",
      //     imageName: "PhotoRestaurent.png",
      //     rate: 5,
      //   ),
      // ),
      // ]
      // ),
    );
  }
}

class RestaurentBuilderForTestOnly extends StatelessWidget {
  final Restaurant restaurent;
  const RestaurentBuilderForTestOnly({Key? key, required this.restaurent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(restaurent.id),
      Text(restaurent.name),
      Text(restaurent.rate.toString() + "rating"),
      FutureBuilder<Image>(
          future: FireStorageService.getImage(context, restaurent.imageName),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(child: snapshot.data);
            }
            return Text("image not loaded");
          }))
    ]);
  }
}
