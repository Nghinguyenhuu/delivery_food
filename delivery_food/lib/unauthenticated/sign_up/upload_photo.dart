import 'dart:io';
import 'dart:typed_data';

import 'package:delivery_food/components/buildimage.dart';
import 'package:delivery_food/components/upload_content.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/provider/user_provider.dart';
import 'package:delivery_food/routes/fade_route.dart';


import 'package:delivery_food/widget/signup_process.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'set_location.dart';

class UploadPhoto extends StatefulWidget {
  final String id;
  const UploadPhoto({Key? key, required this.id}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? image;
  UploadTask? uploadTask;
  Uint8List? webImage;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      return e;
    }
  }
  Future<String> uploadFile() async {
    final path = "image/post/${DateTime.now().microsecondsSinceEpoch}";
    final ref = FirebaseStorage.instance.ref().child(path);
    try {
      if (!kIsWeb) {
        uploadTask = ref.putFile(image!);
      } else {
        uploadTask =
            ref.putData(webImage!, SettableMetadata(contentType: 'image/png'));
      }
    } on FirebaseException catch (e) {
      print("Failed with error '${e.code}': ${e.message}");
    }

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownLoad = await snapshot.ref.getDownloadURL();
    if (kDebugMode) {
      print("url download: $urlDownLoad");
    }
    // uploadTask = null;
    return urlDownLoad;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SignupProcess(
            title: 'Upload Your Photo Profile',
            subtile:
                'This data will be displayed in your account profile for security',
            buttontext: 'Next',
            onPress: ()async {
              User user = await userProvider.getUser(widget.id);
              user.image =await uploadFile();
              await userProvider.updateUser(user).then((value) =>Navigator.push(context, CustomPageRoute(child: SetLocation(id: widget.id))))
              
              ;},
            skipButton: () { Navigator.push(context, CustomPageRoute(child: SetLocation(id: widget.id,))) ;},
            child:image != null ? BuildImage(image: image!, onPress: (){setState(() {
              image = null;
            });} ): Column(
              children: [
                UploadContent(
                    lable: 'From Gallery',
                    onPress: () {
                      pickImage(ImageSource.gallery);
                    },
                    assetImage: 'assets/icons/Gallery.png'),
                const SizedBox(
                  height: 20,
                ),
                UploadContent(
                    lable: 'Take Photo',
                    onPress: () {
                      pickImage(ImageSource.camera);
                    },
                    assetImage: 'assets/icons/camera.png')
              ],
            )));
  }
}
