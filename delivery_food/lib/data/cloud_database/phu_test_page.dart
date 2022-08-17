import 'package:delivery_food/data/cloud_database/get_firestore_image.dart';
import 'package:delivery_food/data/cloud_database/restaurent_getter.dart';
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
        Text(RestaurentInfoGetter.GetAllData().toString()),
      ]),
    );
  }
}
