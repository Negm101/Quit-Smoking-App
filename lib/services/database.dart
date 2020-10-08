import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  Future updateProfile({
    BuildContext context,
    String cigPerDay,
    String cigPerPack,
    String currency,
    String name,
    String pricePerPack,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new Text("   Saving..."),
              ],
            ),
          ),
        );
      },
    );

    await usersCollection.doc(uid).update({
      'cigPerDay': int.parse(cigPerDay),
      'cigPerPack': int.parse(cigPerPack),
      'currency': currency,
      'name': name,
      'pricePerPack': double.parse(pricePerPack),
    });

    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Done!"),
            content: Text("Data saved successfully."),
            actions: [
              FlatButton(
                child: Text("Quit Smoking Now"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future addSmokingRecord() async {
    DateTime now = new DateTime.now();

    return await recordCollection.doc().set({
      'uid': uid,
      'dateTime': now,
    });
  }

  Future<String> getName() async {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return userData['name'];
  }

  Future<String> getEmail() async {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return userData['email'];
  }

  Future<String> getCurrency() async {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return userData['currency'];
  }

  Future<int> getCigPerDay() async {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return userData['cigPerDay'];
  }

  Future<double> getPricePerPack() async {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return userData['pricePerPack'].toDouble();
  }

  Future<int> getCigPerPack() async {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return userData['cigPerPack'];
  }

  Future<String> getLifeRegained() async {
    DateTime now = new DateTime.now();
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    int totalSmoked = 0;
    await FirebaseFirestore.instance
        .collection('record')
        .where('uid', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        totalSmoked++;
      });
    });
    final quitDate = userData['quitDate'].toDate();

    var daysSinceQuit = now.difference(quitDate).inDays;
    if (daysSinceQuit == 0) {
      daysSinceQuit = 1;
    }

    final potentialSmoked = userData['cigPerDay'] * daysSinceQuit;
    final notSmoked = potentialSmoked - totalSmoked;
    var lifeRegained = notSmoked * 7;
    var unit = " Mins";

    if (lifeRegained > 60) {
      lifeRegained = lifeRegained / 60;
      unit = " Hrs";
    }
    if (lifeRegained > 24) {
      lifeRegained = lifeRegained / 24;
      unit = " Days";
    }
    if (lifeRegained > 30) {
      lifeRegained = lifeRegained / 30;
      unit = " Mths";
    }

    String returnString = lifeRegained.toStringAsFixed(1) + unit;
    return returnString;
  }

  Future<String> getNonSmokedCig() async {
    DateTime now = new DateTime.now();
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    int totalSmoked = 0;
    await FirebaseFirestore.instance
        .collection('record')
        .where('uid', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        totalSmoked++;
      });
    });
    final quitDate = userData['quitDate'].toDate();

    var daysSinceQuit = now.difference(quitDate).inDays;
    if (daysSinceQuit == 0) {
      daysSinceQuit = 1;
    }

    final potentialSmoked = userData['cigPerDay'] * daysSinceQuit;
    final notSmoked = potentialSmoked - totalSmoked;

    return notSmoked.toString();
  }

  Future<String> getMoneySaved() async {
    DateTime now = new DateTime.now();

    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    //count number of sticks smoked since quitting
    int totalSmoked = 0;
    await FirebaseFirestore.instance
        .collection('record')
        .where('uid', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        totalSmoked++;
      });
    });
    final quitDate = userData['quitDate'].toDate();
    final costPerStick = userData['pricePerPack'] / userData['cigPerPack'];
    final costPerDay = userData['cigPerDay'] * costPerStick;

    var daysSinceQuit = now.difference(quitDate).inDays;
    if (daysSinceQuit == 0) {
      daysSinceQuit = 1;
    }

    final grossAmountSaved = daysSinceQuit * costPerDay;
    final nettAmountSaved = grossAmountSaved - totalSmoked * costPerStick;
    // double daysSinceSmoking = double.parse(
    //     DateTime.now().difference(DateTime.parse(quitDate)).inDays.toString());
    // double daysToBuyNewPack =
    //     double.parse(cigPerPack) / double.parse(cigPerDay);
    // double pricePerDay = double.parse(pricePerPack) / daysToBuyNewPack;

    return userData['currency'] + " " + nettAmountSaved.toStringAsFixed(1);
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
    return result;
  }

  getSchedule() async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    QuerySnapshot documents;
    await FirebaseFirestore.instance
        .collection('record')
        .where('uid', isEqualTo: uid)
        .where('dateTime', isGreaterThanOrEqualTo: date)
        .orderBy("dateTime", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      documents = querySnapshot;
      // querySnapshot.docs.forEach((doc) {
      //   documents.add(doc);
      // });
    });

    return documents;
  }
}
