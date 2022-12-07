import 'package:app_qfashion/common/custom_drawer/custom_drawer.dart';
import 'package:app_qfashion/models/product_manager.dart';
import 'package:app_qfashion/screens/products/components/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_qfashion/screens/products/components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<ProductManager>(
          builder: (_, productManager, __){
            if(productManager.search.isEmpty){
              return const Text('Produtos');
            } else {
              return LayoutBuilder(
                builder: (_, constraints){
                  // constraints.biggest.width
                  return GestureDetector(
                    onTap: () async{
                      final search = await showDialog<String>(context: context,
                          builder: (_) => SearchDialog(
                            productManager.search
                          ));
                      if(search != null){
                        context.read<ProductManager>().search = search;
                      }
                    },
                    child: Container(
                      width: constraints.biggest.width,
                      child: Text(
                        productManager.search,
                        textAlign: TextAlign.center,
                      )
                    ),
                  );
                },
              );
            }
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          Consumer<ProductManager>(
            builder: (_, productManager, __){
              if(productManager.search.isEmpty){
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async{
                    final search = await showDialog<String>(context: context,
                        builder: (_) => SearchDialog(
                            productManager.search
                        ));
                    if(search != null){
                      context.read<ProductManager>().search = search;
                    }
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    context
                        .read<ProductManager>()
                        .search = '';
                  }
                );
              }
            },
          )
        ]
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __){
          final filteredProducts = productManager.filteredProducts;
          return ListView.builder(
            padding: const EdgeInsets.all(4),
              itemCount: productManager.filteredProducts.length,
              itemBuilder: (_, index){
                return ProductListTile(productManager.filteredProducts[index]);
              }
          );
        }
      ),
    );
  }
}
