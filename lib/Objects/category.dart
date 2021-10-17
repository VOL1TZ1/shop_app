class Category{
  late int id;
  late String name;
  late String avatar;

  Category.fromJson(Map<String,dynamic> productMap){
    id=productMap['id'];
    name=productMap['name'];
    avatar=productMap['avatar'];
  }
}