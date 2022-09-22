class CameraStatus {
  int? idCameraStatus;
  String? status;

  CameraStatus({this.idCameraStatus, this.status});

  CameraStatus.fromJson(Map<String, dynamic> json) {
    idCameraStatus = json['idCameraStatus'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCameraStatus'] = this.idCameraStatus;
    data['status'] = this.status;
    return data;
  }
}