import 'package:flutter/material.dart';

class IconMapper {
  static IconData getIcon(String iconName) {
    switch (iconName) {
      case 'fork_knife':
        return Icons.restaurant;

      case 'bus':
        return Icons.directions_bus;

      case 'pill':
        return Icons.medication;

      case 'bag':
        return Icons.shopping_bag;

      case 'hand_holding':
        return Icons.home;

      case 'gift':
        return Icons.card_giftcard;

      case 'coins':
        return Icons.savings;

      case 'ticket':
        return Icons.movie;

      default:
        return Icons.category;
    }
  }
}
