import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/CustomWidgets/custom_counter.dart';
import 'package:shop_app/Objects/product.dart';

import '../constants.dart';

class ProductPage extends StatelessWidget {
  ProductPage(this.p);
  Product p;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(p.avatar),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,8,0),
                  child: Text(
                    p.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,8,0),
                  child: Text(
                    p.name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 16,
                    ),
                  ),
                ),
                //const SizedBox(height: 10,),
                const Divider(
                  color: Colors.white,
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        p.price_final_text,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () { listOfCart.add(p); },
                        child: const Center(
                          child:Text('Add to Cart')
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8,0,8,0),
                  child: Text(
                    'Description',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,8,0),
                  child: Text(
                    '"${p.description}"',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),


              ],
            ),
      )
  );


  }

}
