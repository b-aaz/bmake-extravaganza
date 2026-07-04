# Addition table.

# List of all of the possible decimal digits added to all other possible
# digits.
# This table could be compressed using the symmetry of addition operation, but
# that would slow down the adders due to the overhead, so it is not done here.

# +[C]LR=RESULT CARRY
# +: The operation.
# C: Whether we have a CARRY from the last operation.
# L: Left hand side digit.
# R: Right hand side digit.

+00=0
+01=1
+02=2
+03=3
+04=4
+05=5
+06=6
+07=7
+08=8
+09=9
+10=1
+11=2
+12=3
+13=4
+14=5
+15=6
+16=7
+17=8
+18=9
+19=0 1
+20=2
+21=3
+22=4
+23=5
+24=6
+25=7
+26=8
+27=9
+28=0 1
+29=1 1
+30=3
+31=4
+32=5
+33=6
+34=7
+35=8
+36=9
+37=0 1
+38=1 1
+39=2 1
+40=4
+41=5
+42=6
+43=7
+44=8
+45=9
+46=0 1
+47=1 1
+48=2 1
+49=3 1
+50=5
+51=6
+52=7
+53=8
+54=9
+55=0 1
+56=1 1
+57=2 1
+58=3 1
+59=4 1
+60=6
+61=7
+62=8
+63=9
+64=0 1
+65=1 1
+66=2 1
+67=3 1
+68=4 1
+69=5 1
+70=7
+71=8
+72=9
+73=0 1
+74=1 1
+75=2 1
+76=3 1
+77=4 1
+78=5 1
+79=6 1
+80=8
+81=9
+82=0 1
+83=1 1
+84=2 1
+85=3 1
+86=4 1
+87=5 1
+88=6 1
+89=7 1
+90=9
+91=0 1
+92=1 1
+93=2 1
+94=3 1
+95=4 1
+96=5 1
+97=6 1
+98=7 1
+99=8 1
# This is used to "skip" over the decimal point, without needing any extra
# logic.
+..=.

# The same list as above, but the results have all been incremented by 1.
# This list is used for adding digits with a carry digit carried over form the
# last operation.
+100=1
+101=2
+102=3
+103=4
+104=5
+105=6
+106=7
+107=8
+108=9
+109=0 1
+110=2
+111=3
+112=4
+113=5
+114=6
+115=7
+116=8
+117=9
+118=0 1
+119=1 1
+120=3
+121=4
+122=5
+123=6
+124=7
+125=8
+126=9
+127=0 1
+128=1 1
+129=2 1
+130=4
+131=5
+132=6
+133=7
+134=8
+135=9
+136=0 1
+137=1 1
+138=2 1
+139=3 1
+140=5
+141=6
+142=7
+143=8
+144=9
+145=0 1
+146=1 1
+147=2 1
+148=3 1
+149=4 1
+150=6
+151=7
+152=8
+153=9
+154=0 1
+155=1 1
+156=2 1
+157=3 1
+158=4 1
+159=5 1
+160=7
+161=8
+162=9
+163=0 1
+164=1 1
+165=2 1
+166=3 1
+167=4 1
+168=5 1
+169=6 1
+170=8
+171=9
+172=0 1
+173=1 1
+174=2 1
+175=3 1
+176=4 1
+177=5 1
+178=6 1
+179=7 1
+180=9
+181=0 1
+182=1 1
+183=2 1
+184=3 1
+185=4 1
+186=5 1
+187=6 1
+188=7 1
+189=8 1
+190=0 1
+191=1 1
+192=2 1
+193=3 1
+194=4 1
+195=5 1
+196=6 1
+197=7 1
+198=8 1
+199=9 1
# This is also used to "skip" over the decimal point, while carrying the carry 
# digit to the next actual add operation.
+1..=. 1

# Sign table, basically XNOR
+++ = +
++- = -
+-+ = -
+-- = +

# Name of the operation, for use in iads.mk to choose the correct "function"
# name.
+name = add
