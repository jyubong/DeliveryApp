import 'package:flutter/material.dart';
import 'package:order_app/common/const/colors.dart';

import '../model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;
  final bool isDetail;
  final String? detail;

  const RestaurantCard(
      {super.key,
      required this.image,
      required this.name,
      required this.tags,
      required this.ratingsCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.ratings,
      this.isDetail = false,
      this.detail});

  factory RestaurantCard.fromModel(
      {required RestaurantModel model, bool isDetail = false}) {
    return RestaurantCard(
      image: Image.network(
        model.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: model.name,
      tags: model.tags,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      ratings: model.ratings,
      isDetail: isDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isDetail) image,
        if (!isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: image,
          ),
        SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16.0 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                tags.join(' · '),
                style: TextStyle(color: BODY_TEXT_COLOR, fontSize: 14.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  IconText(icon: Icons.star, label: ratings.toString()),
                  renderDot(),
                  IconText(icon: Icons.receipt, label: ratingsCount.toString()),
                  renderDot(),
                  IconText(
                      icon: Icons.timelapse_outlined, label: '$deliveryTime 분'),
                  renderDot(),
                  IconText(
                      icon: Icons.monetization_on,
                      label: deliveryFee == 0 ? '무료' : deliveryFee.toString()),
                ],
              ),
              if(detail != null && isDetail)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(detail!),
                )
            ],
          ),
        ),
      ],
    );
  }

  renderDot() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          ' · ',
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
        ));
  }
}

class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}