# CALCulating the initial CONSTants for rendering the fractal.

# restep = -(remin - remax)/hight/zoom

# restep = -(remin - remax)/hight/zoom
#                  - -----
finv.args:=${brot.remax}
.include <finv.mk>
# restep = -(remin - remax)/hight/zoom
#            -----   -----
fpas.args:=${brot.remin} ${finv.return}
.include <fpas.mk>
iads.args:=${fpas.return}
.include <iads.mk>
# restep = -(remin - remax)/hight/zoom
#          - -------------
finv.args:=${iads.return}
.include <finv.mk>
# restep = -(remin - remax)/hight/zoom
#          ---------------- -----
fdiv.args:=${finv.return} +${brot.hight}.0
.include <fdiv.mk>
# restep = -(remin - remax)/hight/zoom
#          ---------------------- ----
fdiv.args:=${fdiv.return} +${brot.zoom}.0
.include <fdiv.mk>
brot.restep:=${fdiv.return}


# imstep = -(immin - immax)/zoom/hight

# imstep = -(immin - immax)/zoom/hight
#                  - -----
finv.args:=${brot.immax}
.include <finv.mk>
# imstep = -(immin - immax)/zoom/hight
#            -----   -----
fpas.args:=${brot.immin} ${finv.return}
.include <fpas.mk>
iads.args:=${fpas.return}
.include <iads.mk>
# imstep = -(immin - immax)/zoom/hight
#          - -------------
finv.args:=${iads.return}
.include <finv.mk>
# imstep = -(immin - immax)/zoom/hight
#          ---------------- ----
fdiv.args:=${finv.return} ${brot.zoom}
.include <fdiv.mk>
brot.imstep_tmp:=${fdiv.return}
# imstep = -(immin - immax)/zoom/hight
#          --------------------- -----
fdiv.args:=${fdiv.return} ${brot.hight}
.include <fdiv.mk>
brot.imstep:=${fdiv.return}


# restart= - restep*width*0.5+reoff

# restart= - restep*width*0.5+reoff
#          - ------
finv.args:=${brot.restep}
.include <finv.mk>
# restart= - restep*width*0.5+reoff
#          -------- -----
fmul.args:=${finv.return} ${brot.width}
.include <fmul.mk>
# restart= - restep*width*0.5+reoff
#          -------------- ---
fmul.args:=${fmul.return} 0.5
.include <fmul.mk>
# restart= - restep*width*0.5+reoff
#          ------------------ -----
fpas.args:=${fmul.return} ${brot.reoff}
.include <fpas.mk>
iads.args:=${fpas.return}
.include <iads.mk>
brot.restart:=${iads.return}

# imstart= - imstep_tmp*0.5+imoff

# imstart= - imstep_tmp*0.5+imoff
#          - ----------
finv.args:=${brot.imstep_tmp}
.include <finv.mk>
# imstart= - imstep_tmp*0.5+imoff
#          ------------ ---
fmul.args:=${finv.return} 0.5
.include <fmul.mk>
# imstart= - imstep_tmp*0.5+imoff
#          ---------------- -----
fpas.args:=${fmul.return} ${brot.imoff}
.include <fpas.mk>
iads.args:=${fpas.return}
.include <iads.mk>
brot.imstart:=${iads.return}
