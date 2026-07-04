# The MAIN "function" for the Mandelbrot set renderer.

# "Add" the basics to our "namespace".
.SYSPATH: ${.PARSEDIR:tA}/../basics
.include <conf.mk>

# Argument parsing: (Char '-' will let the variable be set to default)
# Output image width.
.if !empty(brot.args:[1]) && ${brot.args:[1]} != -
brot.width:=	${brot.args:[1]}
.endif
# Output image hight.
.if !empty(brot.args:[2]) && ${brot.args:[2]} != -
brot.hight:=	${brot.args:[2]}
.endif
# Real offset.
.if !empty(brot.args:[3]) && ${brot.args:[3]} != -
brot.reoff:=	${brot.args:[3]}
.endif
# Imaginary offset.
.if !empty(brot.args:[4]) && ${brot.args:[4]} != -
brot.imoff:=	${brot.args:[4]}
.endif
# Zoom factor.
.if !empty(brot.args:[5]) && ${brot.args:[5]} != -
brot.zoom:=	${brot.args:[5]}
.endif
# Iterations of fractal formula.
.if !empty(brot.args:[6]) && ${brot.args:[6]} != -
brot.iters:=	${brot.args:[6]}
.endif

# Setting the defaults and input sanitization.
.include "defs.mk"

# Scale the color map.
.include "mapcolors.mk"


# Pretty printing the predefined constants:
.info ${dsl}${msl}${bld}Predefined constants:${rst}\
${.newline}Re. Min.:	${brot.remin}	Re. Max.:	${brot.remax}\
${.newline}Im. Min.:	${brot.immin}	Im. Max.:	${brot.immax}


# Calculates the step size constants and start point of our real and imaginary
# axis.
.include "constcalc.mk"
# Pretty printing the calculated constants:
.info ${dsl}${msl}${bld}Calculated constants:${rst}\
${.newline}Re. Start:	${brot.restart}	Re. Step:	${brot.restep}\
${.newline}Im. Start:	${brot.imstart}	Im. Step:	${brot.imstep}	


# Pretty printing fractal details:
.info ${dsl}${msl}${bld}Rendering the Mandelbrot set fractal with the following\
inputs: ${rst}\
${.newline}Iterations:	${brot.iters}	Dimensions:		${brot.width}x${brot.hight}\
${.newline}Real offset:	${brot.reoff}	Imaginary offset:	${brot.imoff}	zoom:	${brot.zoom}\

.info ${dsl}${msl}${bld}Progress:${rst}
# Main loop.
${loop.depth}loop.args:=mandelbrot/yloop.mk
.include <loop.mk>

# Output the rendered picture.
.include "print.mk"

# Finished!
.info ${dsl}${msl}${bld}${grn}Completed!${rst}${lup}${.newline}
