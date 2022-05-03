import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/DetailsScreen.dart';
import 'package:flutter_application/HomeScreen.dart';
import 'package:flutter_application/constant.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor:Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      ),
      
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: "Hellix"
          //  visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      home: HomeScreen(),
    );
  }
}
