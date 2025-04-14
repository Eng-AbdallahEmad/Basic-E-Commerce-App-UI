import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primaryColor: Constant.primaryColor,
        // inputDecorationTheme: InputDecorationTheme(
        //   border: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.grey),
        //   ),
        //
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.grey),
        //   ),
        //
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Constant.primaryColor),
        //   ),
        //
        //   errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.red),
        //   ),
        //
        //   focusedErrorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.red),
        //   ),
        //
        //   labelStyle: TextStyle(
        //     color: Colors.black,
        //   ),
        // ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      home: SplashScreen(),
    );
  }
}
