import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza_app_learning/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> setUserData(MyUser user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async* {
      if (firebaseUser == null) {
        yield MyUser.empty;
      } else {
        yield await userCollection.doc(firebaseUser.uid).get().then(
              (value) => MyUser.fromEntity(
                MyUserEntity.fromDocument(value.data()!),
              ),
            );
      }
    });
  }
}
