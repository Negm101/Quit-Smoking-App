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

  Future<String> getDaysSinceSmoked() async {
    // DateTime now = new DateTime.now();
    //
    // final results = recordCollection.where('uid', isEqualTo: uid).get();
    //
    // print(results.documents);
    DateTime latestDate;
    DateTime now = new DateTime.now();

    await FirebaseFirestore.instance
        .collection('record')
        .where('uid', isEqualTo: uid)
        .orderBy("dateTime", descending: true)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Timestamp t = doc["dateTime"];
        latestDate = t.toDate();
      });
    });

    var difference = now.difference(latestDate).inDays;
    String unit = " Days";

    if (difference == 0) {
      difference = now.difference(latestDate).inHours;
      unit = " Hours";
    }

    if (difference == 0) {
      difference = now.difference(latestDate).inMinutes;
      unit = " Minutes";
    }

    String result = difference.toString() + unit;
    print(result);
    return result;
  }
}
