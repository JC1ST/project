import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controllers/cart_provider.dart';
import 'package:shopping_app/views/shared/app_style.dart';
import 'package:shopping_app/views/shared/checkout_btn.dart';
import 'package:shopping_app/views/ui/mainscreen.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCart();
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "My Cart",
                  style: appstyle(36, Colors.black, FontWeight.bold),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.535,
                  child: ListView.builder(
                    itemCount: cartProvider.cart.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = cartProvider.cart[index];
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
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Image.asset(
                                            data['image'],
                                            width: 70,
                                            height: 70,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -2,
                                          child: GestureDetector(
                                            onTap: () {
                                              cartProvider
                                                  .deleteCart(data['key']);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MainScreen(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(12),
                                                ),
                                              ),
                                              child: Icon(
                                                AntIcons.deleteOutlined,
                                                size: 17,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 8, left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: appstyle(
                                              18,
                                              Colors.black,
                                              FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            data['category'],
                                            style: appstyle(
                                              14,
                                              Colors.grey,
                                              FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "\$${data['price']}",
                                            style: appstyle(
                                              16,
                                              Colors.black,
                                              FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                // cartProvider.decrement();
                                              },
                                              child: Icon(
                                                AntIcons.minusSquareFilled,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              data['qty'].toString(),
                                              style: appstyle(
                                                14,
                                                Colors.black,
                                                FontWeight.w600,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // cartProvider.increment();
                                              },
                                              child: Icon(
                                                AntIcons.plusSquareFilled,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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
            Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(label: "Proceed to Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
