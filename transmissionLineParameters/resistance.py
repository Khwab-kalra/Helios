""" for calculation  of variation of series resistance in transmission line
    due to effect of frequency, temprature, and arrangment."""

class Resistance:
    def __init__(self,value):
        try:
            self.value = float(value)
        except:
            raise ValueError("The value of resistance isn't a number")

    def frequencyEffect(self,k = 1.02):
        """ Input :
            k = skin correction factor (constant)
            Rerurn :
            resultant resistance (ohm)"""
        return self.value*k
    
    def tempratureEffect(self,alpha,temp2,temp1 = 20):
        """ Input :
            alpha = temprature cofficient (*C^-1)
            temp1 = reference temprature (*C)
            temp2 = current temprature (*C)
            Return :
            resultant resistance (ohm)"""
        try:
            alpha = float(alpha)
            temp1 = float(temp1)
            temp2 = float(temp2)
            return self.value*((alpha+temp1)/(alpha+temp2))
        except:
            raise ValueError("Either temprature cofficient or temprature isn't a number")