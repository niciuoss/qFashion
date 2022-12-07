import 'package:app_qfashion/common/custom_drawer/custom_drawer.dart';
import 'package:app_qfashion/models/page_maneger.dart';
import 'package:app_qfashion/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login/login_screen.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_)=>PageManeger(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          // LoginScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home'),
            ),
          ),

          ProductsScreen(),
          // Scaffold(
          //   drawer: CustomDrawer(),
          //   appBar: AppBar(
          //     title: const Text('Produtos'),
          //   ),
          // ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Pedidos'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Lojas'),
            ),
          )
        ],
      ),
    );
  }
}
