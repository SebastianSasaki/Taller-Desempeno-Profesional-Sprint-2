class Camera {
  String? idCamera;
  int? cameraStatusId;
  String? destinyAlerts;

  Camera({this.idCamera, this.cameraStatusId, this.destinyAlerts});

  Camera.fromJson(Map<String, dynamic> json) {
    idCamera = json['idCamera'];
    cameraStatusId = json['cameraStatusId'];
    destinyAlerts = json['destinyAlerts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCamera'] = this.idCamera;
    data['cameraStatusId'] = this.cameraStatusId;
    data['destinyAlerts'] = this.destinyAlerts;
    return data;
  }
}