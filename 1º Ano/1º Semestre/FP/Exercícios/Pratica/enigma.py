def enigma(n):
    new=''
    for i,j in enumerate(n):
        new += chr(ord(j)+i+1)
    return new


n=input("String: ")
print(enigma(n))
