import 'package:order_app/restaurant/model/restaurant_model.dart';

import '../../common/const/data.dart';

class RestaurantDetailModel extends RestaurantModel {
  final String detail;
  final List<RestaurantProductModel> products;

  RestaurantDetailModel({
    required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required super.ratings,
    required this.detail,
    required this.products,
  });

  factory RestaurantDetailModel.fromJson({required Map<String, dynamic> json}) {
    return RestaurantDetailModel(
        id: json['id'],
        name: json['name'],
        thumbUrl: 'http://$ip${json['thumbUrl']}',
        tags: List<String>.from(json['tags']),
        priceRange: RestaurantPriceRange.values
            .firstWhere((element) => element.name == json['priceRange']),
        ratingsCount: json['ratingsCount'],
        deliveryTime: json['deliveryTime'],
        deliveryFee: json['deliveryFee'],
        ratings: json['ratings'],
        detail: json['detail'],
        products: json['products'].map<RestaurantProductModel>((item) => RestaurantProductModel(
            id: item['id'],
            name: item['name'],
            imgUrl: item['imgUrl'],
            detail: item['detail'],
            price: item['price'])).toList());
  }
}

class RestaurantProductModel {
  final String id;
  final String name;
  final String imgUrl;
  final String detail;
  final int price;

  RestaurantProductModel(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.detail,
      required this.price});
}