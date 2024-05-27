def inputFloatList():
    num = []
    while True:
        n = input("Numero: ")
        if n == '':
            break
        num.append(n)
    print("\n")
    print("Todos:", ", ".join(num))

def main():
    inputFloatList()

main()
