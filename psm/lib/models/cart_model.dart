import 'package:equatable/equatable.dart';
import 'package:psm/models/models.dart';

class Cart extends Equatable {
  Cart();

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subtotalString => subtotal.toStringAsFixed(2);

  List<Product> products = [
    Product(
        name: 'Mukena 1',
        category: 'Mukena',
        imageUrl: 'https://fikashop.com/wp-content/uploads/2020/03/m034-1.jpeg',
        price: 50000,
        isRecommended: true,
        isPopular: true),
    Product(
        name: 'Mukena 2',
        category: 'Mukena',
        imageUrl:
            'https://s4.bukalapak.com/img/4778080082/w-1000/MUKENA_AQILLA_EXTRA_JUMBO_.jpg',
        price: 50000,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'HomeDress 1',
        category: 'HomeDress',
        imageUrl:
            'https://th.bing.com/th/id/OIP.bi3F4YemopeBeIO_tt1bIQHaHa?pid=ImgDet&rs=1',
        price: 30000,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'HomeDress 2',
        category: 'HomeDress',
        imageUrl:
            'https://loqalindonesia.com/wp-content/uploads/2020/12/DASTER-RENDA-SERUT-SLETING-1-FILEminimizer.jpg',
        price: 30000,
        isRecommended: false,
        isPopular: true),
  ];

  @override
  List<Object?> get props => [];
}
