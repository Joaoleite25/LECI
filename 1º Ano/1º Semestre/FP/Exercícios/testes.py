d = {'abc' : 123, 'xyz' : 456, 'klm' : 789}
x = 'klm'
if x in d:
    print(x, '-', d[x], sep='')
else:
    print('Something')
    
