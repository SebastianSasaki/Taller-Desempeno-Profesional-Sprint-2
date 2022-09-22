class AlertSystem {
  int? idAlertSystem;
  int? zoneId;
  String? hour;
  String? imageAlert;
  bool? intervention;

  AlertSystem({this.idAlertSystem, this.zoneId, this.imageAlert, this.intervention});

  AlertSystem.fromJson(Map<String, dynamic> json) {
    idAlertSystem = json['idAlertSystem'];
    zoneId = json['zoneId'];
    hour = json['hour'];
    imageAlert = json['imageAlert'];
    intervention = json['intervention'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idAlertSystem'] = this.idAlertSystem;
    data['zoneId'] = this.zoneId;
    data['hour'] = this.hour;
    data['imageAlert'] = this.imageAlert;
    data['intervention'] = this.intervention;
    return data;
  }
}