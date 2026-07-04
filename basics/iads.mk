# Integer ADder and Subtracter.
iads.left:=	${iads.args:[1]:C/^[+-]//:C/^0*//g:S/^./0./}
iads.right:=	${iads.args:[2]:C/^[+-]//:C/^0*//g:S/^./0./}
iads.l_sign:=	${iads.args:[1]:C/^(.).*/\1/:C/[^+-]/+/}
iads.r_sign:=	${iads.args:[2]:C/^(.).*/\1/:C/[^+-]/+/}
tmp:= ${${+${iads.l_sign}${iads.r_sign}}name}
i${tmp}.args:=	${iads.left} ${iads.right} 
.include "i${tmp}.mk"
iads.return:=	${+${iads.l_sign}${isub.inv:U+}}${i${tmp}.return}
.undef isub.inv
