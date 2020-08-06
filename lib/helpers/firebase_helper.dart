import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {

  // ignore: missing_return
  static Future<String> getUserId() async {
    try{
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      return user.uid;
    }catch(e){
      print('Error in authentication --------------- ${e.toString()}');
    }

  }
}
