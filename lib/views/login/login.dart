import 'package:brincando_que_se_aprende/controller/controller_login.dart';
import 'package:brincando_que_se_aprende/views/login/components/ComponentTextDecoration.dart';
import 'package:brincando_que_se_aprende/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'components/already_have_an_account_acheck.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //image: AssetImage("assets/images/infantil2.jpg"),
            //fit: BoxFit.cover,
            //  ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Image.asset(
            //'assets/images/logo.png',
            //height: 200,
            //width: 200,
            // ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ComponentTextDecoration(
                text: 'E-MAIL',
                controller: controller.email,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ComponentTextDecoration(
                text: 'SENHA',
                controller: controller.password,
                obscure: true,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 60,
                width: double.infinity,
                //child: CustomButton(text: 'JOGAR', onPressed: () {}),
                child: CustomButton(
                    text: 'LOGAR',
                    onPressed: () {
                      controller.signIn(
                          controller.email.text, controller.password.text);
                      //Get.toNamed("/menuAtividades");
                    }),
              ),
            ),
            AlreadyHaveAnAccountCheck(
              onPressed: () {
                Get.toNamed("/signup");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SignInButton(
                  Buttons.Facebook,
                  //mini: true,
                  text: "Login Facebook",
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SignInButton(
                  Buttons.GoogleDark,
                  text: "Login Google",
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
