import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {

  UserData({required this.email, required this.password, required this.name, required this.confirmPassword, required this.id});

  String? id;
  late String email;
  late String password;
  late String confirmPassword;
  late String name;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');


  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'email': email,
    };
  }

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

}