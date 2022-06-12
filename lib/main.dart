import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/assets/CColors.dart';
import 'package:gym2gym_owner/providers/attendance_provider.dart';
import 'package:gym2gym_owner/screens/LoginPage.dart';
import 'package:provider/provider.dart';

late double screenWidth;
late double screenHeight;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // Replace with actual values

      );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AttendanceProvider>(
        create: (_) => AttendanceProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

var dHeader = const Color(0xFF59599c);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
        home: Signin());
  }
}
