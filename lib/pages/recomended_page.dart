import 'package:flutter/material.dart';
import 'package:menuapp/elements/local_carousell.dart';

class RecomendedPage extends StatelessWidget {
  const RecomendedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 15,
            blurRadius: 12,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      constraints: BoxConstraints(maxWidth: 700),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //* BANNER
              height: 200,
              margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            //! PLACEHOLDER CARROUSELLS
            LocalCarrousel(
              title: "our recomendations for you",
            ),
            LocalCarrousel(
              title: "fast food",
            ),
            LocalCarrousel(
              title: "Pasta",
            ),
            LocalCarrousel(
              title: "Pizza",
            ),
            LocalCarrousel(
              title: "romantic night-out",
            ),
          ],
        ),
      ),
    );
  }
}
