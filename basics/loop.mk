# LOOP function.
# 5 nested loops of 2000 = 2000^5 = 35^15 = 32 quadrillion ~= Infinity for all
# intents and purposes.
${loop.depth}@loop.func:=	${${loop.depth}loop.args:[1]}
loop.depth:=	${loop.depth}@
.for i in ${0s}
. for i in ${0s}
.  for i in ${0s}
.   for i in ${0s}
.    for i in ${0s}
.     include "${${loop.depth}loop.func}"
.     if defined(loop.brk)
.       break
.     endif
.    endfor
.    if defined(loop.brk)
.     break
.    endif
.   endfor
.   if defined(loop.brk)
.    break
.   endif
.  endfor
.  if defined(loop.brk)
.   break
.  endif
. endfor
. if defined(loop.brk)
.  break
. endif
.endfor
.undef loop.brk
loop.depth:=${loop.depth:S/@//}
