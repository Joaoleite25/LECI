
def intersection(a, b, c, d):
    """Return the intersection of intervals [a, b[ and [c, d[."""
    assert a <= b
    assert c <= d
    if b>=c and b<=d:
        f=b
        if c>=a:
            e=c
        else:
            e=a
    elif a>=c and a<=d:
        e=a
        if b<=d:
            f=b
        else:
            f=d
    elif c>a and d<b:
        e=c
        f=d
    else:
        e=0
        f=0
            
    return (e, f)


def testIntersection(a, b, c, d, x, y):
    """Call intersection, print result and check against expected result."""
    print(f"intersection({a}, {b}, {c}, {d})", end=" ")
    (e, f) = intersection(a, b, c, d)
    if (e, f) == (x, y):
        check = "OK"
    else:
        check = "FAIL"
    print(f"--> ({e}, {f})", check)


def main():
    testIntersection(1, 6, 4, 8,  4, 6)
    testIntersection(1, 6, 3, 5,  3, 5)
    testIntersection(1, 6, 7, 8,  0, 0)
    # Acrescente mais casos de teste...
    ...


main()

