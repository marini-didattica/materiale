l=[4,7,10,3]
conta=0
media=0
for i in range(len(l)):
    media=media+l[i]
    conta=conta+1
if media==0:
    print("0")
else:
    media=media/conta
    print(media)