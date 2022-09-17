import 'package:dio/dio.dart';

import 'mini-storage.dart' as storage;
import 'http-common.dart' as http;

import 'package:tdp2/models/police.dart';

class PoliceApiService {
  // REGISTER
  Future<Response> registerPolice(Police policeData) async {
    Response response = await http.post('/polices', policeData.toMap(), 'RegisterPolice');
    if (response.statusCode == 200) {
      await storage.writeAsync('policeId', response.data["id"].toString());
      await storage.writeAsync('policename', response.data["policename"]);
      await storage.writeAsync('policelastname', response.data["policelastname"]);
      await storage.writeAsync('policemail', response.data["policemail"]);
      await storage.writeAsync('password', response.data["password"]);
    }
    return response;
  }

  // LOGIN
  Future<Response> login(Police policeData) async {
    Response response = await http.post('/polices/authenticate', policeData.toMap(), 'LoginPolice');

    if (response.statusCode == 200) {
      await storage.writeAsync('policeId', response.data["id"].toString());
      await storage.writeAsync('policename', response.data["policename"]);
      await storage.writeAsync('policelastname', response.data["policelastname"]);
      await storage.writeAsync('policemail', response.data["policemail"]);
      await storage.writeAsync('token', response.data["token"]);
    }
    return response;
  }

  // CAMBIAR CONTRASEÑA
  //Future<Response> changePassword(String policemail) async {
    //getByPoliceMail(policemail);
    //Response response = await http.put('/polices/police/', policeData., 'changePassword');

    //await storage.writeAsync('password', response.data["password"]);

    //if (response.statusCode == 200) {
      //await storage.writeAsync(key, value)
    //}
    //return response;
  //}

  Future<Response> getByPoliceId(int policeId) async {
    Response response = await http.get('/polices/police/$policeId', 'GetByPoliceId');
    return response;
  }

  Future<Response> getByPoliceMail(String policemail) async {
    Response response = await http.get('/polices/police/$policemail', 'GetByPoliceId');
    return response;
  }
}