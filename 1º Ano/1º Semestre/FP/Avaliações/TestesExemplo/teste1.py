print("abcdefghij"[1:5:2])
def f1(a, b):
    print(a)
    print(b)
    if a % b == 0:
        return b
    else:
        return a

def f2(k):
    print(k)
    s = 0
    for i in range(k, 1, -1):
        s += int(i/2)
    return s

x = int(input())
y = int(input())
z = f1(x, y)
print(z)
print(f2(4))




