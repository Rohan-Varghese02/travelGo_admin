import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelgo_admin/feature/logic/auth/auth_bloc.dart';

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

      final uid = userCredential.user!.uid;
      final adminDoc = await fireStore.collection('Admin').doc(uid).get();
      if (adminDoc.exists) {
        return userCredential;
      } else {
        await firebaseAuth.signOut();
        throw AuthException(code: "not-admin");
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException(code: e.code);
    } catch (e) {
      throw AuthException(code: 'not-admin');
    }
  }

  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }
}
