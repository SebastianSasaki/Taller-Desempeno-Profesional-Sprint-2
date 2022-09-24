import 'dart:convert';

class AlertSystem {
  int? idAlertSystem;
  int? zoneId;
  String hour;
  String imageAlert;
  bool intervention;

  AlertSystem({required this.imageAlert, required this.intervention, required this.hour});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idAlertSystem'] = idAlertSystem;
    data['zoneId'] = zoneId;
    data['hour'] = hour;
    data['imageAlert'] = imageAlert;
    data['intervention'] = intervention;
    return data;
  }

  factory AlertSystem.fromJson(Map<String, dynamic> json) {
    return AlertSystem(
        hour: json['hour'],
        imageAlert: json['imageAlert'],
        intervention: json['intervention'],
    );
  }
}

AlertSystem alertSystemFromJson(String str) => AlertSystem.fromJson(json.decode(str));