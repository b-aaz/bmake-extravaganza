# Floating point MULtiplier.
fmul.left:=		${fmul.args:[1]}
fmul.right:=		${fmul.args:[2]}
fmul.l_sign:=		${fmul.left:C/^(.).*/\1/:C/[^+-]/+/}
fmul.r_sign:=		${fmul.right:C/^(.).*/\1/:C/[^+-]/+/}
fmul.sign:=		${*${fmul.l_sign}${fmul.r_sign}}
fmul.left:=		${fmul.left:S/./ /:C/^[+-]//}
fmul.right:=		${fmul.right:S/./ /:C/^[+-]//}
fmul.left_decimal:=	${fmul.left:[1]}
fmul.right_decimal:=	${fmul.right:[1]}
fmul.left_frac:=	${fmul.left:[2]:C/0*$//g}
fmul.right_frac:=	${fmul.right:[2]:C/0*$//g}
.if empty(fmul.right_frac) 
fmul.right_frac:=0
.endif
.if empty(fmul.left_frac)
fmul.left_frac:=0
.endif
.if ${fmul.right_frac} == 0 && ${fmul.left_frac} == 0
imul.args:=		${fmul.left_decimal} ${fmul.right_decimal}
.include "imul.mk"
fmul.return:=		${imul.return:C/(.)/ \1/g:[1..16]:ts}	
. if ${imul.return} != ${fmul.return}
fmul.return:=		${fmul.sign}inf
. else
fmul.return:=		${fmul.sign}${fmul.return}	
. endif
.else
fmul.left:=  ${fmul.left_decimal}  ${fmul.left_frac}
fmul.right:= ${fmul.right_decimal} ${fmul.right_frac}
fmul.fracdigits:=	${fmul.left_frac}${fmul.right_frac}
fmul.fracdigits:=	${fmul.fracdigits:C/./ ./g}
imul.args:=${fmul.left:ts} ${fmul.right:ts}
.include "imul.mk"
fmul.return:=		${${zeros}${imul.return}:L:C%(${fmul.fracdigits:ts})$%.\1%:C/^0*//g}
fmul.return:=		${fmul.sign}${fmul.return:S/^./0./:C/(.)/ \1/g:[1..16]:ts:C/0*$//g}
. if ${fmul.return:N*.*}
fmul.return:=		${fmul.sign}inf
. else
fmul.return:=		${fmul.return:S/.$/.0/}
. endif
.endif
