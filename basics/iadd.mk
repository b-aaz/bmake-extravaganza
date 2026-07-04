# Integer ADDer.
iadd.left:=	${iadd.args:[1]}
iadd.right:=	${iadd.args:[2]}
iadd.left_digits:=	${iadd.left:C/(.)/\1 /g:[-1..1]}
iadd.right_digits:=	${iadd.right:C/(.)/\1 /g:[-1..1]}
iadd.return:=
.for iadd.i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17
iadd.l_digit:=		${iadd.left_digits:[${iadd.i}]}
iadd.r_digit:=		${iadd.right_digits:[${iadd.i}]}
. if empty(iadd.l_digit) && empty(iadd.r_digit)
iadd.return:=		${iadd.carry:N0}${iadd.return}
iadd.carry:=
.  break
. endif
. if empty(iadd.l_digit)
iadd.l_digit=0
. elif empty(iadd.r_digit)
iadd.r_digit=0
. endif
iadd.result_digit:=	${+${iadd.carry}${iadd.l_digit}${iadd.r_digit}}
iadd.carry:=		${iadd.result_digit:[2]}
iadd.return:=		${iadd.result_digit:[1]} ${iadd.return}
.endfor
.if ${iadd.return:[1]} == .
iadd.return:=		0 ${iadd.return}
.endif
iadd.return:=		${iadd.return:ts}
