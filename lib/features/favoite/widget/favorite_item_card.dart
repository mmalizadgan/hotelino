import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotels.dart';

class FavoriteItemCard extends StatelessWidget {
  FavoriteItemCard({
    super.key,
    required this.hotel,
    required this.onRemovefavoriteClick,
  });
  Function onRemovefavoriteClick;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only());
  }
}
