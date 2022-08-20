import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_food/data/model/restaurant.dart';

class RestaurentInfoGetter {
  static Stream<List<Restaurent>> getAllData() => FirebaseFirestore.instance
      .collection('restaurents')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => fromJson(doc.data())).toList());

  static Restaurent fromJson(Map<String, dynamic> json) {
    return Restaurent(
      imageName: json['imageName'],
      id: json['id'],
      name: json['name'],
    );
  }

  static Future<DocumentSnapshot> getRestaurentFromCollection(
      CollectionReference collection, String id) async {
    return await collection.doc(id).get();
  }

  // static Future<Restaurant> getRestaurent(String id) async {
  //   Map<String, dynamic> json = await FirebaseFirestore.instance
  //       .collection('restaurents')
  //       .doc('BjW8fu6XXRPNhRe3x7Nk')
  //       .get() as Map<String, dynamic>;

  //   return fromJson(json);
  // }
}
