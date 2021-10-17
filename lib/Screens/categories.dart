import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/CustomWidgets/custom_categories.dart';
import 'package:shop_app/Objects/category.dart';

class CatPage extends StatefulWidget {
  const CatPage({Key? key}) : super(key: key);

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  var listOfCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: getCategories(),
          builder: (context, snapshot) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // crossAxisSpacing: 10
              ),

              itemBuilder: (context, index_1) {
                return customC(listOfCategories[index_1]);
              },
              itemCount: listOfCategories.length,
            );
          },
        ));
  }

  Future getCategories() async {
    listOfCategories=[];
    var responseC = await http
        .get(Uri.parse('https://retail.amit-learning.com/api/categories'));
    if (responseC.statusCode == 200) {
      var lOC = jsonDecode(responseC.body)['categories'];
      for (var m in lOC) {
        listOfCategories.add(Category.fromJson(m));
        print(listOfCategories.length);
      }
      return lOC;
    }
  }
}