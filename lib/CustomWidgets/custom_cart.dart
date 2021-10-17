import 'package:shop_app/CustomWidgets/custom_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Objects/product.dart';



Widget customCart(List<Product> p, int index, int itemCount) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(
              p[index].avatar,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                p[index].title,
                maxLines: 2,
                ),
                Text(
                  "${p[index].price*itemCount}",
                  maxLines: 2,
                ),
              ],
            ),
          ),
          const Counter(),
        ],
      ));
}
