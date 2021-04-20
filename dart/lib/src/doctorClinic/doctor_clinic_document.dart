
class DoctorClinicDocument {
  String doctor = '';
  String clinic = '';
  String number = '';
  String address = '';
  String desc = '';

  DoctorClinicDocument();

  void resetData() {
    doctor = '';
    clinic = '';
    number = '';
    address = '';
    desc = '';
  }

  Map<String, String> getDataToDict() {
    return {'doctor' : doctor,
      'clinic' : clinic,
      'number': number,
      'address' : address,
      'desc' : desc};
  }

  void setDataByIndex(int index, String data) {
    switch(index) {
      case 0:
        doctor = data;
        break;
      case 1:
        clinic = data;
        break;
      case 2:
        number = data;
        break;
      case 3:
        address = data;
        break;
      default:
        desc += data;
        break;
    }
  }
}
