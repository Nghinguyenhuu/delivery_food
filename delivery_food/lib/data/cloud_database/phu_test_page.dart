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

    return Scaffold(
      appBar: AppBar(title: const Text("Testpage")),
      body: Column(children: [
        FutureBuilder<Image>(
          future: FireStorageService.getImage(context, "PhotoRestaurant.png"),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // return Text(snapshot.data.toString());
              return Container(
                child: snapshot.data,
              );
            }
            return Text("loading not done");
          }),
        ),
        Text("Things done"),
        // StreamBuilder<List<Restaurant>>(
        //   stream: RestaurentInfoGetter.getAllData(),
        //   builder: ((context, snapshot) {
        //     if (snapshot.hasData) {
        //       final restaurents = snapshot.data!;
        //       return Text(restaurents.length.toString());
        //     } else {
        //       return Text("restaurents data not loaded");
        //     }
        //   }),
        // )
        FutureBuilder(
            future: RestaurentInfoGetter.getRestaurentFromCollection(
                restaurentsCollection, 'BjW8fu6XXRPNhRe3x7Nk'),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something wrong!");
              }
              // if (snapshot.hasData && !snapshot.data!.exists) {
              //   return Text("Document doesn't exists");
              // }
              if (snapshot.connectionState == ConnectionState.done) {
                final json = snapshot.data!.data() as Map<String, dynamic>;
                final res = Restaurent.fromJson(json);
                return Text(res.name);
              }

              return Text("null something");
            })
      ]),
    );
  }
}
