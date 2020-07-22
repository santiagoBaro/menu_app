import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:menuapp/elements/map_marker.dart';

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
          //* MAPS INITIAL LOCATION ADN ZOOM
          center: LatLng(-34.92, -56.157),
          zoom: 15.0,
          minZoom: 13.0,
          maxZoom: 17.0,
        ),
        layers: [
          TileLayerOptions(
            //* MAPBOX API
            tileProvider: NonCachingNetworkTileProvider(),
            urlTemplate:
                "https://api.mapbox.com/styles/v1/santiagobaro/ckb0x78li0kph1iqcx27d4qhx/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FudGlhZ29iYXJvIiwiYSI6ImNrYXp0OGp1dzAxb2oyenBtd2Z6dGgxamUifQ.bpQmu_H15SfrR8pNhpTAAA",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1Ijoic2FudGlhZ29iYXJvIiwiYSI6ImNrYXp0OGp1dzAxb2oyenBtd2Z6dGgxamUifQ.bpQmu_H15SfrR8pNhpTAAA',
              'id': 'mapbox.mapbox-basic',
            },
          ),
          MarkerLayerOptions(
            //* LIST OF MARKERS
            markers: [
              //* USER'S LOCATION
              Marker(
                  point: LatLng(-34.92, -56.157),
                  builder: (ctx) => Stack(
                        children: [
                          Center(
                            child: Icon(
                              Icons.trip_origin,
                              color: Colors.blueGrey[200],
                              size: 30,
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.brightness_1,
                              color: Colors.blueGrey,
                              size: 18,
                            ),
                          ),
                        ],
                      )),
              Marker(
                anchorPos: AnchorPos.align(AnchorAlign.top),
                width: 60.0,
                height: 50.0,
                point: LatLng(-34.9195, -56.157),
                builder: (ctx) => Container(
                  child: MapMarker(
                    localID: "1",
                    typeIcon: Icons.fastfood,
                    timeValue: "45m",
                    priceValue: "275",
                    starValue: "4",
                  ),
                ),
              ),
              Marker(
                anchorPos: AnchorPos.align(AnchorAlign.top),
                width: 60.0,
                height: 50.0,
                point: LatLng(-34.9185, -56.154),
                builder: (ctx) => Container(
                  child: MapMarker(
                    localID: "1",
                    typeIcon: Icons.restaurant,
                    timeValue: "45m",
                    priceValue: "275",
                    starValue: "4",
                  ),
                ),
              ),
              Marker(
                anchorPos: AnchorPos.align(AnchorAlign.top),
                width: 60.0,
                height: 50.0,
                point: LatLng(-34.919, -56.165), //
                builder: (ctx) => Container(
                  child: MapMarker(
                    localID: "1",
                    typeIcon: Icons.local_pizza,
                    timeValue: "45m",
                    priceValue: "275",
                    starValue: "4",
                  ),
                ),
              ),
              Marker(
                anchorPos: AnchorPos.align(AnchorAlign.top),
                width: 60.0,
                height: 50.0,
                point: LatLng(-34.923, -56.162), //
                builder: (ctx) => Container(
                  child: MapMarker(
                    localID: "1",
                    typeIcon: Icons.cake,
                    timeValue: "30m",
                    priceValue: "200",
                    starValue: "5",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
