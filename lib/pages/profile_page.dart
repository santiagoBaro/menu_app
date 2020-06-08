import 'package:flutter/material.dart';
import 'package:menuapp/elements/local_carousell.dart';
import 'package:menuapp/elements/local_review.dart';
import 'package:menuapp/elements/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(),
          Container(height: 20),
          LocalCarrousel(
            title: "Lugares Pendientes",
          ),
          LocalCarrousel(
            title: "Vistos Recientemente",
          ),
          LocalReview(),
          LocalReview(),
          LocalReview(),
          LocalReview(),
        ],
      ),
    );
  }
}
