import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MyAppMaps(),
    );
  }
}

class MyAppMaps extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppMaps> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _mapInitialPosition = CameraPosition(
    target: LatLng(-7.716402, 112.101896),
    zoom: 18.0,
  );

  CameraPosition _anotherPosition = CameraPosition(
    target: LatLng(-7.716402, 112.101896),
    zoom: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _mapInitialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _moveCamera,
        label: Text('GO'),
        icon: Icon(Icons.directions_walk),
      ),
    );
  }

  Future<void> _moveCamera() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_anotherPosition));
  }
}
