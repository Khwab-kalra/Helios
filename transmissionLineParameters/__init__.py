from conductor import Conductor

""" resitance and inductance value of copper conductor, 
when ac current of 60Hz frequency is flowing"""

c = Conductor(1,0.005,0.171)
print(c.inductance(1))
print(c.resistance(0.00393,25))