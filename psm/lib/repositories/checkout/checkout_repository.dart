import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psm/models/models.dart';
import 'package:psm/repositories/category/base_category_repository.dart';

class CheckoutRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }

  //Todo If there is a problem during running, its probably because of this
  @override
  Stream<List<Category>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }
}
