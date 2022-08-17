import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurentInfoGetter {
  static dynamic GetAllData() =>
      FirebaseFirestore.instance.collection('users').get();
}
