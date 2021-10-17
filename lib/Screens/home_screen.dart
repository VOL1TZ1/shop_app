import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Screens/products.dart';
import '../constants.dart';
import 'cart.dart';
import 'categories.dart';
import 'login.dart';


class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  int _currentScreen=0;
  PageController pageController=PageController();
  final screens=[
    const ProductsPage(),
    const CatPage(),
    const CartPage(),
    LoginScreen()
  ];

  void onTapped(int index){
    setState(() {
      _currentScreen=index;
    });
    pageController.animateToPage(index,duration: const Duration(milliseconds: 400),curve: Curves.easeInCirc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        iconSize: 27.0,
        items: const [
          BottomNavigationBarItem(label:'Home', icon: Icon(Icons.home_max_outlined)),
          BottomNavigationBarItem(label:'Categories', icon: Icon(Icons.graphic_eq_outlined)),
          BottomNavigationBarItem(label:'Cart', icon: Icon(Icons.shopping_cart_outlined)),
          BottomNavigationBarItem(label:'Account', icon: Icon(Icons.switch_account_outlined)),
        ],
        currentIndex:_currentScreen,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryLightColor,
        onTap: onTapped,
      ),
    );
  }
}
