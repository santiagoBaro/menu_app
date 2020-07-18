import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

const String accesKey =
    "pk.eyJ1Ijoic2FudGlhZ29iYXJvIiwiYSI6ImNrYXp0OGp1dzAxb2oyenBtd2Z6dGgxamUifQ.bpQmu_H15SfrR8pNhpTAAA";

class NewExplorePage extends StatefulWidget {
  NewExplorePage({Key key}) : super(key: key);

  @override
  _NewExplorePageState createState() => _NewExplorePageState();
}

const double usersLat = -34.921102;
const double usersLng = -56.160373;

class _NewExplorePageState extends State<NewExplorePage> {
  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    MapboxMap mapboxMap = MapboxMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: LatLng(usersLat, usersLng),
        zoom: 13,
        tilt: 45,
      ),
    );
    return SafeArea(
      child: mapboxMap,
    );
  }
}
