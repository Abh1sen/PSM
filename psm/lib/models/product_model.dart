import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, 
      category, 
      imageUrl, 
      price, 
      isRecommended, 
      isPopular
      ];
  
  static List<Product> products=[
    //TODO add sample products
    Product(
      name: name, 
      category: category, 
      imageUrl: imageUrl, 
      price: price, 
      isRecommended: isRecommended, 
      isPopular: isPopular
    ),
  ]
}
