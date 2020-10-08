import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference recordCollection =
      FirebaseFirestore.instance.collection('record');

  Future createNewUser(String email, String name) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);

    return await usersCollection.doc(uid).set({
      'cigPerDay': 0,
      'cigPerPack': 0,
      'currency': "RM",
      'email': email,
      'name': name,
      'pricePerPack': 0,
      'quitDate': date,
    });
  }

  Future addSmokingRecord() async {
    DateTime now = new DateTime.now();

    return await recordCollection.doc().set({
      'uid': uid,
      'dateTime': now,
    });
  }

  String getDaysSinceSmoked() {
    DateTime now = new DateTime.now();

    return "testing";
  }
}
