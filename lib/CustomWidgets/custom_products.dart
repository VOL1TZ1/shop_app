import 'package:shop_app/Objects/product.dart';
import 'package:shop_app/Screens/product_page.dart';

import '../constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget custom_product(Product p, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductPage(p);
      }));
    },
    child: SizedBox(
      height: 190,
      width: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Image.network(
            p.avatar,
            fit: BoxFit.cover,
          )),
          Container(
              color: Colors.white,
              child: Text(
                p.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
                maxLines: 1,
              )),
          Container(
              color: Colors.white,
              child: Text(
                p.name,
                style: const TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 10,
                ),
                maxLines: 1,
              )),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    color: Colors.white,
                    child: Text(
                      p.price_final_text,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    )),
                Container(
                  height: 25,
                  // width: 35,
                  child: ElevatedButton(
                    onPressed: () { listOfCart.add(p); },
                    child: const Center(
                      child: Icon(
                        Icons.add_outlined,
                        color: kPrimaryLightColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
