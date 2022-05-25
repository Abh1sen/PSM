import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:psm/models/catagory_model.dart';
import 'package:psm/repositories/Product/Product_repository.dart';

import '../../models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is LoadProducts) {
      yield* _mapLoadproductsToState();
    }
    if (event is UpdateProducts) {
      yield* _mapUpdateproductsToState(event);
    }
  }

  Stream<ProductState> _mapLoadproductsToState() async* {
    _productSubscription?.cancel();
    _productSubscription =
        _productRepository.getAllProducts().listen((products) => add(
              UpdateProducts(products),
            ));
  }

  Stream<ProductState> _mapUpdateproductsToState(
      UpdateProducts event) async* {
    yield ProductLoaded(products: event.products);
  }
}
