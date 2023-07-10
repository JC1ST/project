import 'package:flutter/services.dart';
import 'package:shopping_app/models/product_model.dart';

class Helper {
  Future<List<Products>> getFoods() async {
    final data = await rootBundle.loadString("assets/json/food.json");

    final foodList = ProductsFromJson(data);

    return foodList;
  }

  Future<List<Products>> getBowls() async {
    final data = await rootBundle.loadString("assets/json/bowls.json");

    final bowlList = ProductsFromJson(data);

    return bowlList;
  }

  Future<List<Products>> getToys() async {
    final data = await rootBundle.loadString("assets/json/toys.json");

    final toyList = ProductsFromJson(data);

    return toyList;
  }

  Future<List<Products>> getCareTools() async {
    final data = await rootBundle.loadString("assets/json/care_tools.json");

    final careToolList = ProductsFromJson(data);

    return careToolList;
  }

  Future<List<Products>> getCarriers() async {
    final data = await rootBundle.loadString("assets/json/carrier.json");

    final carrierList = ProductsFromJson(data);

    return carrierList;
  }

  Future<List<Products>> getScratchingPosts() async {
    final data =
        await rootBundle.loadString("assets/json/scratching_post.json");

    final scratchList = ProductsFromJson(data);

    return scratchList;
  }

  Future<List<Products>> getLitterBoxes() async {
    final data = await rootBundle.loadString("assets/json/litter_box.json");

    final litterBoxList = ProductsFromJson(data);

    return litterBoxList;
  }

  Future<Products> getFoodsById(String id) async {
    final data = await rootBundle.loadString("assets/json/food.json");

    final productList = ProductsFromJson(data);

    final product = productList.firstWhere((product) => product.id == id);

    return product;
  }

  Future<Products> getBowlsById(String id) async {
    final data = await rootBundle.loadString("assets/json/bowls.json");

    final productList = ProductsFromJson(data);

    final product = productList.firstWhere((product) => product.id == id);

    return product;
  }

  Future<Products> getToysById(String id) async {
    final data = await rootBundle.loadString("assets/json/toys.json");

    final productList = ProductsFromJson(data);

    final product = productList.firstWhere((product) => product.id == id);

    return product;
  }

  Future<Products> getCareToolsById(String id) async {
    final data = await rootBundle.loadString("assets/json/care_tools.json");

    final productList = ProductsFromJson(data);

    final product = productList.firstWhere((product) => product.id == id);

    return product;
  }

  Future<Products> getCarriersById(String id) async {
    final data = await rootBundle.loadString("assets/json/carrier.json");

    final productList = ProductsFromJson(data);

    final product = productList.firstWhere((product) => product.id == id);

    return product;
  }

  Future<Products> getScratchingPostsById(String id) async {
    final data =
        await rootBundle.loadString("assets/json/scratching_post.json");

    final productList = ProductsFromJson(data);

    final product = productList.firstWhere((product) => product.id == id);

    return product;
  }

  Future<Products> getLitterBoxesById(String id) async {
    final data = await rootBundle.loadString("assets/json/litter_box.json");

    final productList = ProductsFromJson(data);

    final product = productList.firstWhere((product) => product.id == id);

    return product;
  }
}
