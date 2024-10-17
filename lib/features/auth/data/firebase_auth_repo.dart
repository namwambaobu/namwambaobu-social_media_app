import 'package:firebase_auth/firebase_auth.dart';
import 'package:wegag/features/auth/domain/entities/app_user.dart';
import 'package:wegag/features/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> logInWithEmailPassword(String email, String password) async {
    try {
//attempt sign in
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
//create a user
      AppUser user =
          AppUser(uid: userCredential.user!.uid, email: email, name: '');
      return user;
    }
    //catch any errors
    catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<AppUser?> registerInWithEmailPassword(
      String email, String password, String name) async {
    try {
//attempt sign up
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
//create a user
      AppUser user =
          AppUser(uid: userCredential.user!.uid, email: email, name: name);
      return user;
    }
    //catch any errors
    catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser> getCurrentUser() async {
    //get current user logged in from firebase
    final firebaseUser = firebaseAuth.currentUser;

//no user logged in
    if (firebaseUser == null) {
      throw Exception("No user found");
    }
    //user exists
    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!, name: '');
  }
}
