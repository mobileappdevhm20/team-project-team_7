

import 'package:fitrack/repositories/user_repository.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {

  final Map<String, MockUser> users = {};
  MockUser currentUser;

  @override
  Future<void> signInWithCredentials(String email, String password) {
    if (users.containsKey(email) && users[email].password == password) {
      return Future.delayed(const Duration(milliseconds: 100), () => currentUser = users[email]);
    } else {
      if (!users.containsKey(email)) {
        return Future.error(Exception("User with EMail $email was not found"));
      } else if (users.containsKey(email) && users[email].password != password) {
        return Future.error(Exception("The password was wrong"));
      }
    }
    return Future.error(Exception("An unknown error occured"));
  }

  @override
  Future<void> signUp({String email, String password}) async {
    if (!users.containsKey(email) && password.length >= 8) {
      return Future.delayed(const Duration(milliseconds: 100), () => users[email] = MockUser(email, password));
    } else {
      if (users.containsKey(email)) {
        return Future.error(Exception("User with EMail $email already exists"));
      } else if (password.length < 8) {
        return Future.error(Exception("The password was not 8 characters long"));
      }
    }
    return Future.error(Exception("An unknown error occured"));
  }

  @override
  Future<void> signOut() async {
    return Future.delayed(const Duration(milliseconds: 100), () => currentUser = null);
  }

  @override
  Future<bool> isSignedIn() async {
    final user = await Future.delayed(const Duration(milliseconds: 100), () => currentUser);
    return user != null;
  }

  Future<MockUser> getCurrentUser() async {
    return Future.delayed(const Duration(milliseconds: 100), () => currentUser);
  }

  @override
  Future<String> getUserName() async {
    return (await getCurrentUser()).userName;
  }

  // Future<void> getUser() async {
  //   return getCurrentUser();
  // }

  @override
  Future<String> getUserEMail() async {
    return (await getCurrentUser()).eMail;
  }

  @override
  Future<void> setUserName(String name) async {
    return (await getCurrentUser()).userName = name;
  }
}

class MockUser {
   final String eMail;
   final String password;
   String userName;
   MockUser(this.eMail, this.password);
 }