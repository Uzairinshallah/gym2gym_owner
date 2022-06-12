import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/assets/CColors.dart';
<<<<<<< HEAD
import 'package:gym2gym_owner/controller/AuthController.dart';
import 'package:gym2gym_owner/screens/LoginPage.dart';
import 'package:gym2gym_owner/screens/wrapper.dart';
=======
import 'package:gym2gym_owner/providers/attendance_provider.dart';
import 'package:gym2gym_owner/screens/LoginPage.dart';
>>>>>>> 4c35377f506ad5af9f595bbaae7175b1d49f92b8
import 'package:provider/provider.dart';

late double screenWidth;
late double screenHeight;
<<<<<<< HEAD
// const Color bgColor = Color(0xFF212332);
// const Color buttonOne = Color(0xFF2A2D3E);
// const Color buttonTwo = Color(0xff0e5480);
// const Color dHeader = Color(0xFF59599c);
// const Color bgColorTwo = Color(0xFF2A253E);
// const Color bgColorThree = Color(0xFF597ade);
// const Color IconColor = Color(0xFFC7C7D4);
// const Color containerCol = Color(0xFF003366);
=======
>>>>>>> 4c35377f506ad5af9f595bbaae7175b1d49f92b8

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // Replace with actual values
<<<<<<< HEAD
      options: const FirebaseOptions(
    apiKey: "AIzaSyBlWQHv9P2BMxGXAwVKEZOGJjOfxXzSgNg",
    authDomain: "gymtogym-e05b1.firebaseapp.com",
    projectId: "gymtogym-e05b1",
    storageBucket: "gymtogym-e05b1.appspot.com",
    messagingSenderId: "625930472579",
    appId: "1:625930472579:web:882530bfdf54c75db11fb6",
    measurementId: "G-RKFPRC4C2Q",
  ));
  runApp(const MyApp());
=======

      );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AttendanceProvider>(
        create: (_) => AttendanceProvider(),
      ),
    ],
    child: const MyApp(),
  ));
>>>>>>> 4c35377f506ad5af9f595bbaae7175b1d49f92b8
}

var dHeader = const Color(0xFF59599c);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return (MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primaryTextTheme:
                const TextTheme(bodyText1: TextStyle(color: Colors.pink)),
            primarySwatch: Colors.indigo,
            textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const Wrapper()),
    ));
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
        home: Signin());
>>>>>>> 4c35377f506ad5af9f595bbaae7175b1d49f92b8
  }
}
