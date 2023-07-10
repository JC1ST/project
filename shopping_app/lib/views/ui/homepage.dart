import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/controllers/product_provider.dart';
import 'package:shopping_app/views/shared/app_style.dart';
import 'package:shopping_app/views/shared/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 7, vsync: this);

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
              child: Container(
                padding: EdgeInsets.only(left: 8, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cat Products",
                      style: appstyleWithHt(
                          36, Colors.white, FontWeight.bold, 1.5),
                    ),
                    Text(
                      "Collection",
                      style: appstyleWithHt(
                          36, Colors.white, FontWeight.bold, 1.2),
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
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.26),
              child: Container(
                padding: EdgeInsets.only(left: 12),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HomeWidget(product: productNotifier.food, tabIndex: 0),
                    HomeWidget(product: productNotifier.bowl, tabIndex: 1),
                    HomeWidget(product: productNotifier.toy, tabIndex: 2),
                    HomeWidget(product: productNotifier.careTool, tabIndex: 3),
                    HomeWidget(product: productNotifier.carrier, tabIndex: 4),
                    HomeWidget(
                        product: productNotifier.scratchingPost, tabIndex: 5),
                    HomeWidget(product: productNotifier.litterBox, tabIndex: 6),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
