import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controllers/product_provider.dart';
import 'package:shopping_app/views/shared/app_style.dart';
import 'package:shopping_app/views/shared/category_btn.dart';
import 'package:shopping_app/views/shared/custom_spacer.dart';
import 'package:shopping_app/views/shared/latest_products.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 7, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getFood();
    productNotifier.getBowl();
    productNotifier.getToy();
    productNotifier.getCareTool();
    productNotifier.getCarrier();
    productNotifier.getScratchingPost();
    productNotifier.getLitterBox();

    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 28, 0, 0),
              height: MediaQuery.of(context).size.height * 0.29,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/cat_bg4.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            AntIcons.closeOutlined,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: Icon(
                            FontAwesomeIcons.sliders,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appstyle(23, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.5),
                    tabs: [
                      Tab(text: "Food"),
                      Tab(text: "Bowls"),
                      Tab(text: "Toys"),
                      Tab(text: "Care Tools"),
                      Tab(text: "Carrier"),
                      Tab(text: "Scratching Post"),
                      Tab(text: "Litter Box"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.21,
                left: 16,
                right: 16,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    latestProducts(product: productNotifier.food),
                    latestProducts(product: productNotifier.bowl),
                    latestProducts(product: productNotifier.toy),
                    latestProducts(product: productNotifier.careTool),
                    latestProducts(product: productNotifier.carrier),
                    latestProducts(product: productNotifier.scratchingPost),
                    latestProducts(product: productNotifier.litterBox),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 5;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.821,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSpacer(),
                  Text(
                    "Filter",
                    style: appstyle(36, Colors.black, FontWeight.bold),
                  ),
                  CustomSpacer(),
                  Text(
                    "Product",
                    style: appstyle(20, Colors.black, FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    children: [
                      CategoryBtn(
                        label: "Food",
                        buttonClr: Colors.black,
                      ),
                      CategoryBtn(
                        label: "Bowls",
                        buttonClr: Colors.grey,
                      ),
                      CategoryBtn(
                        label: "Toys",
                        buttonClr: Colors.grey,
                      ),
                      CategoryBtn(
                        label: "Care",
                        buttonClr: Colors.grey,
                      ),
                      CategoryBtn(
                        label: "Carrier",
                        buttonClr: Colors.grey,
                      ),
                      CategoryBtn(
                        label: "Scratching",
                        buttonClr: Colors.grey,
                      ),
                      CategoryBtn(
                        label: "Litter Box",
                        buttonClr: Colors.grey,
                      ),
                    ],
                  ),
                  CustomSpacer(),
                  Text(
                    "Price(\$)",
                    style: appstyle(20, Colors.black, FontWeight.bold),
                  ),
                  CustomSpacer(),
                  Slider(
                    value: _value,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                    thumbColor: Colors.black,
                    max: 20,
                    divisions: 5,
                    label: _value.toString(),
                    secondaryTrackValue: 20,
                    onChanged: (double value) {},
                  ),
                  CustomSpacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
