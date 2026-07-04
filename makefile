.ifmake help

# For the ANSI escapes:
. include "basics/conf.mk"
# For the defaults.
. include "mandelbrot/defs.mk"
. info ${dsl}${msl}${bld}                         BSD-make Mandelbrot set render${rst}\
${.newline}${bld}Description:${rst}\
${.newline}This is a over-engineered, ultimately useless, and massively non-performant \
${.newline}implementation of a Mandelbrot set render written in ${itl}${bld}pure${rst} BSD makefile with no \
${.newline}calls to any external binaries.\
${.newline}${bld}Synopsis:${rst}\
${.newline}     make [w|width=\#] [h|hight|height=\#] [reoff|real|re=\#]\
${.newline}          [imoff|imaginary|im=\#] [z|zoom=\#] [it|iters|iterations=\#] > output.ppm\
${.newline}     make help\
${.newline}${bld}Options:${rst}\
${.newline}     w=\#\
${.newline}     width=\#      Output image width.                                 ${brot.width:C/./${bak}/g}Default:[${brot.width}]\
${.newline}     h=\#\
${.newline}     height=\#\
${.newline}     hight=\#      Output image height.                                ${brot.hight:C/./${bak}/g}Default:[${brot.hight}]\
${.newline}     re=\#\
${.newline}     real=\#\
${.newline}     reoff=\#      Real axis offset (x axis shift).                    ${brot.reoff:C/./${bak}/g}Default:[${brot.reoff}]\
${.newline}     im=\#\
${.newline}     imaginary=\#\
${.newline}     imoff=\#      Imaginary axis offset (y axis shift).               ${brot.imoff:C/./${bak}/g}Default:[${brot.imoff}]\
${.newline}     z=\#\
${.newline}     zoom=\#       Zoom level.                                         ${brot.zoom:C/./${bak}/g}Default:[${brot.zoom}]\
${.newline}     it=\#\
${.newline}     iterations=\#\
${.newline}     iters=\#      Numbers fractal formula iterations.                 ${brot.iters:C/./${bak}/g}Default:[${brot.iters}]\
${.newline}${bld}Example:${rst}\
${.newline}     Renders the set with default values, stores the image in output.ppm:\
${.newline}         make > output.ppm\
${.newline}     Renders a 1000x500 image of the set with a zoom level of 3:\
${.newline}         make width=1000 hight=500 z=3 > output.ppm\
${.newline}     Converting the output image to a PNG:\
${.newline}         ffmpeg -i output.ppm output.png\
${.newline}${bld}Bugs:${rst}\
${.newline}     As far as you can zoom in.\
${.newline}     > https://github.com/b-aaz/bmake-extravaganza/issues\
${.newline}${bld}Author:${rst}\
${.newline}     b-aaz <b-aazbsd@proton.me>
# Phony target, so that make doesn't complain about a non existent target.
help: .PHONY


.else


. if defined(w) && !empty(w)
width:=${w}
. endif

. if defined(h) && !empty(h)
hight:=${h}
. endif
. if defined(height) && !empty(height)
hight:=${height}
. endif

. if defined(real) && !empty(real)
reoff:=${real}
. endif
. if defined(re) && !empty(re)
reoff:=${re}
. endif

. if defined(imaginary) && !empty(imaginary)
imoff:=${imaginary}
. endif
. if defined(im) && !empty(im)
imoff:=${im}
. endif

. if defined(z) && !empty(z)
zoom:=${z}
. endif

. if defined(iterations) && !empty(iterations)
iters:=${iterations}
. endif
. if defined(it) && !empty(it)
iters:=${it}
. endif

brot.args?=${width:U-} ${hight:U-} ${reoff:U-} ${imoff:U-} ${zoom:U-} ${iters:U-}
. include "mandelbrot/main.mk"
.endif
