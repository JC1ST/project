import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:piano_map/map_test.dart';
import 'package:piano_map/models/place_model.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.185,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/piano_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.78,
                child: FutureBuilder(
                  future: readJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(
                        child: Text(
                          "${data.error}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (data.hasData) {
                      var places = data.data as List<PlaceModel>;
                      return ListView.builder(
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            // 위도, 경도를 인자값으로 전달해 그 위치를 Google Map으로 띄우기
                            onTap: () {
                              showPopup(
                                context,
                                places[index].title,
                                places[index].latitude,
                                places[index].longitude,
                              );
                            },
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 32, bottom: 32, left: 16, right: 16),
                                child: Column(
                                  children: [
                                    Text(
                                      places[index].title.toString(),
                                      style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<PlaceModel>> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/json/piano.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => PlaceModel.fromJson(e)).toList();
  }

  void showPopup(context, title, latitude, longitude) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: MapTest(
              lat: latitude,
              lng: longitude,
            ),
          ),
        );
      },
    );
  }
}
