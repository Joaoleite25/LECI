altura = float(input("Altura(m): "))
peso = float(input("Peso(kg): "))

bmi=altura**2
bmi=peso/bmi

print("Body Mass Index: ", "{:.2f}".format(bmi))
