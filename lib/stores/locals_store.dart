import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import '../data_types/data_types_export.dart';
import 'package:flutter_flux/flutter_flux.dart';

const String db = "http://localhost:12345/";
const double latSize = 0.045;
const double lngSize = 0.00125;

const double latEdge = 0.009;
const double lngEdge = 0.00025;

class LocalsRepo {
  Future<Stream<Local>> getLocals() async {
    String endpoint = "GetLocalsGeo";
    LocationData usersLocation = await getUsersLocation();

    //* this function calculates the cuadrant where the user is in,
    //* and checks for edge cases

    int latGroup = (usersLocation.latitude / latSize).floor();
    int lngGroup = (usersLocation.longitude / lngSize).floor();

    double latMod = usersLocation.latitude % latSize;
    double lngMod = usersLocation.latitude % lngSize;
    String group = getGroup(latMod, lngMod);

    String url = db +
        endpoint +
        "/" +
        latGroup.toString() +
        "/" +
        lngGroup.toString() +
        "/" +
        group;

    var client = http.Client();
    var streamedRes = await client.send(http.Request('get', Uri.parse(url)));

    return streamedRes.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((body) => (body as List))
        .map((json) => Local.fromJson(json));
  }

  Future<LocationData> getUsersLocation() async {
    //* this function checks if the user has location available
    //* and then retrives the position in LocationData format
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  String getGroup(double latMod, double lngMod) {
    if (latMod <= latEdge) {
      if (lngMod <= lngEdge) {
        return "5"; //* ADD GROUPS BOTTOM, LEFT & BOTTOM-LEFT
      } else if (lngMod >= lngSize - lngEdge) {
        return "6"; //* ADD GROUPS TOP, LEFT & TOP-LEFT
      } else {
        return "1"; //* ADD GROUP LEFT
      }
    } else if (latMod >= latSize - latEdge) {
      if (lngMod <= lngEdge) {
        return "8"; //* ADD GROUPS BOTTOM, RIGHT & BOTTOM RIGHT
      } else if (lngMod >= lngSize - lngEdge) {
        return "7"; //* ADD GROUPS TOP, RIGHT & TOP RIGHT
      } else {
        return "2"; //* ADD GROUP RIGHT
      }
    } else {
      if (lngMod <= lngEdge) {
        return "4"; //* ADD GROUP BOTTOM
      } else if (lngMod >= lngSize - lngEdge) {
        return "3"; //* ADD GROUP TOP
      } else {
        return "0"; //* NO ADDED GROUP
      }
    }
  }
}

class LocalsStore extends Store {
  final repo = LocalsRepo();

  LocalsStore() {
    triggerOnAction(loadLocalsAction, (nothing) async {
      var stream = await repo.getLocals();
      if (_locals.isEmpty) {
        stream.listen((local) => _locals.add(local));
      } else {
        _locals.clear();
        stream.listen((local) => _locals.add(local));
      }
    });
  }

  final List<Local> _locals = <Local>[];
  List<Local> get locals => List<Local>.unmodifiable(_locals);
}

final Action loadLocalsAction = Action();
final StoreToken localsStoreToken = StoreToken(LocalsStore());
