import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth{}
class MockFirebaseUser extends Mock implements FirebaseUser{}
class MockAuthResult extends Mock implements AuthResult {}

void main() {
  final MockFirebaseAuth _auth = MockFirebaseAuth();
  final BehaviorSubject<MockFirebaseUser> _user = BehaviorSubject<MockFirebaseUser>();
  
  when(_auth.onAuthStateChanged).thenAnswer((_){
    return _user;
  });

  final UserRepository _repo = UserRepository(firebaseAuth: _auth);

  group('user repository test', (){
    when(_auth.signInWithEmailAndPassword(email: "email",password: "password")).thenAnswer((_)async{
      _user.add(MockFirebaseUser());
      return MockAuthResult();
    });
    when(_auth.signInWithEmailAndPassword(email: "mail",password: "pass")).thenThrow((){
      return null;
    });
    when(_auth.currentUser()).thenAnswer((_)async{
      return MockFirebaseUser();
    });

    test("sign in with email and password", () async {
      await _repo.signInWithCredentials("email", "password");
      final signedIn = await _repo.isSignedIn();
      expect(signedIn, true);
    });
  });
}