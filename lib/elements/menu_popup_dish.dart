import 'package:flutter/material.dart';
import 'package:menuapp/tools/visual_assets.dart';

class MenuPopUpDish extends StatefulWidget {
  MenuPopUpDish({Key key}) : super(key: key);

  @override
  _MenuPopUpDishState createState() => _MenuPopUpDishState();
}

class _MenuPopUpDishState extends State<MenuPopUpDish> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      //* IMAGE
      Container(),
      Column(
        children: <Widget>[
          Text(
            "maxime nesciunt ducimus",
            style: postTitleTextStyle,
          ),
          Text(
            "Quia quam excepturi. Ut aspernatur nobis magni reprehenderit. Et architecto voluptatem tenetur voluptatem error. Est culpa commodi non ipsam. Cupiditate deleniti sit atque dolores distinctio culpa. Sit est qui.",
            style: onboardingMessageTextStyle,
          )
        ],
      ),
    ]);
  }
}
