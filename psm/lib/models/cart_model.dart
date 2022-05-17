import 'package:equatable/equatable.dart';
import 'package:psm/models/models.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  double get subtotal =>
      products.fold(0.0, (total, current) => total + current.price);

  //todo ask how delivery price is decided
  double deliveryFee(subtotal) {
    if (subtotal >= 200000.0) {
      return 0.0;
    } else {
      return 30000.0;
    }
  }

  //todo ask if provide free delivery
  String freeDelivery(subtotal) {
    if (subtotal >= 200000.0) {
      return 'Congrats! You have free delivery';
    } else {
      double remain = 200000.0 - subtotal;
      return 'Add Rp${remain.toStringAsFixed(2)} for a FREE delivery';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get deliveryfeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freedeliveryString => freeDelivery(subtotal);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
