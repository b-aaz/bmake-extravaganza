# Takes the number of iterations, the palette, and then scales the palette to
# the number of given iterations, putting the scaled down version in a map.

# The color palette
.include "palette.mk"

isub.args:=${brot.iters} 1
.include <isub.mk>

mcol.iters:=${isub.return}

isub.args:=${brot.palette:[#]} 1
.include <isub.mk>

fdiv.args:=${isub.return} ${mcol.iters}
.include <fdiv.mk>

# By how much we should increment the palette's index in the mapping loop.
mlop.cinc:=${fdiv.return:C/[+-]//}
${loop.depth}loop.args:=mandelbrot/maploop.mk
.include <loop.mk>

# We don't need the original palette anymore.
.undef brot.palette

# Pretty printing the colors with ANSI samples.
.for mlop.color in ${brot.cmap}
# Creating a line, where the RGB colors are both printed in value and sampled
# on a strip of whitespace with ANSI codes.
mcol.ansimap:=${mcol.ansimap}${red}R${rst}:\
${mlop.color:S/|/ ${grn}G${rst}:/:S/|/ ${blu}B${rst}:/} \
${esc}[48;2;${mlop.color:S/|/;/g}m    ${rst}${.newline}
.endfor 

.info ${dsl}${msl}${bld}Fractal color map (for ${brot.iters} iterations):${rst}
.info ${dsl}${msl}${mcol.ansimap}
