import 'package:flutter/material.dart';
import 'package:shop_app/Screens/login.dart';

import 'revision.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  LoginScreen(),
    theme:ThemeData.dark(),
  )
  );
}


