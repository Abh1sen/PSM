import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];
  //TODO will need to swap assets with company approved ones
  static List<Category> categories = [
    Category(
        name: 'Mukena',
        imageUrl:
            'https://barkah.id/wp-content/uploads/2020/08/30-1536x1536.jpg'),
    Category(
        name: 'HomeDress',
        imageUrl:
            'https://loqalindonesia.com/wp-content/uploads/2020/12/DASTER-RENDA-SERUT-SLETING-1-FILEminimizer.jpg'),
    Category(
        name: 'Tunic',
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71XUSsJFJML._UY741_.jpg'),
  ];
}
