import math

class Conductor:
    def __init__(self,length,radius,resisitvity):
        try:
            self.length = float(length)
            self.radius = float(radius)
            self.resisitvity = float(resisitvity)
        except:
            raise ValueError('input conductor parameters are not a number')
        self.area = (22/7)*(self.radius)**2
        self.meu = 4*math.pi*(10**(-7))
    
    def getMeu(self):
        return round(self.meu,10)
    
    def internalInductance(self):
        return self.meu/(8*math.pi)*self.length

    def externalInductance(self,distance):
        try:
            distance = float(distance)
        except:
            raise ValueError('given distance parameter is not a number')
        return (self.meu/(2*math.pi))*math.log(distance/self.radius)*self.length

    def inductance(self,distance):
        return self.internalInductance() + self.externalInductance(distance)

    def stdResistance(self):
        return self.resisitvity*(self.length/self.area)

    def frequencyEffect(self,resitance,k = 1.02):
        """ Inputs : k = skin correction factor (constant)
            Rerurns : resultant resistance (ohm)"""
        return resitance*k

    def tempratureEffect(self,alpha,temp2,temp1 = 25):
        """ Inputs : alpha = temprature cofficient (*C^-1)
            temp1 = reference temprature (*C)
            temp2 = current temprature (*C)
            Returns : resultant resistance (ohm)"""
        try:
            alpha = float(alpha)
            temp1 = float(temp1)
            temp2 = float(temp2)
        except:
            raise ValueError("Either temprature cofficient or temprature isn't a number")
        return self.stdResistance()*((alpha+temp1)/(alpha+temp2))

    def resistance(self,alpha,temp):
        resitance = self.tempratureEffect(alpha,temp)
        return self.frequencyEffect(resitance)