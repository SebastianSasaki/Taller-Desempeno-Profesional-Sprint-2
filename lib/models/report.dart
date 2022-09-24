import 'dart:convert';

class Report {
  String title;
  String description;

  Report({required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      title: json['title'],
      description: json['description'],
    );
  }
}

Report reportFromJson(String str) => Report.fromJson(json.decode(str));