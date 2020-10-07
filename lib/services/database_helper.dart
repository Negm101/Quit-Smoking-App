import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class DatabaseHelper {
  DatabaseHelper();
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  Future<void> updateUserProfile(
      String name, String email, String cigPerDay, String pricePerPack, String cigPerPack, String currency) {
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
          'currency':currency,
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
      'currency': '',
      'pricePerPack': '',
      'cigPerDay': '',
      'cigPerPack': '',
      'quitDate': dateFormat.format(DateTime.now()).toString(),
    }).then((_) {
      print("initialized user successfully");
    });
  }
  Future<void> resetUserQuitDate(String relapsed) {
    final CollectionReference user = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.email);
    return user
        .doc('profile')
        .update({
        'quitDate' : dateFormat.format(DateTime.now()).toString(),
        'relapsed' : relapsed,
    })
        .then((value) => print("Quit date reseated successfully"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> createMission(String id, String title, String status) {
    final CollectionReference user = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.email);
    return user
        .doc('profile')
        .set({
          'id': id,
          'title': title,
          'status': status,
        })
        .then((value) => print("Created Mission"))
        .catchError((error) => print("Failed to create missions: $error"));
  }
  Future<void> getThis(String doc,String item) {
    FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser.email)
        .doc(doc)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        return documentSnapshot[item];
      } else {
        print('Document does not exist on the database');
        return 'error';
      }
    });
  }



}
