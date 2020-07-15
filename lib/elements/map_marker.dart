import 'package:flutter/material.dart';
import 'package:menuapp/elements/triangle_painter.dart';

import 'menu_tabbed_body.dart';

class MapMarker extends StatelessWidget {
  final String localID;
  final String timeValue;
  final String starValue;
  final String priceValue;
  final IconData typeIcon;
  const MapMarker({
    Key key,
    @required this.localID,
    @required this.priceValue,
    @required this.starValue,
    @required this.timeValue,
    @required this.typeIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.redAccent,
            ),
            child: GestureDetector(
              onTap: () => funcMarkerTapped(context),
              child: Column(
                children: [
                  Container(height: 5),
                  Icon(
                    //* ICON
                    // shows what type of establishment the local is
                    typeIcon,
                    color: Colors.yellow,
                    size: 20,
                  ),
                  Container(height: 3),
                  //fastfood
                  //restaurant
                  //cake
                  //local_pizza
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 1),
                      Icon(
                        //* RATEING ICON
                        Icons.star,
                        color: Colors.yellow,
                        size: 7,
                      ),
                      Text(
                        //* RATEING VALUE
                        // shows the avarage rateing
                        starValue,
                        style: TextStyle(
                          fontSize: 7,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        //* DURATION ICON
                        Icons.timer,
                        color: Colors.yellow,
                        size: 7,
                      ),
                      Text(
                        //* DURATION ICON
                        // shows the avarage customar stay
                        timeValue,
                        style: TextStyle(
                          fontSize: 7,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        //* PRICE ICON
                        Icons.attach_money,
                        color: Colors.yellow,
                        size: 7,
                      ),
                      Text(
                        //* PRICE VALUE
                        // shows the locals avarage cost per person
                        priceValue,
                        style: TextStyle(
                          fontSize: 7,
                          color: Colors.white,
                        ),
                      ),
                      Container(width: 2),
                    ],
                  ),
                ],
              ),
            ),
            width: 57,
            height: 38,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            painter: TrianglePainter(
              strokeColor: Colors.redAccent,
              strokeWidth: 10,
              paintingStyle: PaintingStyle.fill,
            ),
            child: Container(
              height: 12,
              width: 20,
            ),
          ),
        ),
      ],
    );
  }
}

funcMarkerTapped(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              //* POP-UP BODY
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //* BANNER IMAGE
                  Container(
                    child: Image.network(
                        'https://user-images.githubusercontent.com/37426199/87575121-d2659e80-c6a5-11ea-86cc-8284ab1956ea.png'),
                  ),
                  //* MENU
                  Container(
                    child: MenuTabbedBody(),
                  ),
                ],
              ),
              //* CLOSE ICON
              Positioned(
                right: -15.0,
                top: -15.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    radius: 15,
                    child: Icon(Icons.close),
                    backgroundColor: Colors.redAccent[400],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
