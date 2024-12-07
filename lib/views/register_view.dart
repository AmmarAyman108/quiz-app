// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart';
import 'package:flutter_application_1/views/quiz_view.dart';
import 'package:flutter_application_1/widgets/center_text.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/custom_text.dart';
import 'package:flutter_application_1/widgets/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  static String id = 'LoginView';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        autovalidateMode: autoValidateMode,
        key: key,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 50,
            ),
            const text(
              title: 'Register',
              textAlign: TextAlign.center,
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 30,
            ),
            const text(
              title: 'Register to continue using the app',
              fontSize: 18,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            const text(
              title: 'Name',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              hint: 'Enter your Name',
              controller: name,
              icon: const Icon(
                Icons.person,
                color: ColorManager.hintColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const text(
              title: 'Email',
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
                controller: email,
                hint: 'Enter your Email',
                icon: const Icon(
                  Icons.email_outlined,
                  color: ColorManager.hintColor,
                ),
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 15,
            ),
            const text(
              title: 'Password',
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              hint: 'Password',
              controller: password,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
                title: 'Register',
                onTap: () async {
                  if (key.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => QuizView()));
                  }
                }),
            const SizedBox(
              height: 30,
            ),
            CenterText(
              textHint: 'Don\'t have an account ? ',
              textButton: ' Login',
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void CustomSnackBar(content) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content));
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    super.dispose();
  }
}
