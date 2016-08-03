pro MapFCum2Cum, FCum, Cum

;+
; NAME:
;       MapFCum2Cum
;
; PURPOSE:
;		Transform Factorial Cumulants --> Cumulants
;
;		kappa[r]	-->	kappa_r
;
; CATEGORY:
;       MomentUtil
;
; CALLING SEQUENCE:
;       MapFCum2Cum, FCum, Cum
;
; INPUTS:
;       FCum: [Vector, 0..20] contains fac. cumulants [0, kappa[1], kappa[2], ...]
;
; KEYWORD INPUTS:
;
;
; OUTPUTS:
;       Cum: [Vector,0..20] contains the calculated cumulants [0, kappa_1, kappa_2, ...]
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
;		requires input of first 20 cumulants, 0th element is simply a dummy and not used
;
; EXAMPLE:
;		mapFCum2Cum,[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]*1d,cum
;		> print,cum
;    0.00000000       1.0000000       3.0000000       10.000000       37.000000       151.00000
;     674.00000       3263.0000       17007.000       94828.000       562595.00       3535027.0
;      23430840.  1.6325489e+008  1.1920592e+009  9.0971836e+009  7.2384728e+010  5.9921194e+011
;5.1506654e+012  4.5891416e+013  4.2314566e+014
;
; PROCEDURE:
;		Algorithm: from Mathematica (see MapFCum2Cum.nb)
;		calculate factorial moments in terms on raw moments
;
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

nFCum=n_elements(FCum)
cum=dblarr(nFCum)

cum[1]=fcum[1]
cum[2]=fcum[1] + fcum[2]
cum[3]=fcum[1] + 3*fcum[2] + fcum[3]
cum[4]=fcum[1] + 7*fcum[2] + 6*fcum[3] + fcum[4]
cum[5]=fcum[1] + 15*fcum[2] + 25*fcum[3] + 10*fcum[4] + fcum[5]
cum[6]=fcum[1] + 31*fcum[2] + 90*fcum[3] + 65*fcum[4] + 15*fcum[5] + fcum[6]
cum[7]=fcum[1] + 63*fcum[2] + 301*fcum[3] + 350*fcum[4] + 140*fcum[5] + 21*fcum[6] + fcum[7]
cum[8]=fcum[1] + 127*fcum[2] + 966*fcum[3] + 1701*fcum[4] + 1050*fcum[5] +  266*fcum[6] + $
  28*fcum[7] + fcum[8]
cum[9]=fcum[1] + 255*fcum[2] + 3025*fcum[3] + 7770*fcum[4] + 6951*fcum[5] + 2646*fcum[6] + $
  462*fcum[7] + 36*fcum[8] + fcum[9]
cum[10]=fcum[1] + 511*fcum[2] + 9330*fcum[3] + 34105*fcum[4] + 42525*fcum[5] + $
  22827*fcum[6] + 5880*fcum[7] + 750*fcum[8] + 45*fcum[9] + fcum[10]
cum[11]=fcum[1] + 1023*fcum[2] + 28501*fcum[3] + 145750*fcum[4] + 246730*fcum[5] + 179487*fcum[6] + $
  63987*fcum[7] + 11880*fcum[8] + 1155*fcum[9] + 55*fcum[10] + fcum[11]

cum[12]=fcum[1] + 2047*fcum[2] + 86526*fcum[3] + 611501*fcum[4] + 1379400*fcum[5] + $
  1323652*fcum[6] + 627396*fcum[7] + 159027*fcum[8] + 22275*fcum[9] + $
  1705*fcum[10] + 66*fcum[11] + fcum[12]

cum[13]=fcum[1] + 4095*fcum[2] + 261625*fcum[3] + 2532530*fcum[4] + 7508501*fcum[5] + $
  9321312*fcum[6] + 5715424*fcum[7] + 1899612*fcum[8] + 359502*fcum[9] + $
  39325*fcum[10] + 2431*fcum[11] + 78*fcum[12] + fcum[13]

cum[14]=fcum[1] + 8191*fcum[2] + 788970*fcum[3] + 10391745*fcum[4] + $
  40075035*fcum[5] + 63436373*fcum[6] + 49329280*fcum[7] + 20912320*fcum[8] + $
  5135130*fcum[9] + 752752*fcum[10] + 66066*fcum[11] + 3367*fcum[12] + $
  91*fcum[13] + fcum[14]

cum[15]=fcum[1] + 16383*fcum[2] + 2375101*fcum[3] + 42355950*fcum[4] + $
  210766920*fcum[5] + 420693273*fcum[6] + 408741333*fcum[7] + $
  216627840*fcum[8] + 67128490*fcum[9] + 12662650*fcum[10] + $
  1479478*fcum[11] + 106470*fcum[12] + 4550*fcum[13] + 105*fcum[14] + fcum[15]

cum[16]=fcum[1] + 32767*fcum[2] + 7141686*fcum[3] + 171798901*fcum[4] + $
  1096190550*fcum[5] + 2734926558*fcum[6] + 3281882604*fcum[7] + $
  2141764053*fcum[8] + 820784250*fcum[9] + 193754990*fcum[10] + $
  28936908*fcum[11] + 2757118*fcum[12] + 165620*fcum[13] + 6020*fcum[14] + 120*fcum[15] + fcum[16]

cum[17]=fcum[1] + 65535*fcum[2] + 21457825*fcum[3] + 694337290*fcum[4] + $
  5652751651*fcum[5] + 17505749898*fcum[6] + 25708104786*fcum[7] + $
  20415995028*fcum[8] + 9528822303*fcum[9] + 2758334150*fcum[10] + $
  512060978*fcum[11] + 62022324*fcum[12] + 4910178*fcum[13] + $
  249900*fcum[14] + 7820*fcum[15] + 136*fcum[16] + fcum[17]

cum[18]=fcum[1] + 131071*fcum[2] + 64439010*fcum[3] + 2798806985*fcum[4] + $
  28958095545*fcum[5] + 110687251039*fcum[6] + 197462483400*fcum[7] + $
  189036065010*fcum[8] + 106175395755*fcum[9] + 37112163803*fcum[10] + $
  8391004908*fcum[11] + 1256328866*fcum[12] + 125854638*fcum[13] + $
  8408778*fcum[14] + 367200*fcum[15] + 9996*fcum[16] + 153*fcum[17] + fcum[18]

cum[19]=fcum[1] + 262143*fcum[2] + 193448101*fcum[3] + 11259666950*fcum[4] + $
  147589284710*fcum[5] + 693081601779*fcum[6] + 1492924634839*fcum[7] + $
  1709751003480*fcum[8] + 1144614626805*fcum[9] + 477297033785*fcum[10] + $
  129413217791*fcum[11] + 23466951300*fcum[12] + 2892439160*fcum[13] + $
  243577530*fcum[14] + 13916778*fcum[15] + 527136*fcum[16] + 12597*fcum[17] + $
  171*fcum[18] + fcum[19]

cum[20]=fcum[1] + 524287*fcum[2] + 580606446*fcum[3] + 45232115901*fcum[4] + $
  749206090500*fcum[5] + 4306078895384*fcum[6] + 11143554045652*fcum[7] + $
  15170932662679*fcum[8] + 12011282644725*fcum[9] + 5917584964655*fcum[10] + $
  1900842429486*fcum[11] + 411016633391*fcum[12] + 61068660380*fcum[13] + $
  6302524580*fcum[14] + 452329200*fcum[15] + 22350954*fcum[16] + $
  741285*fcum[17] + 15675*fcum[18] + 190*fcum[19] + fcum[20]


end