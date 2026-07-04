# A single iteration of the NEWTon-Raphson method for finding the reciprocal. 
newt.xi:=	${newt.args:[1]}
newt.denom:=	${newt.args:[2]}
# x * (2 - (D) * x)

# x * (2 - (D) * x)
#          ---   -
fmul.args:=${newt.denom} ${newt.xi}
.include "fmul.mk"

# If D * xi = 1 it means that xi is our correct reciprocal, and we do not need
# more steps.
# Crop the last digit, the rest contains enough accuracy.
tmp:=${fmul.return:S/+//:C/(.)/\1 /g:[1..15]:ts}
.if ${tmp} == 1 || ${tmp} == 0.9999999999999
newt.return:=${newt.xi} done
.else
# x * (2 - (D) * x)
#        - -------
finv.args:=${fmul.return}
.include "finv.mk"
# x * (2 - (D) * x)
#      -   -------
fpas.args:=+2.0 ${finv.return}
.include "fpas.mk"
iads.args:=${fpas.return}
.include "iads.mk"
# x * (2 - (D) * x)
# -   -------------
fmul.args:=${newt.xi} ${iads.return}
.include "fmul.mk"
newt.return:=${fmul.return}
.endif
