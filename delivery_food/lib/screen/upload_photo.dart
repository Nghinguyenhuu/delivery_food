import 'package:delivery_food/components/upload_content.dart';
import 'package:delivery_food/widget/signup_process.dart';

import 'package:flutter/material.dart';

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SignupProcess(
              title: 'Upload Your Photo Profile',
              subtile:
                  'This data will be displayed in your account profile for security',
              buttontext: 'Next',
              onPress: (){},
              child:Column(
                children: [
                  UploadContent(lable: 'From Gallery', onPress:(){}, assetImage:'assets/icons/Gallery.png'),
                  const SizedBox(height: 20,),
                  UploadContent(lable: 'Take Photo', onPress:(){}, assetImage:'assets/icons/camera.png')
                ],
              ) )
              ),
    );
  }
}
