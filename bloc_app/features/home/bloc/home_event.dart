part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class ProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;

  ProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class ProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;

  ProductCartButtonClickedEvent({required this.clickedProduct});
}

//class ProductImageButtonClickedEvent extends HomeEvent{}

//class HomeSearchButtonClickedEvent extends HomeEvent{}

class HomeCartButtonNavigateEvent extends HomeEvent {}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeMenuButtonNavigateEvent extends HomeEvent{}
