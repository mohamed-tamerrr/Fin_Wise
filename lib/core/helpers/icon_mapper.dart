import 'package:flutter/material.dart';

class IconMapper {
  static IconData getIcon(String iconName) {
    switch (iconName) {
      case 'fork_knife':
        return Icons.restaurant;

      case 'money':
        return Icons.attach_money_sharp;

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

      case 'house':
        return Icons.electrical_services;

      case 'graduation_cap':
        return Icons.school;

      case 'car':
        return Icons.directions_car;

      case 'shirt':
        return Icons.checkroom;

      case 'paw_print':
        return Icons.pets;

      case 'airplane':
        return Icons.flight;

      case 'phone':
        return Icons.phone_android;

      case 'wifi':
        return Icons.wifi;

      case 'credit_card':
        return Icons.credit_card;

      case 'baby':
        return Icons.child_care;

      case 'dumbbell':
        return Icons.fitness_center;

      case 'wine_glass':
        return Icons.local_bar;

      case 'gas_pump':
        return Icons.local_gas_station;

      case 'tools':
        return Icons.build;

      case 'heart':
        return Icons.favorite;

      case 'briefcase':
        return Icons.work;

      case 'question_mark':
        return Icons.help_outline;

      default:
        return Icons.category;
    }
  }
}
