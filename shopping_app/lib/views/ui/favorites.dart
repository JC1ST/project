import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controllers/favorites_provider.dart';
import 'package:shopping_app/views/shared/app_style.dart';
import 'package:shopping_app/views/ui/mainscreen.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var favoritesNotifier = Provider.of<FavoritesNotifier>(context);
    favoritesNotifier.getAllData();
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.29,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/cat_bg4.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "My Favorites",
                  style: appstyle(36, Colors.white, FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 130),
                itemCount: favoritesNotifier.fav.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = favoritesNotifier.fav[index];
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              spreadRadius: 5,
                              blurRadius: 0.3,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Image.asset(
                                    product['image'],
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 12, left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product['name'],
                                        style: appstyle(
                                          16,
                                          Colors.black,
                                          FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        product['category'],
                                        style: appstyle(
                                          14,
                                          Colors.grey,
                                          FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${product['price']}',
                                            style: appstyle(
                                              18,
                                              Colors.black,
                                              FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  favoritesNotifier.deleteFav(product['key']);
                                  favoritesNotifier.ids.removeWhere(
                                      (element) => element == product['id']);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainScreen(),
                                    ),
                                  );
                                },
                                child: Icon(Ionicons.heart_dislike),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
