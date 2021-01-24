import 'package:flutter/material.dart';
import 'package:menuapp/tools/visual_assets.dart';

class MenuDishGrouped extends StatelessWidget {
  const MenuDishGrouped({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //* TITLE
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Group Title",
          style: onboardingTextStyle,
        ),
      ),
      //* SEPARATOR
      Container(
        height: 1,
        color: Colors.black26,
        margin: EdgeInsets.symmetric(horizontal: 10),
      ),
      //* DISHES
      MenuDishElement(),
      MenuDishElement(),
      MenuDishElement(),
      MenuDishElement(),
    ]);
  }
}

class MenuDishElement extends StatefulWidget {
  MenuDishElement({Key key}) : super(key: key);

  @override
  _MenuDishElementState createState() => _MenuDishElementState();
}

class _MenuDishElementState extends State<MenuDishElement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //* NAME
                  "ducimus odit sapiente",
                  style: menuDishTitleTextStyle,
                ),
                Text(
                  //* DESCRIPTION
                  "Inventore rerum minima perferendis ut a laboriosam aliquid asperiores.",
                  style: menuDishTextTextStyle,
                ),
                Text(
                  //* PRICE
                  "\$ 450",
                  style: menuDishPriceTextStyle,
                ),
              ],
            ),
          ),
          Container(
            //* IMAGE
            height: 125,
            width: 125,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://www.photoblog.com/learn/wp-content/uploads/2017/07/176A3739a.jpg',
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle menuDishTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle menuDishTextTextStyle = TextStyle(
  fontSize: 12,
);

TextStyle menuDishPriceTextStyle = TextStyle();
