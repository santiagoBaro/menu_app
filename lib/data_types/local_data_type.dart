import 'local_types_enum.dart';

class LocalPointer {
  final String id;
  final String name;
  final double lat;
  final double lng;
  final local_types type;

  LocalPointer({
    this.id,
    this.name,
    this.lat,
    this.lng,
    this.type,
  });

  LocalPointer.fromJson(Map json)
      : id = json['_id'],
        name = json['name'],
        lat = json['lat'],
        lng = json['lng'],
        type = json['type'];

  Map<dynamic, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'lat': lat,
        'lng': lng,
        'type': type,
      };
}

class Local {
  final String id;
  final String name;
  final double lat;
  final double lng;
  final local_types type;
  final double ranking;
  final String time;
  final List<String> chips;
  final double serviceRateing;
  final String bannerImage;
  final double foodRateing;
  final int averageCost;
  final String menu;
  final String reviews;
  //TODO add availability

  Local({
    this.id,
    this.name,
    this.lat,
    this.lng,
    this.type,
    this.chips,
    this.ranking,
    this.time,
    this.serviceRateing,
    this.bannerImage,
    this.foodRateing,
    this.averageCost,
    this.menu,
    this.reviews,
  });

  Local.fromJson(Map json)
      : id = json['_id'],
        name = json['name'],
        lat = json['lat'],
        lng = json['lng'],
        type = json['type'],
        ranking = json['ranking'],
        chips = json['chips'],
        time = json['time'],
        serviceRateing = json['service_rateing'],
        bannerImage = json['banner_image'],
        foodRateing = json['food_rateing'],
        averageCost = json['average_cost'],
        menu = json['menu'],
        reviews = json['reviews'];
}
