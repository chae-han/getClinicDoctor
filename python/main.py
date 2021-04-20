from doctorClinic import doctor_clinic_parser as dcp               
from doctorClinic import doctor_clinic_document as dcd 
from doctorClinic import doctor_clinic_crawler as dcc
from settings import crawler_setting as cs
import pandas as pd
import time


regions = cs.getRegions()

def main():
    document = dcd.DoctorClinicDocument()
    parser = dcp.DoctorClinicsParser(document)
    crawler = dcc.DoctorClinicCrawler(cs.request_url, cs.request_headers)
    
    for region in regions:
        html_text = crawler.requestDoctorClinic(region)
        parser.parse_html_data_to_doctor_clinics(html_text)
        time.sleep(10)

    aPd = pd.DataFrame(parser.get_list_of_doctor_clinic())
    aPd.to_csv('settings/test.csv')

if __name__ == "__main__":
	main()