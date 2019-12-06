import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class CrudMethod {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(itemData) async {
    if (isLoggedIn()) {
      Firestore.instance.collection('reservation').add(itemData).catchError((e) {
        print(e);
      });
    } else {
      print('log in required');
    }
  }
}
