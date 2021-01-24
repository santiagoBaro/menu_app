import 'package:menuapp/data_types/data_types_export.dart';

class User {
  final String id;
  final String nickname;
  final String image;
  final List<LocalPointer> savedLocals;
  final List<Review> reviews;
  final List<LocalPointer> recentlyViewed;

  User({
    this.id,
    this.nickname,
    this.image,
    this.savedLocals,
    this.reviews,
    this.recentlyViewed,
  });

  User.fromJson(Map json)
      : id = json['_id'],
        nickname = json['nick_name'],
        image = json['image'],
        savedLocals = json['saved_locals'],
        reviews = json['reviews'],
        recentlyViewed = json['recently_viewed_locals'];
}
