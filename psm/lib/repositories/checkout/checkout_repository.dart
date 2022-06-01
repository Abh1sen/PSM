import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:psm/models/catagory_model.dart';
import 'package:psm/models/models.dart';
import 'package:psm/repositories/category/base_category_repository.dart';

class CheckoutRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
