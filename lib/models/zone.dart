class Zone {
  int? idZone;
  String? cameraId;
  int? districtId;
  String? name;
  String? coverageZone;
  String? controlPoint;

  Zone({this.idZone, this.cameraId, this.districtId, this.name, this.coverageZone, this.controlPoint});

  Zone.fromJson(Map<String, dynamic> json) {
    idZone = json['idZone'];
    cameraId = json['cameraId'];
    districtId = json['districtId'];
    name = json['name'];
    coverageZone = json['coverageZone'];
    controlPoint = json['controlPoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idZone'] = this.idZone;
    data['cameraId'] = this.cameraId;
    data['districtId'] = districtId;
    data['name'] = this.name;
    data['coverageZone'] = this.coverageZone;
    data['controlPoint'] = this.controlPoint;
    return data;
  }
}