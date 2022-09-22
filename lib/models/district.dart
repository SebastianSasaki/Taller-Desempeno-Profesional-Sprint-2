class District {
  int? idDistrict;
  String? name;

  District({this.idDistrict, this.name});

  District.fromJson(Map<String, dynamic> json) {
    idDistrict = json['idDistrict'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDistrict'] = this.idDistrict;
    data['name'] = this.name;
    return data;
  }
}
