import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'item_size.dart';

class Product extends ChangeNotifier {

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
  }



  late String id;
  late String name;
  late String description;
  late List<String> images;
  List<ItemSize>? sizes;

  ItemSize? _selectedSize;

  ItemSize? get selectedSize => _selectedSize;

  set selectedSize(ItemSize? value){
    _selectedSize = value;
    notifyListeners();
  }

  int? get totalStock {
    int stock = 0;
    for(final size in sizes!){
      stock += size.stock;
    }
    return stock;
  }

  bool get hasStock {
    return totalStock! > 0;
  }

}