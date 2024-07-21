import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map> transactions = [
  {
    'icon' : FontAwesomeIcons.burger,
    'color' : Colors.yellow[700],
    'name' : 'Food',
    'amount' : '-\$45.00',
    'time' : 'Today',
  },
  {
    'icon' : FontAwesomeIcons.bagShopping,
    'color' : Colors.purple,
    'name' : 'Shopping',
    'amount' : '-\$280.00',
    'time' : 'Today',
  },
  {
    'icon' : FontAwesomeIcons.video,
    'color' : Colors.red.shade500,
    'name' : 'Entertainment',
    'amount' : '-\$60.00',
    'time' : 'Yesterday',
  },
  {
    'icon' : FontAwesomeIcons.planeUp,
    'color' : Colors.green,
    'name' : 'Travel',
    'amount' : '-\$350.00',
    'time' : 'Yesterday',
  }
];

List<IconData> icons = [
  Icons.lunch_dining,
  Icons.shopping_bag_outlined,
  Icons.style,
  Icons.home,
  Icons.pets,
  Icons.phone_android_rounded,
  Icons.airplanemode_active_rounded,
];