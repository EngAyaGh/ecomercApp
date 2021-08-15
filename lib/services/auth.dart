import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  final _auth = FirebaseAuth.instance;
  Future<String> createAccount({required String email,required String Pass})async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: Pass);
      return "Done";
    }on FirebaseAuthException catch(e){
      if(e.code=='weak-password')return 'password is weak';
      else
        if(e.code=='email-already-in-use') return 'Account exists';
    }
        catch(e){return 'Error occured $e';}
    return '';

  }

  Future<String> login({required String email,required String Pass})async {
    try{
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: Pass
      );
      return "Done";
    }on FirebaseAuthException catch(e){
      if(e.code=='user-not-found')return 'no user found';
      else
      if(e.code=='wrong-password') return 'wrong password';
    }
    catch(e){return 'Error occured $e';}
    return '';

  }
  Future<String> restPassword({required String email})async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
      return "Email sent";
    }
        catch(e){return 'error occured';}
    return '';
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }

}
