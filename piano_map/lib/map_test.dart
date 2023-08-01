import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTest extends StatefulWidget {
  const MapTest({super.key, required this.lat, required this.lng});

  final String lat;
  final String lng;

  @override
  State<MapTest> createState() => _MapTestState();
}

class _MapTestState extends State<MapTest> {
  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();

    String latitude = widget.lat;
    String longitude = widget.lng;

    double latitude2 = double.parse(latitude);
    double longitude2 = double.parse(longitude);

    _markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(latitude2, longitude2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String latitude = widget.lat;
    String longitude = widget.lng;

    double latitude2 = double.parse(latitude);
    double longitude2 = double.parse(longitude);

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude2, longitude2),
          zoom: 17,
        ),
        mapType: MapType.normal,
        markers: Set.from(_markers),
      ),
    );
  }
}
