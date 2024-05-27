v1 = float(input("Qual é a primeira velocidade? "))
v2 = float(input("Qual é a segunda velocidade? "))
d = float(input("Qual é a distância? "))

t1 = d/v1
t2 = d/v2
t = t1 + t2
d *= 2
vm = d/t

print("A velocidade média é", vm)
