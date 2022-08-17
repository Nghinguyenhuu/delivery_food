import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(
      BuildContext context, String imageName) async {
    return await FirebaseStorage.instance
        .ref()
        .child(imageName)
        .getDownloadURL();
  }

  static Future<Image> getImage(BuildContext context, String imageName) async {
    Image image = Image.asset('assets/images/Logo.png'); //placeholder
    // return image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(),
        fit: BoxFit.cover,
      );
    });
    return image;
  }
}
