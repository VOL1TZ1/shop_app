import 'package:shop_app/Objects/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// custom_categories

Widget customC(Category C) {
  return GestureDetector(
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                color: Colors.white,
                width: 200,
                height: 200,
                child: Image.network(C.avatar)),

            Container(
                width: 200,
                height: 25,
                color: Colors.grey[200],
                child: Center(
                  child: Text(
                    C.name,
                    style: const TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20,
                    ),
                  ),
                )),
          ],
        )
    ),
    onTap: (){},
  );
}