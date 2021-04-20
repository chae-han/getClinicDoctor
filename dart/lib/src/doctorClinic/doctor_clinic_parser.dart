

import 'package:html/parser.dart';

import 'doctor_clinic_document.dart';

class DoctorClinicsParser {

  final DoctorClinicDocument _doc;

  DoctorClinicsParser(this._doc);

  List parsing(String html) {
    var listOfDoctorClinic = [];
    final parsed = parse(html);
    final anchors = parsed.querySelectorAll('tr > td');//('tr > td:nth-child(1)');

    for(int i = 0; i < anchors.length; i+=5) {
      if(anchors.length - i < 5) {
        return listOfDoctorClinic;
      }
      _doc.setDataByIndex(0, anchors[i].text);
      _doc.setDataByIndex(1, anchors[i+1].text);
      _doc.setDataByIndex(2, anchors[i+2].text);
      _doc.setDataByIndex(3, anchors[i+3].text);
      _doc.setDataByIndex(4, anchors[i+4].text);

      listOfDoctorClinic.add(_doc.getDataToDict());
      _doc.resetData();
    }

    return listOfDoctorClinic;
  }

}