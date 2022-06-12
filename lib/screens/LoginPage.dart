import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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
<<<<<<< HEAD
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
=======
    return MaterialApp(
        home: Scaffold(
      backgroundColor: CColors.bgColor,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bgImage.jpg"),
                opacity: .5,
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Image.asset(
                        "assets/icons/f_logo.png",
                        height: screenHeight / 3,
                        width: screenWidth / 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 800,
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              labelText: 'Owner ID',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'pp',
                                  fontSize: 12),
                              fillColor: CColors.bgTF,
                              filled: true,
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: CColors.textColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: CColors.textColor,
                                    width: 1,
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
                    // getSizedBox(1),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 800,
                        ),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          // obscureText: hide,
                          textAlign: TextAlign.left,
                          // controller: _password,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'pp',
                                  fontSize: 12),
                              fillColor: CColors.bgTF,
                              filled: true,
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: CColors.textColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: CColors.textColor,
                                    width: 1,
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
                    getSizedBox(screenWidth * .125),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  CColors.buttonOne,
                                  CColors.buttonTwo
                                ]),
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: (kIsWeb) ? screenWidth * .3 : screenWidth,
                              height: 100,
                              alignment: Alignment.center,
                              child: const Text(
                                'SIGN IN',
                                style:
                                    TextStyle(fontSize: 12, fontFamily: 'pp'),
                              ),
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgot Password ',
                            style: TextStyle(
                                fontFamily: 'pp',
                                color: CColors.buttonOne,
                                fontSize: 10),
>>>>>>> 4c35377f506ad5af9f595bbaae7175b1d49f92b8
                          ),
                        ),
                      ),
                    ),
                    getDivider(50, 1),

                    RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style:
                              TextStyle(color: CColors.textColor, fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' SIGN UP',
                                style: TextStyle(
                                    color: CColors.buttonOne, fontSize: 12),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // navigate to desired screen
                                  })
                          ]),
                    ),

                    // OutlinedButton(
                    //   onPressed: (){
                    //
                    //   },
                    //   style: OutlinedButton.styleFrom(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20)),
                    //     side: BorderSide(width: 1.0, color: CColors.buttonTwo),
                    //   ),
                    //
                    //   child:  Text("SignUp", style: TextStyle(color: Colors.white),),
                    // ),
                    // SizedBox(
                    //   height: 45,
                    //   child: OutlinedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => SignUpPage()),
                    //       );
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //         padding: EdgeInsets.zero,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(40))),
                    //     child: Ink(
                    //       decoration: BoxDecoration(
                    //           gradient: LinearGradient(
                    //               colors: [CColors.buttonOne, CColors.buttonTwo]),
                    //           borderRadius: BorderRadius.circular(40)),
                    //       child: ConstrainedBox(
                    //         constraints: const BoxConstraints(
                    //           minWidth: 350,
                    //         ),
                    //         child: Container(
                    //           width: (kIsWeb) ? screenWidth * .3 : screenWidth * .8,
                    //           height: 100,
                    //           alignment: Alignment.center,
                    //           child:  Text(
                    //             'SignUp',
                    //             style: TextStyle(
                    //                 color: CColors.textColor,
                    //                 fontSize: 24,
                    //                 fontStyle: FontStyle.italic,
                    //                 fontFamily: 'pp'),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
<<<<<<< HEAD
          )),
    );
=======
          ),
        ),
      ),
    ));
>>>>>>> 4c35377f506ad5af9f595bbaae7175b1d49f92b8
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
