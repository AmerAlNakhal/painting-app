import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:painting_app/widgets/helper.dart';

class FirebaseAuthController {
  FirebaseAuthController._();

  static FirebaseAuthController _instance = FirebaseAuthController._();
  FirebaseAuth? _auth = FirebaseAuth.instance;
  BuildContext? context;

  static FirebaseAuthController get instance {
    return _instance;
  }

  FirebaseAuthController setContext(BuildContext context) {
    this.context = context;
    return this;
  }

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth!
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        if (context != null)
          HelperS.showMessage(context!, e.message ?? '', error: true);
      } else if (e.code == 'user-disabled') {
        if (context != null)
          HelperS.showMessage(context!, e.message ?? '', error: true);
      } else if (e.code == 'user-not-found') {
        if (context != null)
          HelperS.showMessage(context!, e.message ?? '', error: true);
      } else if (e.code == 'wrong-password') {
        if (context != null)
          HelperS.showMessage(context!, e.message ?? '', error: true);
      }
    } catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    }
    return null;
  }

  Future<UserCredential?> createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await _auth!
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (context != null)
        HelperS.showMessage(context!, e.message ?? '', error: true);
    } catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    }
    return null;
  }

  bool isLoggedIn() => _auth!.currentUser != null;

  Future signOut() async {
    await _auth!.signOut();
  }
}
