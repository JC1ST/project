import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controllers/favorites_provider.dart';
import 'package:shopping_app/controllers/product_provider.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/views/shared/app_style.dart';
import 'package:shopping_app/views/shared/checkout_btn.dart';
import 'package:shopping_app/views/ui/favorites.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.category});

  final String id;
  final String category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _cartBox = Hive.box('cart_box');

  Future<void> _createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getProducts(widget.category, widget.id);
    var favoritesNotifier =
        Provider.of<FavoritesNotifier>(context, listen: true);
    favoritesNotifier.getFavorites();
    return Scaffold(
      body: FutureBuilder<Products>(
        future: productNotifier.product,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final product = snapshot.data;
            return Consumer<ProductNotifier>(
              builder: (context, productNotifier, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(AntIcons.closeOutlined),
                            ),
                            GestureDetector(
                              onTap: null,
                              child: Icon(Ionicons.ellipsis_horizontal),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      floating: true,
                      snap: false,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.39,
                                    color: Colors.grey.shade300,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(product!.image),
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.095,
                                    right: 16,
                                    child: Consumer<FavoritesNotifier>(
                                      builder:
                                          (context, favoritesNotifier, child) {
                                        return GestureDetector(
                                          onTap: () {
                                            if (favoritesNotifier.ids
                                                .contains(widget.id)) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Favorites(),
                                                ),
                                              );
                                            } else {
                                              favoritesNotifier.createFav({
                                                "id": product.id,
                                                "name": product.name,
                                                "category": product.category,
                                                "price": product.price,
                                                "image": product.image,
                                              });
                                            }
                                            setState(() {});
                                          },
                                          child: favoritesNotifier.ids
                                                  .contains(product.id)
                                              ? Icon(AntIcons.heartFilled)
                                              : Icon(AntIcons.heartOutlined),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height *
                                      0.625,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: appstyle(
                                            35,
                                            Colors.black,
                                            FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              product.category,
                                              style: appstyle(
                                                17,
                                                Colors.grey,
                                                FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            RatingBar.builder(
                                              initialRating: 4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 20,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 1),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                size: 18,
                                                color: Colors.black,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$${product.price}",
                                              style: appstyle(
                                                24,
                                                Colors.black,
                                                FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Divider(
                                          indent: 5,
                                          endIndent: 5,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 10),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: Text(
                                            product.description,
                                            style: appstyle(20, Colors.black,
                                                FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 12),
                                            child: CheckoutButton(
                                              onTap: () async {
                                                _createCart({
                                                  "id": product.id,
                                                  "name": product.name,
                                                  "category": product.category,
                                                  "image": product.image,
                                                  "price": product.price,
                                                  "qty": 1,
                                                });
                                                Navigator.pop(context);
                                              },
                                              label: "Add to Cart",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
