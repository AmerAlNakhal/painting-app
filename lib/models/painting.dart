class Painting {
  late String id;
  late String productName;
  late String productPrice;
  late String ownerName;
  late String details;
  late String urlImage;

  Painting({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.ownerName,
    required this.details,
    required this.urlImage,
  });

  Painting.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.productName = map['productName'];
    this.productPrice = map['productPrice'];
    this.ownerName = map['ownerName'];
    this.details = map['details'];
    this.urlImage = map['urlImage'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this.id;
    map['productName'] = this.productName;
    map['productPrice'] = this.productPrice;
    map['ownerName'] = this.ownerName;
    map['details'] = this.details;
    map['urlImage'] = this.urlImage;
    return map;
  }
}
