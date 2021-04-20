
import 'dart:convert';

import 'package:getClinicDoctor_dart/src/getClinicDoctor_dart.dart' as getClinicDoctor_dart;
import 'package:html/dom.dart';
import 'package:sprintf/sprintf.dart';
import 'package:getClinicDoctor_dart/src/doctorClinic/doctor_clinic_crawler.dart' as craw;
import 'package:getClinicDoctor_dart/resource/crawler_setting.dart' as cs;
import 'package:html/parser.dart';

import 'package:universal_html/parsing.dart';
import 'package:universal_html/controller.dart';

import 'package:getClinicDoctor_dart/src/doctorClinic/doctor_clinic_parser.dart' as parser;
import 'package:getClinicDoctor_dart/src/doctorClinic/doctor_clinic_document.dart' as doc;

Future main(List<String> arguments) async {

  var regions = cs.getRegions();
  var crawler = craw.DoctorClinicCrawler(cs.request_url, cs.request_headers);
  var htmlParser = parser.DoctorClinicsParser(doc.DoctorClinicDocument());

  // var result = await test.requestDoctorClinic('%uc804%ubd81');
  // result = result.replaceAll("'", '"');

  var doctorClinicList = [];

  for(var region in regions) {
    var result = await crawler.requestDoctorClinic(region);
    result = result.replaceAll("'", '"');

    var stringBuffer = StringBuffer();
    stringBuffer.write('<table>');
    stringBuffer.write(result);
    stringBuffer.write('</table>');

    var doctorClinic = htmlParser.parsing(stringBuffer.toString());
    doctorClinicList = List.from(doctorClinicList)..addAll(doctorClinic);
  }

  // todo download csv

}
