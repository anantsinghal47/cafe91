

import 'package:cafe91/modal/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthMethods{

  // instantiating  the  FirebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AppUser _userFromFirebaseUser( User user){

    return user != null ? AppUser(userId: user.uid) : null; //if user is not null it returns user id

  }
    //services and methods
    //method for signUp
    Future signUpWithEmailAndPassword (String email , String password) async{
    try{
      // UserCredential type result is return form createUsernameAndPassword() method
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User  firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);

    }catch(e){
      print(e.toString());
    }

   }
   //method for signInWithEmailAndPassword
  Future signInWithEmailAndPassword (String email , String password) async {
    try{
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password
      );
      User firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);

    }catch(e){
      print(e.toString());
    }
  }
  //method for signing out
  Future signOut() async{
    try{
      print("you were signed out");
      return await _firebaseAuth.signOut();
    } catch(e){
      print(e.toString());
    }
  }


}