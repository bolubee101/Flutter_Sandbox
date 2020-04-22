import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static SignInOrSignUp({String email, String password}){
    Future<AuthResult> result = _auth.signInWithEmailAndPassword(email: email, password: password);
    result.then((value){
      print(value);
    },onError: (error){
      switch(error.code){
        case "ERROR_USER_NOT_FOUND":
          _auth.createUserWithEmailAndPassword(email: email, password: password);
          break;
        default:
          print(error.code);
          break;
      }
    });
  }
}