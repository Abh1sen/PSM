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

    //TODO dont forget to add appropriate image Url
    Product(
      name: 'Mukena 1', 
      category: 'Mukena', 
      imageUrl: 'https://fikashop.com/wp-content/uploads/2020/03/m034-1.jpeg', 
      price: 50000, 
      isRecommended: true, 
      isPopular: true
    ),
    Product(
      name: 'Mukena 2', 
      category: 'Mukena', 
      imageUrl: 'https://s4.bukalapak.com/img/4778080082/w-1000/MUKENA_AQILLA_EXTRA_JUMBO_.jpg', 
      price: 50000, 
      isRecommended: true, 
      isPopular: false
    ),
    Product(
      name: 'Mukena 3', 
      category: 'Mukena', 
      imageUrl: 'https://cdn.elevenia.co.id/g/7/2/9/1/0/3/28729103_B.jpg', 
      price: 50000, 
      isRecommended: false, 
      isPopular: false
    ),
    Product(
      name: 'HomeDress 1', 
      category: 'HomeDress', 
      imageUrl: 'https://th.bing.com/th/id/OIP.bi3F4YemopeBeIO_tt1bIQHaHa?pid=ImgDet&rs=1', 
      price: 30000, 
      isRecommended: true, 
      isPopular: false
    ),
    Product(
      name: 'HomeDress 2', 
      category: 'HomeDress', 
      imageUrl: 'https://loqalindonesia.com/wp-content/uploads/2020/12/DASTER-RENDA-SERUT-SLETING-1-FILEminimizer.jpg', 
      price: 30000, 
      isRecommended: false, 
      isPopular: false
    ),
  ];
}
