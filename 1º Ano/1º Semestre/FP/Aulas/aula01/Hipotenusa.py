c1 = float(input("Cateto 1: "))
c2 = float(input("Cateto 2: "))

h = c1**2 + c2**2
h = h**0.5

print("A hipotenusa é:", "{:.2f}".format(h))
