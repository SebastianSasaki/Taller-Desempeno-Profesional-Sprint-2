class MailStatus {
  int? idMailStatus;
  String? status;

  MailStatus({this.idMailStatus, this.status});

  MailStatus.fromJson(Map<String, dynamic> json) {
    idMailStatus = json['idMailStatus'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMailStatus'] = this.idMailStatus;
    data['status'] = this.status;
    return data;
  }
}