import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {

  UserData({required this.email, required this.password, required this.name, required this.confirmPassword, required this.id});

  UserData.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document['name'] as String;
    email = document['email'] as String;
  }

  String? id;
  late String email;
  late String password;
  late String confirmPassword;
  late String name;
  late bool? admin;

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