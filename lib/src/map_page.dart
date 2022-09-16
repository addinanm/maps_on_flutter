import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LatLng udacoding = LatLng(-7.716402, 112.101896);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps in Flutter"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        // nampilin list view karna ingin nampilin beberapa maps
        children: <Widget>[
          //coba buat didalam card
          Card(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Udacoding',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Center(
                    child: SizedBox(
                      width: 300.0,
                      height: 300.0,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: udacoding,
                          zoom: 11.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
