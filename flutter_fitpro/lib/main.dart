import 'package:flutter/material.dart';
import 'package:flutter_fitpro/src/login/login_page.dart';
import 'package:flutter_fitpro/src/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login':(BuildContext context ) => LoginPage()
      },
      theme: ThemeData(
          fontFamily: 'NimbusSans',
          primaryColor: MyColors.primaryColor
      ),
    );
  }
}



