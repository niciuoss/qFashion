import 'package:app_qfashion/models/page_maneger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  // const DrawerTile({Key? key}) : super(key: key);
  DrawerTile({ required this.title, required this.iconData, required this.page});
  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManeger>().page;
    return InkWell(
      onTap: (){
        context.read<PageManeger>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: Colors.grey[700],
              ),
            ),
            Text(title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700]
              ),
            )
          ],
        ),
      ),
    );
  }
}
