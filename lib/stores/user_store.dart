import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../data_types/data_types_export.dart';
import 'package:flutter_flux/flutter_flux.dart';

const String db = "http://localhost:12345/";

class UserRepo {
  Future<Stream<User>> getUser(String id) async {
    String endpoint = "GetUserData/";
    //TODO hacer logica de lat lng a grupo
    String url = db + endpoint + id;

    var client = http.Client();
    var streamedRes = await client.send(http.Request('get', Uri.parse(url)));

    return streamedRes.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((body) => (body as List))
        .map((json) => User.fromJson(json));
  }
}

class UserStore extends Store {
  final repo = UserRepo();

  UserStore() {
    triggerOnAction(loadUserAction, (nothing) async {
      //TODO global variable current position
      String id = "5efe7476942cb5345c36b70d";
      var stream = await repo.getUser(id);
      if (_user.isEmpty) {
        stream.listen((user) => _user.add(user));
      } else {
        _user.clear();
        stream.listen((user) => _user.add(user));
      }
    });
  }

  final List<User> _user = <User>[];
  List<User> get user => List<User>.unmodifiable(_user);
}

final Action loadUserAction = Action();
final StoreToken userStoreToken = StoreToken(UserStore());
