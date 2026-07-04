# Floating Pre Add or Subtract.
fpas.left:= ${fpas.args:[1]:S/./ /}
fpas.right:=${fpas.args:[2]:S/./ /}

fpas.left_decimal:=${fpas.left:[1]}
fpas.left_frac:=${fpas.left:[2]:C/0*$//g}

fpas.right_decimal:=${fpas.right:[1]}
fpas.right_frac:=${fpas.right:[2]:C/0*$//g}

.if empty(fpas.left_frac)
fpas.left_frac=0
.endif
.if empty(fpas.right_frac)
fpas.right_frac=0
.endif

fpas.right_pad:=${fpas.right_frac:C/./0/g}
fpas.left_pad:=${fpas.left_frac:C/./0/g}
fpas.right_pad-left_pad:=${fpas.right_pad:S/${fpas.left_pad}//}
fpas.left_pad-right_pad:=${fpas.left_pad:S/${fpas.right_pad}//}
.if 1${fpas.right_pad-left_pad} != 1${fpas.right_pad}
fpas.right_pad:=
fpas.left_pad:=${fpas.right_pad-left_pad}
.elif 1${fpas.left_pad-right_pad} != 1${fpas.left_pad}
fpas.left_pad:=
fpas.right_pad:=${fpas.left_pad-right_pad}
.endif

fpas.ret_l:=${fpas.left_decimal}.${fpas.left_frac}${fpas.left_pad}
fpas.ret_r:=${fpas.right_decimal}.${fpas.right_frac}${fpas.right_pad}

fpas.over_l:=${fpas.ret_l:C/^[-+]//:C/./. /g}
.if ${fpas.over_l:[#]} > 16
fpas.over_l:=${fpas.over_l:[17..-1]:ts}
fpas.ret_l:=${fpas.ret_l:C/${fpas.over_l}$//g}
fpas.ret_r:=${fpas.ret_r:C/${fpas.over_l}$//g}
.endif

fpas.over_r:=${fpas.ret_r:C/^[-+]//:C/./. /g}
.if ${fpas.over_r:[#]} > 16
fpas.over_r:=${fpas.over_r:[17..-1]:ts}
fpas.ret_l:=${fpas.ret_l:C/${fpas.over_r}$//g}
fpas.ret_r:=${fpas.ret_r:C/${fpas.over_r}$//g}
.endif

fpas.return:=${fpas.ret_l} ${fpas.ret_r}
