part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistProductsRemoveEvent extends WishlistEvent {
  final ProductModel productModel;

  WishlistProductsRemoveEvent({required this.productModel});
}

class WishlistAddAllProductsToCartButtonClickedEvent extends WishlistEvent {}
