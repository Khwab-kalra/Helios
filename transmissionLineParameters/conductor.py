from resistance import Resistance

class Conductor:
    def __init__(self,length,radius):
        self.length = length
        self.radius = radius
        self.area = (22/7)*(self.radius)**2
    
    def ampacity(self):
        return (self.area*self.convectionHeat()*self.radiationHeat()/self.resistance.value(self.length,self.area))

    def convectionHeat(self,pressure,windSpeed,temp,ambidentTemp):
        n = 0.0128*(pressure*windSpeed)**(0.5)
        d = ((ambidentTemp)**(0.123))*(self.radius*2)**(0.5)
        return n/d*(temp-ambidentTemp)

    def radiationHeat(self,temp,ambidentTemp,e = 0.5):
        tc = (temp/1000)**4
        ts = (ambidentTemp/1000)**4
        return 36.8*e*(tc - ts)