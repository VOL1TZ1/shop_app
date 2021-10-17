class Product{
  late int id;
  late String name;
  late String title;
  late int category_id;
  late String? description;
  late int price;
  late int discount;
  late String? discount_type;
  late String currency;
  late int in_stock;
  late String avatar;
  late int price_final;
  late String price_final_text;

  Product.fromJson(Map<String,dynamic> productMap){
    id=productMap['id'];
    name=productMap['name'];
    title=productMap['title'];
    category_id=productMap['category_id'];
    description=productMap['description']??name;
    price=productMap['price'];
    discount=productMap['discount'];
    discount_type=productMap['discount_type'];
    currency=productMap['currency'];
    in_stock=productMap['in_stock'];
    avatar=productMap['avatar'];
    price_final=productMap['price_final'];
    price_final_text=productMap['price_final_text'];

  }
}