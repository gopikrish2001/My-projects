import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/bloc_app/data/wishlist_items.dart';
import 'package:project/bloc_app/features/home/model/product_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistProductsRemoveEvent>(wishlistProductsRemoveEvent);
    on<WishlistAddAllProductsToCartButtonClickedEvent>(
        wishlistAddAllProductsToCartButtonClickedEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistProductsRemoveEvent(
      WishlistProductsRemoveEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productModel);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistAddAllProductsToCartButtonClickedEvent(
      WishlistAddAllProductsToCartButtonClickedEvent event,
      Emitter<WishlistState> emit) {
    print('all products are added');
    emit(WishlistNavigateToCartPageActionState());
  }
}
