class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String asset;
  final String collection;
  final int stock;
  final List<String> sizes;
  final List<String> colors;
  final double saleDiscount;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.asset,
    required this.collection,
    required this.stock,
    required this.sizes,
    required this.colors,
    required this.saleDiscount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      asset: json['asset'] as String,
      collection: json['collection'] as String,
      stock: json['stock'] as int,
      sizes: List<String>.from(json['sizes'] as List),
      colors: List<String>.from(json['colors'] as List),
      saleDiscount: (json['saleDiscount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'asset': asset,
      'collection': collection,
      'stock': stock,
      'sizes': sizes,
      'colors': colors,
      'saleDiscount': saleDiscount,
    };
  }

  String get priceFormatted => '£${price.toStringAsFixed(2)}';

  bool get isInStock => stock > 0;

  bool get hasVariants => sizes.isNotEmpty || colors.isNotEmpty;

  bool get isOnSale => saleDiscount > 0;

  double get salePrice => price * (1 - saleDiscount / 100);

  String get salePriceFormatted => '£${salePrice.toStringAsFixed(2)}';
}
