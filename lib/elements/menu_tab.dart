import 'package:flutter/material.dart';

import 'menu_dish_carrousel.dart';
import 'menu_dish_gouped.dart';

class MenuTab extends StatefulWidget {
  MenuTab({Key key}) : super(key: key);

  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MenuDishCarrousel(),
          MenuDishGrouped(),
          MenuDishGrouped(),
          MenuDishGrouped(),
        ],
      ),
    );
  }
}
