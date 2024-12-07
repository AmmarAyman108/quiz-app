import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/login_view.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
      theme: ThemeData.light(),
    );
  }
}
