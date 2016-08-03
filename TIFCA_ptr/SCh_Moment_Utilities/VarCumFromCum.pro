pro VarCumFromCum,Cum, VarCum

;+
; NAME:
;       VarCumFromCum
;
; PURPOSE:
;		Determine variance of population cumulants (for large sample sizes: n->Infinity),
;		use sample cumulants
;		NOTE: calculated variance is variance times n
;		Thus, TrueVariance = 1/n Var[kappa_r]
;		Var[kappa_r]
;
; CATEGORY:
;       MomentUtil
;
; CALLING SEQUENCE:
;       VarCumFromCum, Cum, VarCum
;
; INPUTS:
;       Cum: [Vector, 0..20] contains cumulants [0, kappa_1, kappa_2, ...]
;
; KEYWORD INPUTS:
;
;
; OUTPUTS:
;       VarCum: [Vector,0..20/2] contains variance of cumulants [0, Var[kappa_1], Var[kappa_2], ...]
;
; OPTIONAL OUTPUT PARAMETERS:
;
;
; RETURNS:
;
;
; SIDE EFFECTS:
;
;
; COMMON BLOCKS:
;
;
; RESTRICTIONS:
;		requires input of cumulants, 0th element is simply a dummy and not used
;
; EXAMPLE:
;		VarCumFromCum,[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]*1d,VarCum
;		> print,VarCum
;    0.00000000       2.0000000       12.000000       207.00000       5592.0000
;     220275.00       11634948.  7.8641291e+008  6.5668997e+010  6.6021793e+012
;7.8316926e+014
;
; PROCEDURE:
;		see Kendall and Stuart Vol.1 4th edition "Advanced theory of statistics"
;		p309ff, Eq(12.35, 12.40, 12.43, 12.46).
;
;		Algorithm: from Mathematica (see VarCumFromCum.nb)
;		calculate Varaiance of central moments using k-statistics
;
; REFERENCE:
;
; MODIFICATION HISTORY:
;       Written by JM: sometime in 2002
;       Modified:
;
; TODO:	Check the accuracy of procedure
;
;-


var_cum=[0,cum[2], 2*cum[2]^2 + cum[4], $
  6*cum[2]^3 + 9*cum[3]^2 + 9*cum[2]*cum[4] + cum[6], $
  24*cum[2]^4 + 72*cum[2]^2*cum[4] + 34*cum[4]^2 + 48*cum[3]*cum[5] + $
    16*cum[2]*(9*cum[3]^2 + cum[6]) + cum[8], $
  120*cum[2]^5 + 1800*cum[2]^2*cum[3]^2 + 600*cum[2]^3*cum[4] + $
    1500*cum[3]^2*cum[4] + 850*cum[2]*cum[4]^2 + 1200*cum[2]*cum[3]*cum[5] + $
    125*cum[5]^2 + 200*cum[2]^2*cum[6] + 200*cum[4]*cum[6] + $
    100*cum[3]*cum[7] + 25*cum[2]*cum[8] + cum[10], $
  720*cum[2]^6 + 21600*cum[2]^3*cum[3]^2 + 8100*cum[3]^4 + $
    5400*cum[2]^4*cum[4] + 54000*cum[2]*cum[3]^2*cum[4] + $
    15300*cum[2]^2*cum[4]^2 + 4950*cum[4]^3 + 21600*cum[2]^2*cum[3]*cum[5] + $
    21600*cum[3]*cum[4]*cum[5] + 4500*cum[2]*cum[5]^2 + $
    2400*cum[2]^3*cum[6] + 6300*cum[3]^2*cum[6] + 7200*cum[2]*cum[4]*cum[6] + $
    461*cum[6]^2 + 3600*cum[2]*cum[3]*cum[7] + 780*cum[5]*cum[7] + $
    450*cum[2]^2*cum[8] + 465*cum[4]*cum[8] + 180*cum[3]*cum[9] + $
    36*cum[2]*cum[10] + cum[12], $
  5040*cum[2]^7 + 264600*cum[2]^4*cum[3]^2 + 396900*cum[2]*cum[3]^4 + $
    52920*cum[2]^5*cum[4] + 1323000*cum[2]^2*cum[3]^2*cum[4] + $
    249900*cum[2]^3*cum[4]^2 + 639450*cum[3]^2*cum[4]^2 + $
    242550*cum[2]*cum[4]^3 + 352800*cum[2]^3*cum[3]*cum[5] + $
    308700*cum[3]^3*cum[5] + 1058400*cum[2]*cum[3]*cum[4]*cum[5] + $
    110250*cum[2]^2*cum[5]^2 + 113925*cum[4]*cum[5]^2 + $
    29400*cum[2]^4*cum[6] + 308700*cum[2]*cum[3]^2*cum[6] + $
    176400*cum[2]^2*cum[4]*cum[6] + 91630*cum[4]^2*cum[6] + $
    133770*cum[3]*cum[5]*cum[6] + 22589*cum[2]*cum[6]^2 + $
    88200*cum[2]^2*cum[3]*cum[7] + 91140*cum[3]*cum[4]*cum[7] + $
    38220*cum[2]*cum[5]*cum[7] + 1715*cum[7]^2 + 7350*cum[2]^3*cum[8] + $
    19845*cum[3]^2*cum[8] + 22785*cum[2]*cum[4]*cum[8] + 2989*cum[6]*cum[8] + $
    8820*cum[2]*cum[3]*cum[9] + 1960*cum[5]*cum[9] + 882*cum[2]^2*cum[10] + $
    931*cum[4]*cum[10] + 294*cum[3]*cum[11] + 49*cum[2]*cum[12] + cum[14], $
  40320*cum[2]^8 + 3386880*cum[2]^5*cum[3]^2 + 12700800*cum[2]^2*cum[3]^4 + $
    564480*cum[2]^6*cum[4] + 28224000*cum[2]^3*cum[3]^2*cum[4] + $
    11995200*cum[3]^4*cum[4] + 3998400*cum[2]^4*cum[4]^2 + $
    40924800*cum[2]*cum[3]^2*cum[4]^2 + 7761600*cum[2]^2*cum[4]^3 + $
    1989400*cum[4]^4 + 5644800*cum[2]^4*cum[3]*cum[5] + $
    19756800*cum[2]*cum[3]^3*cum[5] + $
    33868800*cum[2]^2*cum[3]*cum[4]*cum[5] + $
    17404800*cum[3]*cum[4]^2*cum[5] + 2352000*cum[2]^3*cum[5]^2 + $
    6350400*cum[3]^2*cum[5]^2 + 7291200*cum[2]*cum[4]*cum[5]^2 + $
    376320*cum[2]^5*cum[6] + 9878400*cum[2]^2*cum[3]^2*cum[6] + $
    3763200*cum[2]^3*cum[4]*cum[6] + 10207680*cum[3]^2*cum[4]*cum[6] + $
    5864320*cum[2]*cum[4]^2*cum[6] + 8561280*cum[2]*cum[3]*cum[5]*cum[6] + $
    956480*cum[5]^2*cum[6] + 722848*cum[2]^2*cum[6]^2 + $
    769104*cum[4]*cum[6]^2 + 1881600*cum[2]^3*cum[3]*cum[7] + $
    1693440*cum[3]^3*cum[7] + 5832960*cum[2]*cum[3]*cum[4]*cum[7] + $
    1223040*cum[2]^2*cum[5]*cum[7] + 1301440*cum[4]*cum[5]*cum[7] + $
    765184*cum[3]*cum[6]*cum[7] + 109760*cum[2]*cum[7]^2 + $
    117600*cum[2]^4*cum[8] + 1270080*cum[2]*cum[3]^2*cum[8] + $
    729120*cum[2]^2*cum[4]*cum[8] + 386120*cum[4]^2*cum[8] + $
    564480*cum[3]*cum[5]*cum[8] + 191296*cum[2]*cum[6]*cum[8] + $
    6434*cum[8]^2 + 282240*cum[2]^2*cum[3]*cum[9] + $
    297920*cum[3]*cum[4]*cum[9] + 125440*cum[2]*cum[5]*cum[9] + $
    11424*cum[7]*cum[9] + 18816*cum[2]^3*cum[10] + 51744*cum[3]^2*cum[10] + $
    59584*cum[2]*cum[4]*cum[10] + 7952*cum[6]*cum[10] + $
    18816*cum[2]*cum[3]*cum[11] + 4256*cum[5]*cum[11] + $
    1568*cum[2]^2*cum[12] + 1680*cum[4]*cum[12] + 448*cum[3]*cum[13] + $
    64*cum[2]*cum[14] + cum[16], $
  362880*cum[2]^9 + 45722880*cum[2]^6*cum[3]^2 + $
    342921600*cum[2]^3*cum[3]^4 + 57153600*cum[3]^6 + $
    6531840*cum[2]^7*cum[4] + 571536000*cum[2]^4*cum[3]^2*cum[4] + $
    971611200*cum[2]*cum[3]^4*cum[4] + 64774080*cum[2]^5*cum[4]^2 + $
    1657454400*cum[2]^2*cum[3]^2*cum[4]^2 + 209563200*cum[2]^3*cum[4]^3 + $
    562010400*cum[3]^2*cum[4]^3 + 161141400*cum[2]*cum[4]^4 + $
    91445760*cum[2]^5*cum[3]*cum[5] + 800150400*cum[2]^2*cum[3]^3*cum[5] + $
    914457600*cum[2]^3*cum[3]*cum[4]*cum[5] + $
    819201600*cum[3]^3*cum[4]*cum[5] + $
    1409788800*cum[2]*cum[3]*cum[4]^2*cum[5] + 47628000*cum[2]^4*cum[5]^2 + $
    514382400*cum[2]*cum[3]^2*cum[5]^2 + 295293600*cum[2]^2*cum[4]*cum[5]^2 + $
    156378600*cum[4]^2*cum[5]^2 + 76204800*cum[3]*cum[5]^3 + $
    5080320*cum[2]^6*cum[6] + 266716800*cum[2]^3*cum[3]^2*cum[6] + $
    120022560*cum[3]^4*cum[6] + 76204800*cum[2]^4*cum[4]*cum[6] + $
    826822080*cum[2]*cum[3]^2*cum[4]*cum[6] + $
    237504960*cum[2]^2*cum[4]^2*cum[6] + 83825280*cum[4]^3*cum[6] + $
    346731840*cum[2]^2*cum[3]*cum[5]*cum[6] + $
    367688160*cum[3]*cum[4]*cum[5]*cum[6] + 77474880*cum[2]*cum[5]^2*cum[6] + $
    19516896*cum[2]^3*cum[6]^2 + 54041904*cum[3]^2*cum[6]^2 + $
    62297424*cum[2]*cum[4]*cum[6]^2 + 2788296*cum[6]^3 + $
    38102400*cum[2]^4*cum[3]*cum[7] + 137168640*cum[2]*cum[3]^3*cum[7] + $
    236234880*cum[2]^2*cum[3]*cum[4]*cum[7] + $
    125102880*cum[3]*cum[4]^2*cum[7] + 33022080*cum[2]^3*cum[5]*cum[7] + $
    91445760*cum[3]^2*cum[5]*cum[7] + 105416640*cum[2]*cum[4]*cum[5]*cum[7] + $
    61979904*cum[2]*cum[3]*cum[6]*cum[7] + 14140224*cum[5]*cum[6]*cum[7] + $
    4445280*cum[2]^2*cum[7]^2 + 4805136*cum[4]*cum[7]^2 + $
    1905120*cum[2]^5*cum[8] + 51438240*cum[2]^2*cum[3]^2*cum[8] + $
    19686240*cum[2]^3*cum[4]*cum[8] + 54295920*cum[3]^2*cum[4]*cum[8] + $
    31275720*cum[2]*cum[4]^2*cum[8] + 45722880*cum[2]*cum[3]*cum[5]*cum[8] + $
    5205060*cum[5]^2*cum[8] + 7747488*cum[2]^2*cum[6]*cum[8] + $
    8370432*cum[4]*cum[6]*cum[8] + 4164048*cum[3]*cum[7]*cum[8] + $
    521154*cum[2]*cum[8]^2 + 7620480*cum[2]^3*cum[3]*cum[9] + $
    6985440*cum[3]^3*cum[9] + 24131520*cum[2]*cum[3]*cum[4]*cum[9] + $
    5080320*cum[2]^2*cum[5]*cum[9] + 5473440*cum[4]*cum[5]*cum[9] + $
    3220560*cum[3]*cum[6]*cum[9] + 925344*cum[2]*cum[7]*cum[9] + $
    24309*cum[9]^2 + 381024*cum[2]^4*cum[10] + $
    4191264*cum[2]*cum[3]^2*cum[10] + 2413152*cum[2]^2*cum[4]*cum[10] + $
    1295784*cum[4]^2*cum[10] + 1896048*cum[3]*cum[5]*cum[10] + $
    644112*cum[2]*cum[6]*cum[10] + 43740*cum[8]*cum[10] + $
    762048*cum[2]^2*cum[3]*cum[11] + 816480*cum[3]*cum[4]*cum[11] + $
    344736*cum[2]*cum[5]*cum[11] + 31752*cum[7]*cum[11] + $
    42336*cum[2]^3*cum[12] + 117936*cum[3]^2*cum[12] + $
    136080*cum[2]*cum[4]*cum[12] + 18396*cum[6]*cum[12] + $
    36288*cum[2]*cum[3]*cum[13] + 8316*cum[5]*cum[13] + $
    2592*cum[2]^2*cum[14] + 2808*cum[4]*cum[14] + 648*cum[3]*cum[15] + $
    81*cum[2]*cum[16] + cum[18], $
  3628800*cum[2]^10 + 653184000*cum[2]^7*cum[3]^2 + $
    8573040000*cum[2]^4*cum[3]^4 + 5715360000*cum[2]*cum[3]^6 + $
    81648000*cum[2]^8*cum[4] + 11430720000*cum[2]^5*cum[3]^2*cum[4] + $
    48580560000*cum[2]^2*cum[3]^4*cum[4] + 1079568000*cum[2]^6*cum[4]^2 + $
    55248480000*cum[2]^3*cum[3]^2*cum[4]^2 + 24528420000*cum[3]^4*cum[4]^2 + $
    5239080000*cum[2]^4*cum[4]^3 + 56201040000*cum[2]*cum[3]^2*cum[4]^3 + $
    8057070000*cum[2]^2*cum[4]^4 + 1694763000*cum[4]^5 + $
    1524096000*cum[2]^6*cum[3]*cum[5] + $
    26671680000*cum[2]^3*cum[3]^3*cum[5] + 7144200000*cum[3]^5*cum[5] + $
    22861440000*cum[2]^4*cum[3]*cum[4]*cum[5] + $
    81920160000*cum[2]*cum[3]^3*cum[4]*cum[5] + $
    70489440000*cum[2]^2*cum[3]*cum[4]^2*cum[5] + $
    24766560000*cum[3]*cum[4]^3*cum[5] + 952560000*cum[2]^5*cum[5]^2 + $
    25719120000*cum[2]^2*cum[3]^2*cum[5]^2 + 9843120000*cum[2]^3*cum[4]*cum[5]^2 + $
    27147960000*cum[3]^2*cum[4]*cum[5]^2 + 15637860000*cum[2]*cum[4]^2*cum[5]^2 + $
    7620480000*cum[2]*cum[3]*cum[5]^3 + 433282500*cum[5]^4 + $
    72576000*cum[2]^7*cum[6] + 6667920000*cum[2]^4*cum[3]^2*cum[6] + $
    12002256000*cum[2]*cum[3]^4*cum[6] + 1524096000*cum[2]^5*cum[4]*cum[6] + $
    41341104000*cum[2]^2*cum[3]^2*cum[4]*cum[6] + 7916832000*cum[2]^3*cum[4]^2*cum[6] + $
    21829500000*cum[3]^2*cum[4]^2*cum[6] + 8382528000*cum[2]*cum[4]^3*cum[6] + $
    11557728000*cum[2]^3*cum[3]*cum[5]*cum[6] + 10636920000*cum[3]^3*cum[5]*cum[6] + $
    36768816000*cum[2]*cum[3]*cum[4]*cum[5]*cum[6] + $
    3873744000*cum[2]^2*cum[5]^2*cum[6] + 4180680000*cum[4]*cum[5]^2*cum[6] + $
    487922400*cum[2]^4*cum[6]^2 + 5404190400*cum[2]*cum[3]^2*cum[6]^2 + $
    3114871200*cum[2]^2*cum[4]*cum[6]^2 + 1680827400*cum[4]^2*cum[6]^2 + $
    2460250800*cum[3]*cum[5]*cum[6]^2 + 278829600*cum[2]*cum[6]^3 + $
    762048000*cum[2]^5*cum[3]*cum[7] + 6858432000*cum[2]^2*cum[3]^3*cum[7] + $
    7874496000*cum[2]^3*cum[3]*cum[4]*cum[7] + 7239456000*cum[3]^3*cum[4]*cum[7] + $
    12510288000*cum[2]*cum[3]*cum[4]^2*cum[7] + 825552000*cum[2]^4*cum[5]*cum[7] + $
    9144576000*cum[2]*cum[3]^2*cum[5]*cum[7] + 5270832000*cum[2]^2*cum[4]*cum[5]*cum[7] + $
    2841804000*cum[4]^2*cum[5]*cum[7] + 2079756000*cum[3]*cum[5]^2*cum[7] + $
    3098995200*cum[2]^2*cum[3]*cum[6]*cum[7] + 3344544000*cum[3]*cum[4]*cum[6]*cum[7] + $
    1414022400*cum[2]*cum[5]*cum[6]*cum[7] + 148176000*cum[2]^3*cum[7]^2 + $
    415951200*cum[3]^2*cum[7]^2 + 480513600*cum[2]*cum[4]*cum[7]^2 + $
    65444400*cum[6]*cum[7]^2 + 31752000*cum[2]^6*cum[8] + $
    1714608000*cum[2]^3*cum[3]^2*cum[8] + 785862000*cum[3]^4*cum[8] + $
    492156000*cum[2]^4*cum[4]*cum[8] + 5429592000*cum[2]*cum[3]^2*cum[4]*cum[8] + $
    1563786000*cum[2]^2*cum[4]^2*cum[8] + 561015000*cum[4]^3*cum[8] + $
    2286144000*cum[2]^2*cum[3]*cum[5]*cum[8] + 2463048000*cum[3]*cum[4]*cum[5]*cum[8] + $
    520506000*cum[2]*cum[5]^2*cum[8] + 258249600*cum[2]^3*cum[6]*cum[8] + $
    724626000*cum[3]^2*cum[6]*cum[8] + 837043200*cum[2]*cum[4]*cum[6]*cum[8] + 56958300*cum[6]^2*cum[8] + $
    416404800*cum[2]*cum[3]*cum[7]*cum[8] + 96238800*cum[5]*cum[7]*cum[8] + $
    26057700*cum[2]^2*cum[8]^2 + 28451250*cum[4]*cum[8]^2 + $
    190512000*cum[2]^4*cum[3]*cum[9] + 698544000*cum[2]*cum[3]^3*cum[9] + $
    1206576000*cum[2]^2*cum[3]*cum[4]*cum[9] + $
    647892000*cum[3]*cum[4]^2*cum[9] + 169344000*cum[2]^3*cum[5]*cum[9] + $
    474012000*cum[3]^2*cum[5]*cum[9] + 547344000*cum[2]*cum[4]*cum[5]*cum[9] + $
    322056000*cum[2]*cum[3]*cum[6]*cum[9] + 74340000*cum[5]*cum[6]*cum[9] + $
    46267200*cum[2]^2*cum[7]*cum[9] + 50500800*cum[4]*cum[7]*cum[9] + $
    21870000*cum[3]*cum[8]*cum[9] + 2430900*cum[2]*cum[9]^2 + $
    7620480*cum[2]^5*cum[10] + 209563200*cum[2]^2*cum[3]^2*cum[10] + $
    80438400*cum[2]^3*cum[4]*cum[10] + 224532000*cum[3]^2*cum[4]*cum[10] + $
    129578400*cum[2]*cum[4]^2*cum[10] + $
    189604800*cum[2]*cum[3]*cum[5]*cum[10] + 21829500*cum[5]^2*cum[10] + $
    32205600*cum[2]^2*cum[6]*cum[10] + 35103600*cum[4]*cum[6]*cum[10] + $
    17463600*cum[3]*cum[7]*cum[10] + 4374000*cum[2]*cum[8]*cum[10] + $
    92377*cum[10]^2 + 25401600*cum[2]^3*cum[3]*cum[11] + $
    23587200*cum[3]^3*cum[11] + 81648000*cum[2]*cum[3]*cum[4]*cum[11] + $
    17236800*cum[2]^2*cum[5]*cum[11] + 18748800*cum[4]*cum[5]*cum[11] + $
    11037600*cum[3]*cum[6]*cum[11] + 3175200*cum[2]*cum[7]*cum[11] + $
    167940*cum[9]*cum[11] + 1058400*cum[2]^4*cum[12] + $
    11793600*cum[2]*cum[3]^2*cum[12] + 6804000*cum[2]^2*cum[4]*cum[12] + $
    3691800*cum[4]^2*cum[12] + 5405400*cum[3]*cum[5]*cum[12] + $
    1839600*cum[2]*cum[6]*cum[12] + 125880*cum[8]*cum[12] + $
    1814400*cum[2]^2*cum[3]*cum[13] + 1965600*cum[3]*cum[4]*cum[13] + $
    831600*cum[2]*cum[5]*cum[13] + 77280*cum[7]*cum[13] + $
    86400*cum[2]^3*cum[14] + 243000*cum[3]^2*cum[14] + $
    280800*cum[2]*cum[4]*cum[14] + 38340*cum[6]*cum[14] + $
    64800*cum[2]*cum[3]*cum[15] + 15000*cum[5]*cum[15] + $
    4050*cum[2]^2*cum[16] + 4425*cum[4]*cum[16] + 900*cum[3]*cum[17] + $
    100*cum[2]*cum[18] + cum[20]]

VarCum=var_Cum

end