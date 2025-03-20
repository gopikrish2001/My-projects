import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/bloc_app/data/cart_items.dart';
import 'package:project/bloc_app/features/home/model/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartProductsRemoveEvent>(cartProductsRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartProductsRemoveEvent(
      CartProductsRemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productModel);
    emit(CartSuccessState(cartItems: cartItems));
  }
}
