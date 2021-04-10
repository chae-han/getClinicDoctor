class DoctorClinicDocument:
    def __init__(self):
        self.doctor = ''
        self.clinic = ''
        self.number = ''
        self.address = ''
        self.desc = ''
    
    def setDataByIndex(self, index, data):
        if index == 0:
            self.doctor = data
            print("set doctor name complete!")
        elif index == 1:
            self.clinic = data
            print("set doctor name complete!")
        elif index == 2:
            self.number = data
            print("set doctor name complete!")
        elif index == 3:
            self.address = data
            print("set doctor name complete!")
        else:
            self.desc += data
            print("set desc name complete!")

    def getDataToDict(self):
        return {'doctor' : self.doctor, 
                 'clinic' : self.clinic, 
                 'number': self.number, 
                 'address' : self.address,
                 'desc' : self.desc}

    def resetData(self):
        self.doctor = ''
        self.clinic = ''
        self.number = ''
        self.address = ''
        self.desc = ''