import 'dart:io';

import 'package:delivery_food/components/buildimage.dart';
import 'package:delivery_food/components/upload_content.dart';
import 'package:delivery_food/routes/fade_route.dart';


import 'package:delivery_food/widget/signup_process.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'set_location.dart';

class UploadPhoto extends StatefulWidget {
  final String id;
  const UploadPhoto({Key? key, required this.id}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? image;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SignupProcess(
            title: 'Upload Your Photo Profile',
            subtile:
                'This data will be displayed in your account profile for security',
            buttontext: 'Next',
            onPress: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> SetLocation(id:widget.id,) ));},
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
