import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_food/data/model/restaurant.dart';

class RestaurentInfoGetter {
  static Stream<List<Restaurant>> getAllData() => FirebaseFirestore.instance
      .collection('restaurents')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => fromJson(doc.data())).toList());

  static Restaurant fromJson(Map<String, dynamic> json) {
    return Restaurant(
      imageName: json['imageName'],
      id: json['id'],
      name: json['name'],
      rate: json['rate'],
    );
  }

  static Future<DocumentSnapshot> getRestaurentFromCollection(
      CollectionReference collection, String id) async {
    final listResDoc =
        await collection.snapshots().toList() as List<Map<String, dynamic>>;
    String firstId = listResDoc[0]['id'];

    return await collection.doc(firstId).get();
  }

  static Stream<List<Restaurant>> getListOfRestaurentStreamly(
      CollectionReference collection) {
    return collection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Restaurant.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  // static Future<Restaurant> getRestaurent(String id) async {
  //   Map<String, dynamic> json = await FirebaseFirestore.instance
  //       .collection('restaurents')
  //       .doc('BjW8fu6XXRPNhRe3x7Nk')
  //       .get() as Map<String, dynamic>;

  //   return fromJson(json);
  // }
}
