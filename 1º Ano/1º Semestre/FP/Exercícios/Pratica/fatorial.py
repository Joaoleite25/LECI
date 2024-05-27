def fatorial1 (n, s):
    while n>0:
        s *= n
        n -= 1
    print(s)

def fatorial2 (x, c):
    if x>0:
        c *= x
        fatorial2(x-1, c)
    else:
        print(c)

def main ():
    n = int(input("N: "))
    s = 1
    c = 1
    fatorial1(n, s)
    fatorial2(n, c)
    
main()
