import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  //TODO add sizes

  final String name;
  final String category;
  final String imageUrl;
  final int price;
  final bool isRecommended;
  final bool isPopular;
  final int quantity;
  final String description;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    required this.quantity,
    required this.description,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular,quantity,description];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular'],
        quantity: snap['quantity'],
        description: snap['description']);
    return product;
  }

  static List<Product> products = [
    //TODO add sample products

    //TODO dont forget to add appropriate image Url
    Product(
        name: 'Mukena 1',
        category: 'Mukena',
        imageUrl: 'https://fikashop.com/wp-content/uploads/2020/03/m034-1.jpeg',
        price: 50000,
        isRecommended: true,
        isPopular: true,
        quantity: 25,
        description: 'This is Mukena 1',
    ),
    Product(
        name: 'Mukena 2',
        category: 'Mukena',
        imageUrl:
            'https://s4.bukalapak.com/img/4778080082/w-1000/MUKENA_AQILLA_EXTRA_JUMBO_.jpg',
        price: 50000,
        isRecommended: true,
        isPopular: false,
        quantity: 25,
        description: 'This is Mukena 2',
    ),
    Product(
        name: 'Mukena 3',
        category: 'Mukena',
        imageUrl: 'https://cdn.elevenia.co.id/g/7/2/9/1/0/3/28729103_B.jpg',
        price: 50000,
        isRecommended: false,
        isPopular: false,
        quantity: 25,
        description: 'This is Mukena 3',
    ),
    Product(
        name: 'HomeDress 1',
        category: 'HomeDress',
        imageUrl:
            'https://th.bing.com/th/id/OIP.bi3F4YemopeBeIO_tt1bIQHaHa?pid=ImgDet&rs=1',
        price: 30000,
        isRecommended: true,
        isPopular: false,
        quantity: 25,
        description: 'This is HomeDress 1',
    ),
    Product(
        name: 'HomeDress 2',
        category: 'HomeDress',
        imageUrl:
            'https://s1.bukalapak.com/img/6838424321/w-1000/batik_sikak_daun_sirih_baju_daster_wanita_tidur_hamil_muslim.jpg',
        price: 30000,
        isRecommended: false,
        isPopular: true,
        quantity: 25,
        description: 'This is HomeDress 2',
    ),
  ];
}
