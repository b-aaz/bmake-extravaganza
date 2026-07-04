# Integer MULtiplier.
imul.left:=		${imul.args:[1]:C/^0*//g}
imul.right:=		${imul.args:[2]:C/^0*//g}

imul.right_digits:=	${imul.right:C/(.)/\1 /g:[-1..1]}
imul.left_digits:=	${imul.left:C/(.)/\1 /g:[-1..1]}
imul.add_carry=
imul.carry=
imul.inner_res=
imul.sumlist=
imul.return=		0
.for imul.i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
imul.l_digit:=${imul.left_digits:[${imul.i}]}
. if empty(imul.l_digit)
. break
. endif
imul.sumlist:=${imul.sumlist} ${imul.i} 
. if ${imul.l_digit}!=0
.  for imul.j in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
imul.r_digit:=${imul.right_digits:[${imul.j}]}
.   if empty(imul.r_digit)
.    break
.   endif
tmp:=${*${imul.r_digit}${imul.l_digit}}
imul.result_digit:=${tmp:[1]}
imul.mul_carry_digit:=${tmp:[2]}
.   if !empty(imul.carry)
tmp:=	${+${imul.result_digit}${imul.carry}}
imul.result_digit:=${tmp:[1]}
imul.add_carry:=${tmp:[2]}
imul.carry:=
.   endif
.   if !empty(imul.add_carry) && !empty(imul.mul_carry_digit)
imul.carry:=${+${imul.add_carry}0${imul.mul_carry_digit}:[1]}
.   else
imul.carry:=${imul.add_carry}${imul.mul_carry_digit}
.   endif 
imul.add_carry=
imul.inner_res:=${imul.result_digit} ${imul.inner_res}
.  endfor

imul.inner_res:=${imul.carry} ${imul.inner_res}
imul.sums_${imul.i}:=${imul.inner_res}
imul.carry:=
. else
imul.sums_${imul.i}:=0
. endif
imul.inner_res:=
.endfor
imul.sum=0
imul.csum=0
.for imul.i in ${imul.sumlist}
. if ${imul.sums_${imul.i}:ts}
padded_val:= ${${imul.sums_${imul.i}}${pyr_${imul.i}}:L:ts}
ladd.args:=${padded_val} ${imul.sum}
.include "ladd.mk"
imul.sum=${ladd.carry}${ladd.return}
. endif
.endfor
imul.return:=${imul.sum}
