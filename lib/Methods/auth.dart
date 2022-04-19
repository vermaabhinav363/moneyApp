import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:money/Data/data.dart';
import 'package:money/HomeScreen.dart';
import 'package:money/introduct.dart';

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseApp app = await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Authentication.customSnackBar(content: 'account-exists-with-different-credential');
        }
        else if (e.code == 'invalid-credential') {
          Authentication.customSnackBar(content: 'invalid-credential');
        }
      } catch (e) {
        Authentication.customSnackBar(content: 'Error please retry');
      }
    }

    USERNAME = user?.displayName!;
    EMAIL =  user?.email;
    ID  = EMAIL?.substring(0, EMAIL?.indexOf('@'));
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()));

    return user;
  }
  static Future<User?> signOutWithGoogle({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signOut();
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const introduct()));
  }
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}

