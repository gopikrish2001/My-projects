import 'package:flutter/material.dart';
import 'package:project/bloc_app/features/cart/bloc/cart_bloc.dart';
import 'package:project/bloc_app/features/home/model/product_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final CartBloc cartBloc;

  const CartTileWidget(
      {super.key, required this.productModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Image(
              image: NetworkImage(productModel.imageUrl),
              width: 60,
              height: 60),
          SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      productModel.quantity,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove_circle_outline),
          ),
          Text('1'),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle_outline),
          ),
          Text(
            "\$${productModel.price.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              cartBloc.add(
                CartProductsRemoveEvent(productModel: productModel),
              );
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}

