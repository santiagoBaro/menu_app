class SignUpDataType {
  String nickname;
  String name;
  String country;
  String email;
  String password;
  String prefix;
  String phone;

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'name': name,
        'country': country,
        'email': email,
        'password': password,
        'prefix': prefix,
        'phone': phone,
      };
}
