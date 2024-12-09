class Product {
  final dynamic id;
  final dynamic name;
  final dynamic imageUrl;
  final dynamic description;
  final dynamic price;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['title'],
      imageUrl: json['thumbnail'],
      description: json['description'],
      price: json['price'],
    );
  }
}
