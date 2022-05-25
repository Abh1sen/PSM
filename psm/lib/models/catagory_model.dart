import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  //TODO will need to swap assets with company approved ones
  static List<Category> categories = [
    Category(
        name: 'Mukena',
        imageUrl:
            'https://barkah.id/wp-content/uploads/2020/08/30-1536x1536.jpg'),
    Category(
        name: 'HomeDress',
        imageUrl:
            'https://s1.bukalapak.com/img/6838424321/w-1000/batik_sikak_daun_sirih_baju_daster_wanita_tidur_hamil_muslim.jpg'),
    Category(
        name: 'Tunic',
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71XUSsJFJML._UY741_.jpg'),
  ];
}
