import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  // ignore: missing_return
  static Future<String> getUserId() async {
    try {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      return user.uid;
    } catch (e) {
      print('Error in authentication --------------- ${e.toString()}');
    }
  }

  static Future<void> signUpNewUser(String email, String password, String name,
      String phone, String address) async {
    try{
      var authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await Firestore.instance
          .collection('users')
          .document(authResult.user.uid)
          .setData({
        'uName': name,
        'email': email,
        'phone': phone,
        'address': address
      });
    }catch(e){
      print('Error in authentication --------------- ${e.toString()}');
      throw e.toString();
    }

  }

  static Future<void> signIn(String email, String password) async{
    try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      print(getUserId());
    }catch(e){
      throw e.toString();
    }

  }

  static Future<void> signOut() async{
    FirebaseAuth.instance.signOut();
  }

  static Future<void> forgotPassword(String email) async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
