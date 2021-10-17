import 'package:flutter/material.dart';
import 'package:shop_app/Screens/login.dart';

import 'Screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const home_screen(),
    theme:ThemeData.dark(),
  )
  );
}


