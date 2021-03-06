import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/login/login_controller.dart';
import 'package:untitled/utils/config.dart';
import 'package:untitled/widgets/bounce_button.dart';
import 'package:untitled/widgets/input.dart';
import 'package:untitled/widgets/app_name.dart';

enum LoginOption {
  customer,
  professional
}

class LoginScreen extends StatelessWidget {
  LoginPageController loginPageController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          margin: const EdgeInsets.only(
            top: 100,
            left: 48,
            right: 48,
          ),
          child: ListView(
            children: [
              getAppName(),
              SizedBox(
                height: getHeight(15),
              ),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: getWidth(20),
                ),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Text(
                "Sign in to your account",
                style: TextStyle(
                  fontSize: getWidth(14),
                ),
              ),
              SizedBox(
                height: getHeight(12),
              ),
              inputRegular(
                context,
                hintText: "Input your email or phone number",
              ),
              SizedBox(
                height: getHeight(12),
              ),
              inputRegular(
                context,
                hintText: "Input your password",
              ),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                title: Text("Join as customer"),
                leading: SizedBox(
                  height: getHeight(14),
                  width: getWidth(14),
                  child: Obx(() => Radio<LoginOption> (
                    value: LoginOption.customer,
                    groupValue: loginPageController.loginOption.value,
                    onChanged: (LoginOption? value) {
                      if (value != null)
                        loginPageController.loginOption.value = value;
                    },
                  ))
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                title: Text("Join as professional"),
                leading: SizedBox(
                  height: getHeight(14),
                  width: getWidth(14),
                  child: Obx(() => Radio<LoginOption> (
                    value: LoginOption.professional,
                    groupValue: loginPageController.loginOption.value,
                    onChanged: (LoginOption? value) {
                      if (value != null)
                      loginPageController.loginOption.value = value;
                    })
                  ),
                ),
              ),
              Bouncing(
                child: Container(
                  alignment: Alignment.center,
                  height: getHeight(42),
                  width: getWidth(double.infinity),
                  decoration: BoxDecoration(
                      color: Color(0xFF000000).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Color(0xFF000000),
                        width: getWidth(1),
                      )),
                  child: Text ("Login"),
                ),
                onPress: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
