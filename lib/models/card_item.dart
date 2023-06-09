import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardItem {
  final int id;
  final String imagePath;
  GlobalKey<FlipCardState> cardState;

  CardItem({
    required this.id,
    required this.imagePath,
    required this.cardState,
  });
}
