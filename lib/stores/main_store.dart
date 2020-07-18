import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../data_types/data_types_export.dart';
import 'package:flutter_flux/flutter_flux.dart';

const String db = "http://localhost:12345/";

class LocalsRepo {
  Future<Stream<Local>> getLocals(int lat, int lng) async {
    String endpoint = "GetLocalsGeo/";
    //TODO hacer logica de lat lng a grupo
    String url = db + endpoint + lat.toString() + "/" + lng.toString();

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
      int lat = 25;
      int lng = 15;
      var stream = await repo.getLocals(lat, lng);
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
