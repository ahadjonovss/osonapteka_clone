class Drugs {
  // "id": 1,
// // "name": "Тримол",
// // "description": "активные вещества: Маханараяна Таила 0,15 г, Махамауша Таила 0,15 г, гвоздичное масло 0,12 г, вспомогательные вещества: белый воск, ланолин, вазелиновое масло, отдушка лаванды.",
// // "imageUrl": "https://pharmaclick.uz/upload/ammina.optimizer/jpg-webp/q80/upload/resize_cache/iblock/7e4/500_500_2a39b7ffe18fe12060444318487cf4494/cwhk4lnwvyc34tbq2fwic0xbvf22tjz2.webp",
// // "price": 5000,
// // "quantity": 300

  int id;
  String name;
  String description;
  String imageUrl;
  num price;
  num quantity;
  int count=0;

  Drugs(
      {required this.name,
        required this.price,
        required this.description,
        required this.id,
        required this.imageUrl,
        required this.quantity});


  factory Drugs.fromJson(Map<String,dynamic> json){
    int id = json['id'] as int;
    String name = json['name'] as String;
    String description = json['description'] as String;
    String imageUrl = json['imageUrl'] as String;
    num price = json['price'] as num;
    num quantity  = json['quantity'] as num;

    return Drugs(name: name, price: price, description: description, id: id, imageUrl: imageUrl, quantity: quantity);


  }
//
}
