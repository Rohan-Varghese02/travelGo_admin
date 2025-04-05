import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  User? getUserCredential() {
    return firebaseAuth.currentUser;
  }

  Future<UserCredential> signinWithEmailAndPassword(
    String email,
    password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception('unknown-error');
    }
  }

  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }
}
