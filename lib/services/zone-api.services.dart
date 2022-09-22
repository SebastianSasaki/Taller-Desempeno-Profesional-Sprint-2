import 'package:tdp2/models/zone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ZoneServices {
  final String urlZone = "";

  Future<List<Zone>> getZones() async {
    http.Response result = await http.get(Uri.parse(urlZone));

    if(result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final zonesMap = jsonResponse['zones'];

      List<Zone> zones = zonesMap.map<Zone>((i) =>
          Zone.fromJson(i)).toList();

      return zones;
    } else {
      print(result.body);
      return null!;
    }
  }
}

