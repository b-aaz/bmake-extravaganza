# Floating point DIVider.
fdiv.numer:=		${fdiv.args:[1]}
fdiv.denom:=		${fdiv.args:[2]}
fdiv.sign:=		${*${fdiv.numer:C/^(.).*/\1/:C/[^+-]/+/}${fdiv.denom:C/^(.).*/\1/:C/[^+-]/+/}}
fdiv.denom:=		${fdiv.denom:S/./ /:C/^[+-]//}
fdiv.numer:=		${fdiv.numer:S/./ /:C/^[+-]//}
fdiv.denom_decimal:=	${fdiv.denom:[1]:C/^0*//g}
fdiv.numer_decimal:=	${fdiv.numer:[1]:C/^0*//g}
fdiv.denom_frac:=	${fdiv.denom:[2]:C/0*$//g}
fdiv.numer_frac:=	${fdiv.numer:[2]:C/0*$//g}
.if empty(fdiv.denom_decimal)
fdiv.denom_decimal=0
.endif
.if empty(fdiv.numer_decimal)
fdiv.numer_decimal=0
.endif
.if empty(fdiv.denom_frac)
fdiv.denom_frac=0
.endif
.if empty(fdiv.numer_frac)
fdiv.numer_frac=0
.endif
fdiv.denom:=${fdiv.denom_decimal} ${fdiv.denom_frac}
fdiv.numer:=${fdiv.numer_decimal} ${fdiv.numer_frac}
# Scaling the denominator to range [1,10).
# This step scales the denominator so that 1 <= D < 10, then a LUT is used for
# the initial approximation of the Newton-Raphson root finding method for
# finding f(x)=1/x .i.e the reciprocal, this range avoids cases where D is too
# close to 0 and can make the function shoot up to infinity and break the
# approximation system.
fdiv.scaled_denom_decimal:=${fdiv.denom:ts:C/^0*//:C/^(.)/\1 /:[1]}
fdiv.scaled_denom_frac:=   ${fdiv.denom:ts:C/^0*//:C/^(.)/\1 /:[2]}

fdiv.lshift:=${fdiv.denom:ts:C/^(0*).*/\1/:C/././g}
fdiv.rshift:=${fdiv.denom_decimal:C/././g:C/.//}
# Doing the Shifting.
# Depending on which of the right or left shift variables have values, we do a 
# shift in that direction.
.if empty(fdiv.lshift)
fdiv.scaled_numer:=${${zeros}${fdiv.numer:ts}:L:C%(${fdiv.numer_frac:C/././g}${fdiv.rshift})$%.\1%:C/^0*//W:S/^./0./W}
.elif empty(fdiv.rshift)
fdiv.scaled_numer:=${${fdiv.numer:ts}${zeros}:L:C%^(${fdiv.numer_decimal:C/././g}${fdiv.lshift})%\1.%:C/0*$//W:S/.$/.0/W}
.else
fdiv.scaled_numer:=	${fdiv.numer}
.endif
# Getting the first 3 digits of the denominator for the initial approximation.
fdiv.denom_id:=${${fdiv.scaled_denom_decimal}${fdiv.scaled_denom_frac}:L:C/(.)/\1 /g}
.if ${fdiv.denom_id:[#]} <= 3
fdiv.denom_id:=${${fdiv.denom_id} 0 0 0 :L:[1..3]:ts}
fdiv.reciprocal:=${/${fdiv.denom_id}}
.else
fdiv.denom_id:=${${fdiv.denom_id} 0 0 0 :L:[1..3]:ts}
fdiv.init:=${/${fdiv.denom_id}}
fdiv.lastres:= ${fdiv.init}
# 3 iterations of the Newton approximation method is enough for our uses.
. for i in 1 2 3
newt.args:=${fdiv.lastres} ${fdiv.scaled_denom_decimal}.${fdiv.scaled_denom_frac}
.  include "newt.mk"
# Break if we have reached the reciprocal.
.  if ${newt.return:[#]} == 2
.   break
.  endif
fdiv.lastres:=${newt.return}
. endfor
fdiv.reciprocal:=${newt.return:[1]}
.endif

# Actual division step, multiplying the numerator with the found reciprocal.
fmul.args:= ${fdiv.scaled_numer} ${fdiv.reciprocal}
.include "fmul.mk"
fdiv.return:=${fmul.return}
fdiv.return:=${fdiv.return:C/^[+-]//}
fdiv.return:=${fdiv.sign}${fdiv.return}
