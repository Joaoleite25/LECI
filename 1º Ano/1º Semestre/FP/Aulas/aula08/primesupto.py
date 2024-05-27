def primesUpTo(n):
    numeros = [i for i in range(2, n+1)]
    s = set()
    for num in numeros:
        numeros = [i for i in numeros if i % num != 0 or i == num]
    s = set(numeros)
    return s

def main():
    # Testing:
    s = primesUpTo(1000)
    print(sorted(s))

    # Do some checks:
    assert primesUpTo(30) == {2,3,5,7,11,13,17,19,23,29}
    assert len(primesUpTo(1000)) == 168
    assert len(primesUpTo(7918)) == 999
    assert len(primesUpTo(7919)) == 1000
    print("All tests passed!")

if __name__ == "__main__":
    main()

