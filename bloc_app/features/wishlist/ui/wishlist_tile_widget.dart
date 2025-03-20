import 'package:flutter/material.dart';
import 'package:project/bloc_app/features/home/model/product_model.dart';
import 'package:project/bloc_app/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final WishlistBloc wishlistBloc;

  const WishlistTileWidget(
      {super.key, required this.productModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image(
          image: NetworkImage(productModel.imageUrl),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          productModel.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(productModel.quantity),
                Text(",Price")
              ],
            ),
          ],
        ),
        selected: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("\$${productModel.price.toStringAsFixed(2)}",style: TextStyle(
              fontSize:15,fontWeight: FontWeight.bold
            ),),
            IconButton(
              onPressed: () {
                wishlistBloc.add(
                  WishlistProductsRemoveEvent(productModel: productModel),
                );
              },
              icon: Icon(
                Icons.clear,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );

  }
}
