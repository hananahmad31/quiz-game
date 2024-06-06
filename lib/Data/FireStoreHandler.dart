import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/Model/UserModel.dart';
import 'package:quiz_app/firebase_options.dart';

class Firestorehandler {
  FirebaseFirestore firebaseFirestoreInstance = FirebaseFirestore.instance;

  Firestorehandler() {}

  Future<Usermodel> getUser(String userId) async {
    final document =
        await firebaseFirestoreInstance.collection('Users').doc(userId).get();

    final data = document.data();
    return Usermodel(
        NOQ: data?['NOQ'],
        easy: data?['easy'],
        medium: data?['medium'],
        hard: data?['hard'],
        difficulty: data?['difficulty']);
  }

  Future<void> createUser(uid) async {
    final user = {
      'NOQ': '10',
      'easy': '0',
      'medium': '0',
      'hard': '0',
      'difficulty': "easy",
    };
    firebaseFirestoreInstance.collection("Users").doc(uid).set(user);
  }

  Future<void> updateUser(uid, Usermodel model) async {
    final user = {
      'NOQ': model.NOQ,
      'easy': model.easy,
      'medium': model.medium,
      'hard': model.hard,
      'difficulty': model.difficulty,
    };
    firebaseFirestoreInstance.collection("Users").doc(uid).update(user);
  }
}
