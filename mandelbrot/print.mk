# PRINT out the rendered image to stdout.

# A signature, with some info, to put at the end of the output picture file.
print.sig:=${.newline}\# Input variables:\
${.newline}\# reoff=${brot.reoff}	imoff=${brot.imoff}\
${.newline}\# iters=${brot.iters}	zoom=${brot.zoom}\
${.newline}\# remin=${brot.remin}	remax=${brot.remax}\
${.newline}\# immin=${brot.immin}	immax=${brot.immax}\
${.newline}\# This image was created with b-aaz's pure bmake Mandelbrot set renderer.\
${.newline}\# - https://github.com/b-aaz/bmake-extravaganza

# Constructing the PPM image, and replacing the color separators with spaces.
print.pic=P3${.newline}${brot.width} ${brot.hight}${.newline}255${.newline}${brot.pic:S/|/ /Wg}${print.sig}

# This is a hack for using absolutely no external commands.

# We need a way for printing a raw string, without any preamble, to the stdout,
# the -v command line flag for make does exactly that, and the .MAKEFLAGS
# target helps us add to the command line flags while the file is being parsed.

# Hence:
.MAKEFLAGS: -v print.pic 
# Prints the rendered image, stored in 'print.pic' variable cleanly to stdout.
