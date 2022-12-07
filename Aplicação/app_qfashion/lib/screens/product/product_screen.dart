import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:app_qfashion/models/product.dart';

class ProductScreen extends StatelessWidget {

  const ProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final  primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: CarouselSlider(
              items: product.images.map((url) => Container(
                child: Center(
                  child: Image.network(url),),)).toList(),
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16/9,
                autoPlay: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'A partir de',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                ),
                Text(
                  'R\$ 19,99',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Tamanhos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
