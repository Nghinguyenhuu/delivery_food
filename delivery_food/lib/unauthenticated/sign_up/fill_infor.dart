import 'package:delivery_food/components/form_fill.dart';

import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';

import 'payment_method.dart';

class FillInfor extends StatelessWidget {
<<<<<<< HEAD
  const FillInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body:  SignupProcess(
            title: 'Fill in your bio to get started',
            subtile:
                'This data will be displayed in your account profile for security',
            buttontext: 'Next',
            onPress: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> const PaymentMethod()));},
            child:const FormFill(),
          ),
        );
=======
  final String id;
  const FillInfor({Key? key, required this.id,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstnamecontroller = TextEditingController();
    final lastnamecontroller = TextEditingController();
    final mobilenumbercontroller = TextEditingController();

    final userProvider = Provider.of<UserProvider>(context);

    Future<bool> buildUpdateInfo(String? firstname,String lastname,String mobilenumber ) async{
      if(firstname!='' ||lastname!='' ||mobilenumber!=''){
        User user =await userProvider.getUser(id);
        user.firstname = firstname;
        userProvider.updateUser(user);
        return true;
      }else{
        const AppAlert(title: 'Error', subtile: 'Please fill in all the required fields.',);
      }
      return false ;
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SignupProcess(
        title: 'Fill in your bio to get started',
        subtile:
            'This data will be displayed in your account profile for security',
        buttontext: 'Next',
        onPress: ()async {
          await buildUpdateInfo(firstnamecontroller.text,lastnamecontroller.text,mobilenumbercontroller.text) 
          ? Navigator.push(context, CustomPageRoute(child: const PaymentMethod()))
          : null;
        },
        child: FormFill(
          firstname: firstnamecontroller,
          lastname: lastnamecontroller,
          mobilenumber: mobilenumbercontroller,
        ),
      ),
    );
>>>>>>> parent of d497ec4 (fix update info)
  }
  
  
}
