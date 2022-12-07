import 'package:app_qfashion/common/custom_drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerTile(
            iconData: Icons.home,
            title: 'Início',
            page: 0,),
          DrawerTile(
              iconData: Icons.list,
              title: 'Produtos',
              page: 1),
          DrawerTile(
              iconData: Icons.playlist_add_check,
              title: 'Meus Pedidos',
              page: 2),
          DrawerTile(
              iconData: Icons.location_on,
              title: 'Lojas',
              page: 3)
        ],
      ),
    );
  }
}
