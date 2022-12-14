import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_qfashion/helpers/firebase_errors.dart';
import 'package:app_qfashion/models/user_data.dart';

class UserManager extends ChangeNotifier {
  bool get isLoggedIn => user != null;


  userManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn({
    required UserData userData, required Function onFail, required Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: userData.email!, password: userData.password!);

      user = result.user!;

      // await Future.delayed(Duration(seconds: 2));
      onSuccess();
      print(result.user!.uid);
    } on FirebaseAuthException catch(e){
      //print(e.code);
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  Future<void> signUp({
    required UserData user, required Function onFail, required Function onSuccess}) async {
    loading = true;
    try{
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: userData.email, password: userData.password);

      // user = result.user;

      user.id = result.user.uid;

      await user.saveData();

      onSuccess();

    } on FirebaseAuthException catch (e){
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    final User? currentUser = await auth.currentUser;
    if (currentUser != null) {
      user = currentUser;
      print(user?.uid);
    }
    notifyListeners();
  }


}