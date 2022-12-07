

import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_size.dart';

class Product {

  Product.fromDocument(DocumentSnapshot docs){
    name = docs['name'] as String;
    description = docs['description'] as String;
    id = docs.id;
    images = List<String>.from(docs['images'] as List<dynamic>);
    try{
      sizes = (docs.get('sizes') as List<dynamic> ).map(
              (s) => ItemSize.fromMap(s as Map<String, dynamic>)).toList();
    }catch(e){
      sizes = ([]).map(
              (s) => ItemSize.fromMap(s as Map<String, dynamic>)).toList();
    }

    print(sizes);
  }

  late String id;
  late String name;
  late String description;
  late List<String> images;
  late List<ItemSize> sizes;

}