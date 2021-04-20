
from html.parser import HTMLParser

class DoctorClinicsParser(HTMLParser):
    def __init__(self, doctorClincObj):
        self.listOfDoctorClinic = []
        self.doctorClincObj = doctorClincObj
        self.index = None
        self.oneOffData = None
        super().__init__()
        
    def get_list_of_doctor_clinic(self):
        return self.listOfDoctorClinic

    def __set_data_to_obj_by_index(self):
        if self.index is not None and self.index < 6:
            self.doctorClincObj.setDataByIndex(self.index, self.oneOffData)
            self.index += 1
            
    def __save_old_obj__(self):
        if self.index is not None and self.index > 0:
            self.listOfDoctorClinic.append(self.doctorClincObj.getDataToDict())

    def __get_new_obj__(self):
        self.doctorClincObj.resetData()
        self.index = 0

    def __need_to_start_new_obj__(self):
        return 'Dr.' == self.oneOffData

    def __start_new_obj__(self):
        self.__save_old_obj__()  
        self.__get_new_obj__()
    
    def __application__(self):
        if self.__need_to_start_new_obj__() == True:
            self.__start_new_obj__()
        else:
            self.__set_data_to_obj_by_index()
            
    def handle_starttag(self, tag, attrs):
        print("Encountered a start tag:", tag)

    def handle_endtag(self, tag):
        print("Encountered an end tag :", tag)

    def handle_data(self, data):
        print("Encountered some data  :", data)
        self.oneOffData = data
        self.__application__()
    
    def parse_html_data_to_doctor_clinics(self, html_data):
        self.feed(html_data)