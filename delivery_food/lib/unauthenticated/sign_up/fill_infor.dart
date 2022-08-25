import 'package:delivery_food/components/app_alert_dialog.dart';
import 'package:delivery_food/components/form_fill.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/provider/user_provider.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/widget/signup_process.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'payment_method.dart';

class FillInfor extends StatelessWidget {
  final String id;
  const FillInfor({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstnamecontroller = TextEditingController();
    final lastnamecontroller = TextEditingController();
    final mobilenumbercontroller = TextEditingController();

    final userProvider = Provider.of<UserProvider>(context);

    Future<bool> buildUpdateInfo(
        String firstname, String lastname, String mobilenumber) async {
          print(id);
      if (firstname != '' || lastname != '' || mobilenumber != '') {
        User user = await userProvider.getUser(id);
        print(user.id);
        user.firstname = firstname;
        user.lastname = lastname;
        user.mobilephone = mobilenumber;
        return await userProvider.updateUser(user);
      } else {
        const AppAlert(
          title: 'Error',
          subtile: 'Please fill in all the required fields.',
        );
      }
      return false;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SignupProcess(
        title: 'Fill in your bio to get started',
        subtile:
            'This data will be displayed in your account profile for security',
        buttontext: 'Next',
        onPress: () {
          buildUpdateInfo(firstnamecontroller.text, lastnamecontroller.text,
                  mobilenumbercontroller.text)
              .then((value) => value
                  ? Navigator.push(
                      context, CustomPageRoute(child: PaymentMethod()))
                  : showDialog(
                      context: context,
                      builder: (context) =>
                          AppAlert(title: 'Error', subtile: 'Cant update')));
        },
        child: FormFill(
          firstname: firstnamecontroller,
          lastname: lastnamecontroller,
          mobilenumber: mobilenumbercontroller,
        ),
      ),
    );
  }
}
