import 'package:flutter/material.dart';
import 'package:project/bloc_app/features/home/bloc/home_bloc.dart';
import 'package:project/bloc_app/features/home/model/product_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc;

  const ProductTileWidget({
    super.key,
    required this.productModel,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0, // Adjust aspect ratio to your needs
            child: Image.network(
              productModel.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productModel.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "\$" + productModel.price.toString(),
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(), // Pushes the buttons to the bottom of the container
          Row(
            children: [
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    ProductWishlistButtonClickedEvent(
                      clickedProduct: productModel,
                    ),
                  );
                },
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    ProductCartButtonClickedEvent(
                      clickedProduct: productModel,
                    ),
                  );
                },
                icon: Icon(Icons.shopping_basket_outlined, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            productModel.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + productModel.price.toString(),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        ProductWishlistButtonClickedEvent(
                          clickedProduct: productModel,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        ProductCartButtonClickedEvent(
                          clickedProduct: productModel,
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_basket_outlined,
                        color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}*/
