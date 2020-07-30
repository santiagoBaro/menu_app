import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:menuapp/data_types/data_types_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

final key = Key.fromUtf8('Ng#lRznZd*#Je^A#dp5c4#QrkEJbmDgF');
final iv = IV.fromLength(16);
final encrypter = Encrypter(AES(key));

UserCredentials storedUserCredentials;

Future<Null> saveUserCredentials() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('foodio_sp', jsonEncode(storedUserCredentials));
}

final UserCredentials emptyUser = UserCredentials(
  nickName: encrypter.encrypt("empty", iv: iv).base64,
  id: encrypter.encrypt("empty", iv: iv).base64,
  password: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: true,
  recentlyViewed: List<LocalPointer>(),
);

final UserCredentials logedOffUser = UserCredentials(
  nickName: encrypter.encrypt("empty", iv: iv).base64,
  id: encrypter.encrypt("empty", iv: iv).base64,
  password: encrypter.encrypt("empty", iv: iv).base64,
  token: encrypter.encrypt("empty", iv: iv).base64,
  isNewUser: false,
  recentlyViewed: List<LocalPointer>(),
);

class UserCredentials {
  String nickName;
  String id; // not used
  String password;
  String token;
  List<LocalPointer> recentlyViewed;
  List<String> searchedTerms;
  bool isNewUser;

  UserCredentials({
    this.id,
    this.isNewUser,
    this.nickName,
    this.password,
    this.searchedTerms,
    this.recentlyViewed,
    this.token,
  });

  setNickname(String newNickname) {
    nickName = encrypter.encrypt(newNickname, iv: iv).base64;
  }

  setPassword(String newPassword) {
    password = encrypter.encrypt(newPassword, iv: iv).base64;
  }

  setId(String newId) {
    id = encrypter.encrypt(newId, iv: iv).base64;
  }

  setToken(String newToken) {
    token = encrypter.encrypt(newToken, iv: iv).base64;
  }

  String getNickname() {
    return encrypter.decrypt64(nickName, iv: iv);
  }

  String getPassword() {
    return encrypter.decrypt64(password, iv: iv);
  }

  String getId() {
    return encrypter.decrypt64(id, iv: iv);
  }

  String getToken() {
    return encrypter.decrypt64(token, iv: iv);
  }

  addRecentlyViewed(Local viewedLocal) {
    LocalPointer newPointer = LocalPointer(
      id: viewedLocal.id,
      name: viewedLocal.name,
      lat: viewedLocal.lat,
      lng: viewedLocal.lng,
      type: viewedLocal.type,
    );
    //* ADDS THE LOCAL'S POINTER TO THE RECENTLY VIEWED LIST
    //* AND IF IT ALREADY EXISTED, IT PUSHES IT TO THE FRONT
    recentlyViewed.remove(newPointer);
    recentlyViewed.add(newPointer);
  }

  addSearch(String searchTearm) {
    searchedTerms.add(searchTearm);
  }

  UserCredentials.fromJson(Map<String, dynamic> json) {
    if (json['recentlyViewed'] != null) {
      recentlyViewed = new List<LocalPointer>();
      json['recentlyViewed'].forEach((v) {
        recentlyViewed.add(new LocalPointer.fromJson(v));
      });
    }

    nickName = json['nickName'];
    id = json['id'];
    password = json['password'];
    token = json['token'];
    isNewUser = json['isNewUser'];
  }

  Map<String, dynamic> toJson() => {
        'nickName': nickName,
        'id': id,
        'password': password,
        'token': token,
        'recentlyViewed': recentlyViewed,
        'isNewUser': isNewUser,
      };
}
