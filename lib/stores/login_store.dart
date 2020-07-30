import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../data_types/data_types_export.dart';
import 'package:flutter_flux/flutter_flux.dart';

const String db = "http://localhost:12345/";

class LoginRepo {
  Future<String> login(String usr, String pas) async {
    // this function recives the decrypted user and password and it returns error message or null if correct
    String endpoint = "Login";
    String url = db + endpoint;

    var response = await http.post(url, body: {'user': usr, 'pass': pas});
    if (response.statusCode == 200) {
      storedUserCredentials.setToken(response.body.toString());
      return null;
    } else {
      return response.statusCode.toString();
    }
  }
}

class LoginStore extends Store {
  final repo = LoginRepo();

  LoginStore() {
    triggerOnAction(loginAction, (nothing) async {
      // to use this store, first you have to set the new usename and password in UserCredentials()
      // and then call this action
      String usr = storedUserCredentials.getNickname();
      String pas = storedUserCredentials.getPassword();
      var out = await repo.login(usr, pas);
      if (out != null) {
        print('Login Error' + out);
      }
    });
  }
}

final Action loginAction = Action();
final StoreToken loginStoreToken = StoreToken(LoginStore());
