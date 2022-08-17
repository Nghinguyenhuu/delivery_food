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
          future: _getImage(context, "PhotoRestaurant.png"),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // return Text(snapshot.data.toString());
              return Container(
                child: snapshot.data,
              );
            }
            return Text("notdone");
          }),
        ),
        Text("Things done"),
      ]),
    );
  }

  Future<Image> _getImage(BuildContext context, String imageName) async {
    Image image = Image.asset('assets/images/' + "Logo.png"); //placeholder
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

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(
      BuildContext context, String imageName) async {
    return await FirebaseStorage.instance
        .ref()
        .child(imageName)
        .getDownloadURL();
  }
}
