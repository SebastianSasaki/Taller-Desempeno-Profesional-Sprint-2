import 'package:tdp2/models/district.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';


class DistrictServices {
  final String urlDistrict = ".com";

  Future<List<District>> getDistricts() async {
    http.Response result = await http.get(Uri.parse(urlDistrict));

    if(result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final districtsMap = jsonResponse['districts'];

      List<District> districts = districtsMap.map<District>((i) =>
          District.fromJson(i)).toList();

      return districts;
    } else {
      print(result.body);
      return null!;
    }
  }

}