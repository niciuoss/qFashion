import 'package:cloud_firestore/cloud_firestore.dart';

class Product {

  Product.fromDocument(DocumentSnapshot docs){
    name = docs['name'] as String;
    description = docs['description'] as String;
    id = docs.id;
    images = List<String>.from(docs['images'] as List<dynamic>);
  }

  late String id;
  late String name;
  late String description;
  late List<String> images;
}