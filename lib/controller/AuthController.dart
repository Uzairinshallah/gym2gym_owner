// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym2gym_owner/models/user.dart';

late var creds;

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  static Users? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return Users(user.uid, user.email);
  }

  Stream<Users?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  static Future<void> signIn(String id, String password) async {
    try {
      FirebaseFirestore.instance
          .collection('gym')
          .where('id', isEqualTo: id)
          .limit(1)
          .get()
          .then((value) {
        if (value.docs.isEmpty) {
          print('Empty data list');
          Get.snackbar(
            'Error',
            'No such gym exists',
            colorText: Colors.white,
            backgroundColor: Colors.red,
            borderRadius: 0,
            margin: const EdgeInsets.all(0),
          );
          return;
        } else {
          print('data list found');
          print('Email :${value.docs[0]['id']}');
          creds = auth.FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: value.docs[0]['email'], password: password)
              .then((value) {
            Get.snackbar(
              'Success',
              'Gym login successful',
              colorText: Colors.white,
              backgroundColor: Colors.green,
              borderRadius: 0,
              margin: const EdgeInsets.all(0),
            );
            return _userFromFirebase(creds.user);
          }).onError((error, stackTrace) {
            print(error.toString());
            Get.snackbar(
              'Error',
              'Some error occurred. Please check event log.',
              colorText: Colors.white,
              backgroundColor: Colors.red,
              borderRadius: 0,
              margin: const EdgeInsets.all(0),
            );
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
