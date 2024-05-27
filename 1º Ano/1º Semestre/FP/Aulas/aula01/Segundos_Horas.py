t = int(input("Quantos segundos? "))
s = t%60
m = t//60
h= m//60
m -= h*60

print("{:02d}:{:02d}:{:02d}".format(h, m, s))
