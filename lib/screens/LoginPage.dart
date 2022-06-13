import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym2gym_owner/controller/AuthController.dart';

import '../assets/CColors.dart';
import '../main.dart';
import 'package:get/get.dart';

import 'SignupPage.dart';
import 'homepage.dart';

TextEditingController idController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: CColors.bgColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/f_logo.png",
                  height: screenHeight / 3,
                  width: screenWidth / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 800,
                    ),
                    child: TextFormField(
                      controller: idController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 10),
                          labelText: 'Owner ID',
                          labelStyle: const TextStyle(
                              color: Colors.white, fontFamily: 'pp'),
                          fillColor: Colors.white38,
                          filled: true,
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                                width: 2.0,
                              ))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                getSizedBox(3),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 800,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      // obscureText: hide,
                      textAlign: TextAlign.center,
                      // controller: _password,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              color: Colors.white, fontFamily: 'pp'),
                          fillColor: Colors.white38,
                          filled: true,
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                                width: 2.0,
                              ))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                getSizedBox(20),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print('Validated');

                        AuthService.signIn(
                                idController.text, passwordController.text)
                            .then((value) {
                          Get.snackbar('Success', 'value.tex.toString()');
                        }).onError((error, stackTrace) {
                          Get.snackbar('Error', error.toString());
                        });
                      } else {
                        Get.snackbar(
                            'Error', 'Input fields cannot be left empty.');
                      }

                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [CColors.buttonOne, CColors.buttonTwo]),
                          borderRadius: BorderRadius.circular(40)),
                      child: Container(
                        width: (kIsWeb) ? screenWidth * .3 : screenWidth * .6,
                        height: 100,
                        alignment: Alignment.center,
                        child: const Text(
                          'SignIn',
                          style: TextStyle(
                              fontSize: 24,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'pp'),
                        ),
                      ),
                    ),
                  ),
                ),
                // const LoginButton(),
                const Divider(
                  height: 15,
                  color: Colors.transparent,
                ),
                getSizedBox(4),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Forgotten Password ?',
                    style: TextStyle(fontFamily: 'pp', color: Colors.white),
                  ),
                ),
                getDivider(50, 1.5),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [CColors.buttonOne, CColors.buttonTwo]),
                          borderRadius: BorderRadius.circular(40)),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 350,
                        ),
                        child: Container(
                          width: (kIsWeb) ? screenWidth * .3 : screenWidth * .8,
                          height: 100,
                          alignment: Alignment.center,
                          child: const Text(
                            'Create a new account',
                            style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'pp'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  getSizedBox(double a) {
    return SizedBox(
      height: a,
    );
  }

  getDivider(double a, double b) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Divider(
        height: a,
        thickness: b,
        color: Colors.blueGrey,
      ),
    );
  }
}
