# Integer SUBtracter.
isub.left:=	${isub.args:[1]}
isub.right:=	${isub.args:[2]}
.if ${isub.left} < ${isub.right}
isub.left:=	${isub.args:[2]}
isub.right:=	${isub.args:[1]}
isub.inv:=-
.endif
isub.left_digits:=	${isub.left:C/(.)/\1 /g:[-1..1]}
isub.right_digits:=	${isub.right:C/(.)/\1 /g:[-1..1]}
isub.carry:=
isub.return:=
.for isub.i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17
isub.l_digit:=		${isub.left_digits:[${isub.i}]}
isub.r_digit:=		${isub.right_digits:[${isub.i}]}
. if empty(isub.l_digit) && empty(isub.r_digit)
isub.carry:=
.  break
. endif
. if empty(isub.r_digit)
isub.r_digit=0
. endif
isub.result_digit:=	${-${isub.carry}${isub.l_digit}${isub.r_digit}}
isub.carry:=		${isub.result_digit:[2]}
isub.return:=		${isub.result_digit:[1]} ${isub.return}
.endfor
.if ${isub.return:[1]} == .
isub.return:=		0 ${isub.return}
.endif
isub.return:=		${isub.return:ts}
