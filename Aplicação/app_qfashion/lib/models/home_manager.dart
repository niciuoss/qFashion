// import 'package:app_qfashion/models/section.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class HomeManager {
//   HomeManager(){
//     _loadSections();
//   }
//
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   Future<void> _loadSections() async {
//     firestore.collection('home').snapshots().listen((snapshot){
//       for(final DocumentSnapshot document in snapshot.documents){
//
//       }
//     })
//
//   }
// }