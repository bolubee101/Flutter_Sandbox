import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  static FirebaseAuth _auth = FirebaseAuth.instance; //This is how you get the instance

  static SignInOrSignUp({String email, String password}){
    Future<AuthResult> result = _auth.signInWithEmailAndPassword(email: email, password: password);
    //That is how dart handles a task that runs on another thread.
    //Like the code continues to execute while it access the internet in the background and tries to sign in.
    //Read up on it.
    //I can't hear you.
    //Basically the "then" function runs when there is a result or an error
    //If a user does not exist it creates a new user
    //That is not how it would work in production code but I'm just testing.
    result.then((value){
      print(value);
    },onError: (error){
      switch(error.code){
        //When running on android
        case "ERROR_USER_NOT_FOUND":
          _auth.createUserWithEmailAndPassword(email: email, password: password);
          break;
        //When running on web
        case "auth/user-not-found":
          _auth.createUserWithEmailAndPassword(email: email, password: password);
          break;
        default:
          print(error.code);
          break;
      }
    });
  }
}