l=[4,6,9,10]
a=10
b=1
intervallo=True
for i in range(len(l)):
     if b<=l[i] and a>=l[i]:
          intervallo=True
     else:
          intervallo=False

if intervallo==True:
     print("nell'intervallo")
if intervallo==False:
     print("non nell'intervallo")