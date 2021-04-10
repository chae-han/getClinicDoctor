from settings import crawler_setting as cs
import requests

class DoctorClinicCrawler:
    def __init__(self, default_url, default_headers):
        self.url = default_url
        self.headers = default_headers

    def requestDoctorClinic(self, region):
        payload = cs.getRequestForm(region)
        response = requests.request("POST", self.url, headers=self.headers, data=payload)
        return response.text