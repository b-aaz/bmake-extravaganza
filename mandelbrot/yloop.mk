# LOOP, going over the Y axis.
yloop.im?=${brot.imstart}
yloop.y?=0

.if ${yloop.y} < ${brot.hight}

${loop.depth}loop.args:=mandelbrot/xloop.mk
.include <loop.mk>

fpas.args:=${yloop.im} ${brot.imstep}
.include <fpas.mk>
iads.args:=${fpas.return}
.include <iads.mk>
yloop.im:=${iads.return}


iadd.args:=${yloop.y} 1
.include <iadd.mk>
yloop.y:=${iadd.return}
.else
.undef yloop.y xloop.im
loop.brk:=break
.endif
