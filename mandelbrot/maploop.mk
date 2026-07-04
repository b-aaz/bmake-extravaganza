# Color mapping loop's internal function.

mlop.i?=0
mlop.ci?=1
.if ${mlop.i} < ${brot.iters}
# Here we are basically "casting" the "float" to an "int" and using it as a
# index for the palette, to scale down the color pallet to a map to  our
# iteration count.
brot.cmap:=${brot.cmap} ${brot.palette:[${mlop.ci:S/./ /:[1]}]}

fpas.args:=${mlop.ci} ${mlop.cinc}
. include <fpas.mk>
iadd.args:=${fpas.return}
. include <iadd.mk>
mlop.ci:=${iadd.return}

iadd.args:=${mlop.i} 1
. include <iadd.mk>
mlop.i:=${iadd.return}
.else
. undef mlop.i
. undef mlop.ci
loop.brk:=break
.endif
