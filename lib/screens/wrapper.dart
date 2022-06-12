import 'package:flutter/material.dart';
import 'package:gym2gym_owner/controller/AuthController.dart';
import 'package:gym2gym_owner/models/user.dart';
import 'package:gym2gym_owner/screens/LoginPage.dart';
import 'package:gym2gym_owner/screens/homepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static const String routeName = '/wrapper';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const Wrapper());
  }

  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<Users?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<Users?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final Users? user = snapshot.data;
            return user != null ? const Homepage() : Signin();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
