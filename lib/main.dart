import 'package:flutter/material.dart';
import 'package:gym2gym_owner/assets/CColors.dart';
import 'package:gym2gym_owner/screens/LoginPage.dart';


late double screenWidth;
late double screenHeight;
// const Color bgColor = Color(0xFF212332);
// const Color buttonOne = Color(0xFF2A2D3E);
// const Color buttonTwo = Color(0xff0e5480);
// const Color dHeader = Color(0xFF59599c);
// const Color bgColorTwo = Color(0xFF2A253E);
// const Color bgColorThree = Color(0xFF597ade);
// const Color IconColor = Color(0xFFC7C7D4);
// const Color containerCol = Color(0xFF003366);



void main() {
  runApp(const MyApp());
}

 var dHeader =  const Color(0xFF59599c);


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryTextTheme: TextTheme(bodyText1: TextStyle(color: Colors.pink)),
          primarySwatch: Colors.indigo,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white), ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Signin());
  }
}
