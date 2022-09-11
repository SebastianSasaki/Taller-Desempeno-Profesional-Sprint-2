import 'dart:convert';

class Police {
  String? policename;
  String? password;
  String? policemail;

  Police({this.policename, this.password, this.policemail});

  Map<String, dynamic> toMap() {
    return {
      'policename': policename,
      'password': password,
    };
  }

  factory Police.fromJson(Map<String, dynamic> json) {
    return Police(
      policename: json['policename'],
      password: json['password'],
      policemail: json['policemail'],
    );
  }
}

Police userFromJson(String str) => Police.fromJson(json.decode(str));