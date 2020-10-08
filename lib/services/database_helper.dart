import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class DatabaseHelper {
  DatabaseHelper();

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> updateUserProfile(String name, String email, String cigPerDay,
      String pricePerPack, String cigPerPack, String currency) {
    final CollectionReference user = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.email);
    return user
        .doc('profile')
        .update({
      'name': name,
      //'email': email,
      'cigPerDay': cigPerDay,
      'pricePerPack': pricePerPack,
      'cigPerPack': cigPerPack,
      'currency': currency,
    })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> initializeUser(String email, String password) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return FirebaseFirestore.instance.collection('$email').doc('profile').set({
      'name': '',
      'email': email,
      'type': 'smoker',
      'currency': 'RM',
      'pricePerPack': '0',
      'cigPerDay': '0',
      'cigPerPack': '0',
      'relapsed': '0',
      'quitDate': dateFormat.format(DateTime.now()).toString(),
    }).then((_) {
      print("initialized user successfully");
    });
  }

  Future<void> resetUserQuitDate() {
    final CollectionReference user = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.email);
    return user
        .doc('profile')
        .update({
      'quitDate': dateFormat.format(DateTime.now()).toString(),
      'relapsed': '0',
    })
        .then((value) => print("Quit date reseated successfully"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> createMission(String id, String title, String priority,
      String status) {
    final CollectionReference user = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.email);
    return user
        .doc('profile')
        .set({
      'id': id,
      'title': title,
      'priority': priority,
      'status': status,
    })
        .then((value) => print("Created Mission"))
        .catchError((error) => print("Failed to create missions: $error"));
  }
  Future<void> getUserProfile() {
    final DocumentReference user = FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser.email).doc('profile');
    return user.get();
  }






}
