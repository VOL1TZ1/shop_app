import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/CustomWidgets/custom_cart.dart';
import 'package:shop_app/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: listOfCart.length,
          itemBuilder: (context, index) {
            return customCart(listOfCart, index,itemCount);
          },
        ),
      ),
    );
  }
}
