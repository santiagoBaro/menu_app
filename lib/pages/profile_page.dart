import 'package:flutter/material.dart';
import 'package:menuapp/elements/local_carousell.dart';
import 'package:menuapp/elements/local_review.dart';
import 'package:menuapp/elements/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

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
            ProfileHeader(
              name: "John Cena",
              title: "food critique",
              imageurl: "",
              amountOfRateings: 45,
              averageRateingValue: 4,
              pendingLocals: 5,
            ),
            Container(height: 20),
            LocalCarrousel(
              title: "Pending",
            ),
            LocalCarrousel(
              title: "Recently Viewed",
            ),
            LocalReview(
              localImageUrl: "",
              localName: "ea qui libero",
              usersReview:
                  "Quaerat veniam dolorem est temporibus eos. Dolorem sed neque fugit voluptatum animi eveniet voluptates. Ut quam quasi et. Deserunt aspernatur et laboriosam. Harum unde explicabo vel repudiandae inventore aut.",
            ),
            LocalReview(
              localImageUrl: "",
              localName: "est dolorem illo",
              usersReview:
                  "Aut quis quae qui necessitatibus est non aut. Qui magnam molestiae nulla aut magni mollitia eos est. Dolor delectus sint iste ut. Consequatur omnis minima molestiae praesentium ut sunt nisi consequuntur ut. Exercitationem distinctio ea.",
            ),
            LocalReview(
              localImageUrl: "",
              localName: "eos ducimus labore",
              usersReview:
                  "Magnam nobis ipsa libero perspiciatis facilis quaerat assumenda earum.",
            ),
            LocalReview(
              localImageUrl: "",
              localName: "magni sint blanditiis",
              usersReview:
                  "Ipsum veritatis inventore doloremque ad tenetur sit. Consectetur nulla doloribus hic. Omnis praesentium non a. In ut officiis deleniti velit modi nisi. Exercitationem fugiat nobis.",
            ),
          ],
        ),
      ),
    );
  }
}
