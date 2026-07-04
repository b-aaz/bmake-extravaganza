# LOOP, going over the ITerations of fractal.
itloop.it?=1
.for tmp in 1
. if ${itloop.it} > ${brot.iters}
loop.brk:=break
.  break
. endif

fmul.args:=${itloop.b} ${itloop.b}
. include <fmul.mk>
. if ${fmul.return:M*inf} 
loop.brk:=break
.  break
. endif
finv.args:=${fmul.return}
. include <finv.mk>
fmul.args:=${itloop.a} ${itloop.a}
. include <fmul.mk>
. if ${fmul.return:M*inf} 
loop.brk:=break
.  break
. endif
fpas.args:=${fmul.return} ${finv.return}
. include <fpas.mk>
iads.args:=${fpas.return}
. include <iads.mk>
fpas.args:=${iads.return} ${xloop.re}
. include <fpas.mk>
iads.args:=${fpas.return}
. include <iads.mk>
itloop.d:=${iads.return}
fmul.args:=2 ${itloop.a}
. include <fmul.mk>
. if ${fmul.return:M*inf} 
loop.brk:=break
.  break
. endif
fmul.args:=${fmul.return} ${itloop.b}
. include <fmul.mk>
. if ${fmul.return:M*inf} 
loop.brk:=break
.  break
. endif
fpas.args:=${fmul.return} ${yloop.im}
. include <fpas.mk>
iads.args:=${fpas.return}
. include <iads.mk>
itloop.b:=${iads.return}
itloop.a:=${itloop.d}
. if ${itloop.d} > 2
itloop.pixel:=${brot.cmap:[${itloop.it}]}
. endif

iadd.args:=${itloop.it} 1
. include <iadd.mk>
itloop.it:=${iadd.return}
.endfor
.if ${loop.brk:U0}
. undef itloop.it
.endif
