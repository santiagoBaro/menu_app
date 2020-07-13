import 'dart:ffi';

class Review {
  final String id;
  final String userId;
  final String localId;
  final Float rateing;
  final String comment;

  Review({
    this.id,
    this.userId,
    this.localId,
    this.rateing,
    this.comment,
  });

  Review.fromJson(Map json)
      : id = json['_id'],
        userId = json['user_id'],
        localId = json['local_id'],
        rateing = json['rateing'],
        comment = json['comment'];
}