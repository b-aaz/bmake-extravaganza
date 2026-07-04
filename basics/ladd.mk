# Long ADDer.
ladd.left:=	${ladd.args:[1]}
ladd.right:=	${ladd.args:[2]}
ladd.left_digits:=	${ladd.left:C/(.)/\1 /g:[-1..1]}
ladd.right_digits:=	${ladd.right:C/(.)/\1 /g:[-1..1]}
ladd.return:=
ladd.carry:=
.for ladd.i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20\
21 22 23 24 25 26 27 28 29 30 31 32
ladd.l_digit=		${ladd.left_digits:[${ladd.i}]}
ladd.r_digit=		${ladd.right_digits:[${ladd.i}]}
. if empty(ladd.l_digit) && empty(ladd.r_digit)
ladd.return:=		${ladd.carry:N0}${ladd.return}
ladd.carry:=
.  break
. endif
. if empty(ladd.l_digit)
ladd.l_digit=0
. elif empty(ladd.r_digit)
ladd.r_digit=0
. endif
ladd.result_digit:=	${+${ladd.carry}${ladd.l_digit}${ladd.r_digit}}
ladd.carry:=		${ladd.result_digit:[2]}
ladd.return:=		${ladd.result_digit:[1]} ${ladd.return}
.endfor
ladd.return:=		${ladd.return:ts}
