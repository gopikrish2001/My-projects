import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc_app/features/cart/ui/cart.dart';
import 'package:project/bloc_app/features/home/bloc/home_bloc.dart';
import 'package:project/bloc_app/features/home/ui/categorychip.dart';
import 'package:project/bloc_app/features/home/ui/drawbar_properties/drawbar.dart';
import 'package:project/bloc_app/features/home/ui/product_tile_widget.dart';
import 'package:project/bloc_app/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override  
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToMenuPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Drawbar()));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is ProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Product Carted'),
            ),
          );
        } else if (state is ProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Product Wishlisted'),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            homeBloc.add(HomeMenuButtonNavigateEvent());
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 28,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('Welcome, Gopi.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                homeBloc.add(HomeCartButtonNavigateEvent());
                              },
                              icon:
                                  Icon(Icons.shopping_cart_outlined, size: 28),
                            ),
                            SizedBox(width: 16),
                            IconButton(
                              onPressed: () {
                                homeBloc.add(HomeWishlistButtonNavigateEvent());
                              },
                              icon: Icon(Icons.favorite_border_outlined,
                                  size: 28),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for fruit salad combos',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(Icons.tune, color: Colors.grey),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Categories
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CategoryChip(label: 'All'),
                            CategoryChip(label: 'Salad Combo'),
                            CategoryChip(label: 'Berry Combo'),
                            CategoryChip(label: 'Mango Combo'),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Recommended Combo',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7, // Adjust as needed
                        ),
                        itemCount: successState.products.length,
                        itemBuilder: (context, index) {
                          return ProductTileWidget(
                              productModel: successState.products[index],
                              homeBloc: homeBloc);
                        },
                        shrinkWrap:
                            true, // Required to wrap content within available space
                        physics:
                            NeverScrollableScrollPhysics(), // Disable internal scrolling of GridView
                      ),
                    ],
                  ),
                ),
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}

/*const SizedBox(height: 10),
GridView.count(
crossAxisCount: 2,
crossAxisSpacing: 10,
mainAxisSpacing: 10,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
children: const [
CategoryCard(categoryName: 'Accounting'),
CategoryCard(categoryName: 'Ad Agent'),
CategoryCard(categoryName: 'Banking'),
CategoryCard(categoryName: 'Below 12th'),
// Add more CategoryCard widgets as needed
],
),*/

/*L Expanded(
                      child:
                    ),ListView.builder(
scrollDirection: Axis.horizontal,
itemCount: successState.products.length,
itemBuilder: (context, intex) {
return ProductTileWidget(
productModel: successState.products[intex],
homeBloc: homeBloc);
},
),*/
