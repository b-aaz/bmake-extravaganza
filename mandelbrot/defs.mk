# DEFault values and Sanitization of fractal input variables. 

# Undefineing empty inputs so that they'll get force set to their defaults.
.if empty(brot.immin)
.undef brot.immin
.endif
.if empty(brot.immax)
.undef brot.immax
.endif
.if empty(brot.remin)
.undef brot.remin
.endif
.if empty(brot.remax)
.undef brot.remax
.endif

.if empty(brot.width)
.undef brot.width
.endif
.if empty(brot.hight)
.undef brot.hight
.endif

.if empty(brot.reoff)
.undef brot.reoff
.endif
.if empty(brot.imoff)
.undef brot.imoff
.endif

.if empty(brot.zoom)
.undef brot.zoom
.endif
.if empty(brot.iters)
.undef brot.iters
.endif


# Default Viewport dimensions.
brot.immin?=	-2.0
brot.immax?=	2.0
brot.remin?=	-2.0
brot.remax?=	2.0

# Default output image width.
brot.width?=	100
# Default output image hight.
brot.hight?=	50

# Default real offset.
brot.reoff?=	-1.4
# Default imaginary offset.
brot.imoff?=	0

# Default zoom factor.
brot.zoom?=	2
# Default iterations of fractal formula.
brot.iters?=	10


# Simple input validation:
.if !empty(brot.immin:C/[+-]?[0-9]*\.?[0-9]*//)
. error brot.immin is not a valid float.
.endif
.if !empty(brot.immax:C/[+-]?[0-9]*\.?[0-9]*//)
. error brot.immax is not a valid float.
.endif
.if !empty(brot.remin:C/[+-]?[0-9]*\.?[0-9]*//)
. error brot.remin is not a valid float.
.endif
.if !empty(brot.remax:C/[+-]?[0-9]*\.?[0-9]*//)
. error brot.remax is not a valid float.
.endif

.if !empty(brot.width:C/[+-]?[0-9]*//)
. error brot.width is not a valid integer.
.endif
.if !empty(brot.hight:C/[+-]?[0-9]*//)
. error brot.hight is not a valid integer.
.endif

.if !empty(brot.reoff:C/[+-]?[0-9]*\.?[0-9]*//)
. error brot.reoff is not a valid float.
.endif
.if !empty(brot.imoff:C/[+-]?[0-9]*\.?[0-9]*//)
. error brot.imoff is not a valid float.
.endif

.if !empty(brot.zoom:C/[+-]?[0-9]*\.?[0-9]*//)
. error brot.zoom is not a valid float.
.endif
.if !empty(brot.iters:C/[+-]?[0-9]*//)
. error brot.iters is not a valid integer.
.endif


# More detailed checks.
.if ${brot.width} < 1
. error brot.width should be larger than 1.
.endif
.if ${brot.hight} < 1
. error brot.hight should be larger than 1.
.endif

.if ${brot.remin} > ${brot.reoff} || ${brot.remax} < ${brot.reoff}
. error brot.reoff is out of viewport's range.
.endif
.if ${brot.immin} > ${brot.imoff} || ${brot.immax} < ${brot.imoff}
. error brot.imoff is out of viewport's range.
.endif

.if ${brot.iters} <= 1
. error brot.iters is not higher than 1.
.endif
