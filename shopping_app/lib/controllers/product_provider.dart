import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/services/helper.dart';

class ProductNotifier extends ChangeNotifier {
  int _activepage = 0;

  int get activepage => _activepage;

  set activePage(int newIndex) {
    _activepage = newIndex;
    notifyListeners();
  }

  late Future<List<Products>> food;
  late Future<List<Products>> bowl;
  late Future<List<Products>> toy;
  late Future<List<Products>> careTool;
  late Future<List<Products>> carrier;
  late Future<List<Products>> scratchingPost;
  late Future<List<Products>> litterBox;

  void getFood() {
    food = Helper().getFoods();
  }

  void getBowl() {
    bowl = Helper().getBowls();
  }

  void getToy() {
    toy = Helper().getToys();
  }

  void getCareTool() {
    careTool = Helper().getCareTools();
  }

  void getCarrier() {
    carrier = Helper().getCarriers();
  }

  void getScratchingPost() {
    scratchingPost = Helper().getScratchingPosts();
  }

  void getLitterBox() {
    litterBox = Helper().getLitterBoxes();
  }

  late Future<Products> product;

  void getProducts(String category, String id) {
    if (category == "Food") {
      product = Helper().getFoodsById(id);
    } else if (category == "Bowls") {
      product = Helper().getBowlsById(id);
    } else if (category == "Toys") {
      product = Helper().getToysById(id);
    } else if (category == "Care Tools") {
      product = Helper().getCareToolsById(id);
    } else if (category == "Carrier") {
      product = Helper().getCarriersById(id);
    } else if (category == "Scratching Post") {
      product = Helper().getScratchingPostsById(id);
    } else {
      product = Helper().getLitterBoxesById(id);
    }
  }
}
