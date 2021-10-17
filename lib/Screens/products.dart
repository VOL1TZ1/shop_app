import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/CustomWidgets/custom_products.dart';
import 'package:shop_app/Objects/product.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  //Variables
  var listOfProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 7.0,
                mainAxisSpacing: 7.0,
              ),
              itemBuilder: (context, index) {
                return custom_product(listOfProducts[index], context);
              },
              itemCount: listOfProducts.length,
            );
          },
        ),
      ),
    );
  }


  //Methods
  Future getProducts() async {
    listOfProducts = [];
    var responseP = await http
        .get(Uri.parse('https://retail.amit-learning.com/api/products'));
    if (responseP.statusCode == 200) {
      var lOP = jsonDecode(responseP.body)['products'];
      //print(lOP.length);
      for (int m = 0; m < lOP.length; m++) {
        listOfProducts.add(Product.fromJson(lOP[m]));
        //print(listOfProducts);
        //print(listOfProducts.length);
      }
      return listOfProducts;
    }
  }

//    @override
//    void initState() {
//      getProducts();
//    }
}
