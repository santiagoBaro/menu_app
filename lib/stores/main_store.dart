import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import '../data_types/data_types_export.dart';
import 'package:flutter_flux/flutter_flux.dart';

const String db = "http://localhost:12345/";

class LocalsRepo {
  Future<Stream<Local>> getLocals() async {
    String endpoint = "GetLocalsGeo";
    //TODO hacer logica de lat lng a grupo

    int lat = 25;
    int lng = 15;
    String url = db + endpoint + "/" + lat.toString() + "/" + lng.toString();

    var client = http.Client();
    var streamedRes = await client.send(http.Request('get', Uri.parse(url)));

    return streamedRes.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((body) => (body as List))
        .map((json) => Local.fromJson(json));
  }
}

class LocalsStore extends Store {
  final repo = LocalsRepo();

  LocalsStore() {
    triggerOnAction(loadLocalsAction, (nothing) async {
      //TODO global variable current position
      Future<LocationData> usersLocation = getUsersLocation();
      var stream = await repo.getLocals();
      if (_locals.isEmpty) {
        stream.listen((local) => _locals.add(local));
      } else {
        _locals.clear();
        stream.listen((local) => _locals.add(local));
      }
    });
  }

  Future<LocationData> getUsersLocation() async {
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

  final List<Local> _locals = <Local>[];
  List<Local> get locals => List<Local>.unmodifiable(_locals);
}

final Action loadLocalsAction = Action();
final StoreToken localsStoreToken = StoreToken(LocalsStore());
