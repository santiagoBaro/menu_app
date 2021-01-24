import 'package:flutter/material.dart';
import 'package:menuapp/elements/triangle_painter.dart';
import 'package:menuapp/tools/visual_assets.dart';

import 'menu_tabbed_body.dart';

class NewMapMarker extends StatelessWidget {
  final String localID;
  final Color color;
  final String timeValue;
  final String starValue;
  final String priceValue;
  final IconData typeIcon;
  const NewMapMarker({
    Key key,
    this.localID,
    this.color,
    this.timeValue,
    this.starValue,
    this.priceValue,
    this.typeIcon,
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
              color: color,
            ),
            child: GestureDetector(
              onTap: () => funcMarkerTapped(context),
              child: Row(children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            //* RATEING ICON
                            Icons.star,
                            color: Colors.yellow,
                            size: 7,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                              //* RATEING VALUE
                              // shows the avarage rateing
                              starValue,
                              style: mapMarkerTextStyle),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            //* DURATION ICON
                            Icons.timer,
                            color: Colors.yellow,
                            size: 7,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                              //* DURATION ICON
                              // shows the avarage customar stay
                              timeValue,
                              style: mapMarkerTextStyle),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            //* PRICE ICON
                            Icons.attach_money,
                            color: Colors.yellow,
                            size: 7,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                              //* PRICE VALUE
                              // shows the locals avarage cost per person
                              priceValue,
                              style: mapMarkerTextStyle),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  //* ICON
                  // shows what type of establishment the local is
                  typeIcon,
                  color: Colors.yellow,
                  size: 18,
                ),
              ]),
            ),
            width: 57,
            height: 38,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            painter: TrianglePainter(
              strokeColor: color,
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
          content: Container(
            constraints: BoxConstraints(maxWidth: 700),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                //* POP-UP BODY
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //* BANNER IMAGE
                    Container(
                      height: (MediaQuery.of(context).size.width - 48) / 3,
                      constraints: BoxConstraints(maxHeight: 260),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://user-images.githubusercontent.com/37426199/87575121-d2659e80-c6a5-11ea-86cc-8284ab1956ea.png',
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                      ),
                    ),

                    //* MENU BODY
                    Expanded(
                      child: MenuTabbedBody(),
                    ),
                  ],
                ),
                //* CLOSE ICON
                Positioned(
                  right: 15.0,
                  top: 15.0,
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
                //* SAVE BUTTON
                Positioned(
                  left: 5.0,
                  top: 5.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.bookmark_border),
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
                //* BOOK TABLE BUTTON
                Positioned(
                  left: 40.0,
                  top: 5.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.av_timer),
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
