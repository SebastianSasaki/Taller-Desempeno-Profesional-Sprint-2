import 'dart:convert';

class Police {
  String? policename;
  String? policelastname;
  String? password;
  String? policemail;

  Police({this.policename, this.policelastname, this.password, this.policemail});

  Map<String, dynamic> toMap() {
    return {
      'policename': policename,
      'policelastname': policelastname,
      'password': password,
      'policemail': policemail
    };
  }

  factory Police.fromJson(Map<String, dynamic> json) {
    return Police(
      policename: json['policename'],
      policelastname: json['policelastname'],
      password: json['password'],
      policemail: json['policemail'],
    );
  }
}

Police userFromJson(String str) => Police.fromJson(json.decode(str));