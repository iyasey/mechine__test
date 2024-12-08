import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    final UserCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserCredential.user!.updateDisplayName(name);
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static User? getcurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  static Future<void> signIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }
}
