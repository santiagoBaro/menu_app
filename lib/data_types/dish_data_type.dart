import 'dart:ffi';
import 'dart:ui';

class Dish {
  final String id;
  final String name;
  final String group;
  final Float price;
  final String description;
  final List<Image> images;

  Dish({
    this.id,
    this.name,
    this.group,
    this.price,
    this.description,
    this.images,
  });

  Dish.fromJson(Map json)
      : id = json['_id'],
        name = json['name'],
        group = json['group'],
        description = json['description'],
        price = json['price'],
        images = json['images'];
}
