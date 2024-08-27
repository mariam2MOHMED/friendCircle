import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication{
  static final auth=FirebaseAuth.instance;
  static  createUser(String email,String password)async{

     await auth.createUserWithEmailAndPassword(email: email, password: password);

  }
  static login(String email,String password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print("error ${e.toString()}");
      return null;
    }
  }
  static Future<UserCredential> signInWithGoogle() async {

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken!,
      idToken: googleAuth?.idToken!,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  static signOut()async{
    await auth.signOut();
  }
}