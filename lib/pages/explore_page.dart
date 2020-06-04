import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(-34.92, -56.157),
          zoom: 15.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/santiagobaro/ckb0x78li0kph1iqcx27d4qhx/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FudGlhZ29iYXJvIiwiYSI6ImNrYXp0OGp1dzAxb2oyenBtd2Z6dGgxamUifQ.bpQmu_H15SfrR8pNhpTAAA",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1Ijoic2FudGlhZ29iYXJvIiwiYSI6ImNrYXp0OGp1dzAxb2oyenBtd2Z6dGgxamUifQ.bpQmu_H15SfrR8pNhpTAAA',
              'id': 'mapbox.mapbox-basic',
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(-34.92, -56.157),
                builder: (ctx) => Container(
                  child: FlutterLogo(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
