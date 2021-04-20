import 'dart:convert';
import 'dart:io';

import 'package:getClinicDoctor_dart/resource/crawler_setting.dart' as cs;
import 'package:http/http.dart' as http;
import 'package:cp949/cp949.dart' as cp949;


class DoctorClinicCrawler {
  final String _url;
  //String get url => _url;
  final Map<String, String> _headers;
  //Map<String, String> get headers => _headers;

  DoctorClinicCrawler(this._url, this._headers);

  Future<String> requestDoctorClinic(String region) async {
    var payload = cs.getRequestForm(region);
    var response = await http.post(
        Uri.parse(_url),
        headers: _headers,
        body: payload,
        encoding: Encoding.getByName('utf-8'));

    return cp949.decodeString(response.body);
  }
}
