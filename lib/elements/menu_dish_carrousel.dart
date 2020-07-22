import 'package:flutter/material.dart';

class MenuDishCarrousel extends StatelessWidget {
  const MenuDishCarrousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MenuDishCarrouselElement(),
          MenuDishCarrouselElement(),
          MenuDishCarrouselElement(),
          MenuDishCarrouselElement(),
          MenuDishCarrouselElement(),
          MenuDishCarrouselElement(),
        ],
      ),
    );
  }
}

class MenuDishCarrouselElement extends StatelessWidget {
  const MenuDishCarrouselElement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //* CARD BACKGROUND
      height: 200,
      width: 175,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //* IMAGE
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://www.photojaanic.com/blog/wp-content/uploads/sites/2/2017/07/food-photography-tips-photojaanic-3-1-1080x720.jpg',
                ),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
            ),
          ),
          //* TITLE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Text(
              "voluptatum sequi",
              style: titleTextStyle,
            ),
          ),
          //* TITLE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "\$ 450",
              style: priceTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle titleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle priceTextStyle = TextStyle(
  fontSize: 16,
);
