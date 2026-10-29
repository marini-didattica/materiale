l = [1,2,3,4,5,6,5,4,3,2,1]
palindrome=True
for i in range(len(l)//2):
    if i==0:
        if l[0]==l[-1]:
            palindrome=True
        else:
            palindrome=False
            break
    else:
        if l[i]==l[-i-1]:
            palindrome=True
        else:
            palindrome=False
            break
print(palindrome)




