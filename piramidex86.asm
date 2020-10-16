
sub esp,12
move dword[esp],4
move dword[esp+4],0
move dword[esp+8],4

func:
move ebx ,0
printouterspace:
cmp ebx,dword[esp]
je printpiramid
#show 
inc ebx
j printouterspace

printpiramid:


