# LOOP, going over the X axis.
xloop.re?=${brot.restart}
xloop.x?=0
.if ${xloop.x} < ${brot.width}
itloop.a:=${xloop.re}
itloop.b:=${yloop.im}
# The set's infill color. (color of points that don't "escape")
itloop.pixel=0|0|0
${loop.depth}loop.args:=mandelbrot/itloop.mk
. include <loop.mk>
brot.pic:=${brot.pic}${itloop.pixel}${.newline}
# Progress indicator:
.info ${dsl}${msl}x ${xloop.x} of ${brot.width}, y ${yloop.y} of ${brot.hight}${lup}
fpas.args:=${xloop.re} ${brot.restep}
. include <fpas.mk>
iads.args:=${fpas.return}
. include <iads.mk>
xloop.re:=${iads.return}

iadd.args:=${xloop.x} 1
. include <iadd.mk>
xloop.x:=${iadd.return}
.else
. undef xloop.x xloop.re
loop.brk:=break
.endif

