part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartProductsRemoveEvent extends CartEvent {
  final ProductModel productModel;

  CartProductsRemoveEvent({required this.productModel});
}
