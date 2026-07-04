# Multiplication table with carries.
# This table could have been compressed using the symmetry of multiplication,
# but having  a full LUT helps speed up the operations, by reducing the
# potential extra look up.

# *LR=RESULT CARRY
# *: The operation.
# L: Left hand side digit.
# R: Right hand side digit.

*00=0
*01=0
*02=0
*03=0
*04=0
*05=0
*06=0
*07=0
*08=0
*09=0
*10=0
*11=1
*12=2
*13=3
*14=4
*15=5
*16=6
*17=7
*18=8
*19=9
*20=0
*21=2
*22=4
*23=6
*24=8
*25=0 1
*26=2 1
*27=4 1
*28=6 1
*29=8 1
*30=0
*31=3
*32=6
*33=9
*34=2 1
*35=5 1
*36=8 1
*37=1 2
*38=4 2
*39=7 2
*40=0
*41=4
*42=8
*43=2 1
*44=6 1
*45=0 2
*46=4 2
*47=8 2
*48=2 3
*49=6 3
*50=0
*51=5
*52=0 1
*53=5 1
*54=0 2
*55=5 2
*56=0 3
*57=5 3
*58=0 4
*59=5 4
*60=0 
*61=6 
*62=2 1
*63=8 1
*64=4 2
*65=0 3
*66=6 3
*67=2 4
*68=8 4
*69=4 5
*70=0
*71=7
*72=4 1
*73=1 2
*74=8 2
*75=5 3
*76=2 4
*77=9 4
*78=6 5
*79=3 6
*80=0
*81=8
*82=6 1
*83=4 2
*84=2 3
*85=0 4
*86=8 4
*87=6 5
*88=4 6
*89=2 7
*90=0 
*91=9 
*92=8 1
*93=7 2
*94=6 3
*95=5 4
*96=4 5
*97=3 6
*98=2 7
*99=1 8

# Multiplication sign table.
*--  = +
*-+  = -
*+-  = -
*++  = +

# This PYRamid is used in the summation step of the multiplier to "shift"
# numbers to their correct powers.
# This can be easily generated on the spot, but I found out hard coding it can
# speed up the operation.
pyr_1 = 
pyr_2 = 0
pyr_3 = 0 0
pyr_4 = 0 0 0
pyr_5 = 0 0 0 0
pyr_6 = 0 0 0 0 0
pyr_7 = 0 0 0 0 0 0
pyr_8 = 0 0 0 0 0 0 0
pyr_9 = 0 0 0 0 0 0 0 0
pyr_10= 0 0 0 0 0 0 0 0 0
pyr_11= 0 0 0 0 0 0 0 0 0 0
pyr_12= 0 0 0 0 0 0 0 0 0 0 0
pyr_13= 0 0 0 0 0 0 0 0 0 0 0 0
pyr_14= 0 0 0 0 0 0 0 0 0 0 0 0 0
pyr_15= 0 0 0 0 0 0 0 0 0 0 0 0 0 0
pyr_16= 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
