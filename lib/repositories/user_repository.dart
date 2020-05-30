import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;


  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut()
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUserName() async {
    return (await _firebaseAuth.currentUser()).displayName;
  }

  // Future<FirebaseUser> getUser() async {
  //   return _firebaseAuth.currentUser();
  // }

  Future<String> getUserEMail() async {
    return (await _firebaseAuth.currentUser()).email;
  }

  Future<void> setUserName(String name) async {
    final update = UserUpdateInfo();
    update.displayName = name;
    return (await _firebaseAuth.currentUser()).updateProfile(update);
  }
}