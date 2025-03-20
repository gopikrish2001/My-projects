import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/bloc_app/data/cart_items.dart';
import 'package:project/bloc_app/data/grocery_data.dart';
import 'package:project/bloc_app/data/wishlist_items.dart';
import 'package:project/bloc_app/features/home/model/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeMenuButtonNavigateEvent>(homeMenuButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<ProductWishlistButtonClickedEvent>(productWishlistButtonClickedEvent);
    on<ProductCartButtonClickedEvent>(productCartButtonClickedEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.homeProducts
            .map(
              (e) => ProductModel(
                id: e['id'],
                name: e['name'],
                price: e['price'],
                quantity: e['quantity'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('cart  navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist  navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> productWishlistButtonClickedEvent(
      ProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print(' wishlist clicked');
    wishlistItems.add(event.clickedProduct);
    emit(ProductItemWishlistedActionState());
  }

  FutureOr<void> productCartButtonClickedEvent(
      ProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print(' plus clicked');
    cartItems.add(event.clickedProduct);
    emit(ProductItemCartedActionState());
  }

  FutureOr<void> homeMenuButtonNavigateEvent(
      HomeMenuButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('menu navigate clicked');
    emit(HomeNavigateToMenuPageActionState());
  }
}
