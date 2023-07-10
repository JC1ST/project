import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/views/shared/app_style.dart';
import 'package:shopping_app/views/shared/new_products.dart';
import 'package:shopping_app/views/shared/product_card.dart';
import 'package:shopping_app/views/ui/product_by_cat.dart';
import 'package:shopping_app/views/ui/product_page.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Products>> product,
    required this.tabIndex,
  }) : _product = product;

  final Future<List<Products>> _product;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.38,
          child: FutureBuilder<List<Products>>(
            future: _product,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final food = snapshot.data;
                return ListView.builder(
                  itemCount: food!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(
                              id: product.id,
                              category: product.category,
                            ),
                          ),
                        );
                      },
                      child: ProductCard(
                        price: "\$${product.price}",
                        category: product.category,
                        id: product.id,
                        name: product.name,
                        image: product.image,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 18, 12, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Products",
                    style: appstyle(
                      22,
                      Colors.black,
                      FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductByCat(tabIndex: tabIndex),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appstyle(
                            19,
                            Colors.black54,
                            FontWeight.w500,
                          ),
                        ),
                        Icon(
                          AntIcons.caretRightFilled,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.14,
          child: FutureBuilder<List<Products>>(
            future: _product,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final food = snapshot.data;
                return ListView.builder(
                  itemCount: food!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewProducts(image: product.image),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
