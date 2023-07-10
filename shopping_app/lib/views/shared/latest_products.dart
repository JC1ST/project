import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/views/shared/stagger_tile.dart';

class latestProducts extends StatelessWidget {
  const latestProducts({
    super.key,
    required Future<List<Products>> product,
  }) : _product = product;

  final Future<List<Products>> _product;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
      future: _product,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        } else {
          final food = snapshot.data;
          return StaggeredGridView.countBuilder(
            padding: EdgeInsets.zero,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            itemCount: food!.length,
            scrollDirection: Axis.vertical,
            staggeredTileBuilder: (index) => StaggeredTile.extent(
              (index % 2 == 0) ? 1 : 1,
              (index % 4 == 1 || index % 4 == 3)
                  ? MediaQuery.of(context).size.height * 0.38
                  : MediaQuery.of(context).size.height * 0.33,
            ),
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return StaggerTile(
                image: product.image,
                name: product.name,
                price: "\$${product.price}",
              );
            },
          );
        }
      },
    );
  }
}
