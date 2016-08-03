pro MapCum2Central,Cum, C

;+
; NAME:
;       MapCum2Central
;
; PURPOSE:
;		Transform Cumulants --> central moments
;
;		kappa_r	-->	mu_r
;
; CATEGORY:
;       MomentUtil
;
; CALLING SEQUENCE:
;       MapCum2Central, Cum, C
;
; INPUTS:
;       Cum: [Vector, 0..10] contains cumulants [0, kappa_1, kappa_2, ...]
;
; KEYWORD INPUTS:
;
;
; OUTPUTS:
;       C: [Vector,0..10] contains the calculated central moments [0, mu_1, mu_2, ...]
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
;		requires input of first 10 fact. cumulants, 0th element is simply a dummy and not used
;
; EXAMPLE:
;		mapCum2Central,[0,1,2,3,4,5,6,7,8,9,10]*1d,c
;		> print,c
;    0.00000000      0.00000000       2.0000000       3.0000000       16.000000       65.000000
;     336.00000       1897.0000       11824.000       80145.000       586000.00
;
; PROCEDURE:
;		Algorithm: from Mathematica (see MapCum2Central.nb)
;		calculate factorial moments in terms on raw moments
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

nC=n_elements(Cum)
c=dblarr(nC)

c=[0, 0, cum[2], cum[3], 3*cum[2]^2 + cum[4], 10*cum[2]*cum[3] + cum[5], $
  15*cum[2]^3 + 10*cum[3]^2 + 15*cum[2]*cum[4] + cum[6], $
  105*cum[2]^2*cum[3] + 35*cum[3]*cum[4] + 21*cum[2]*cum[5] + cum[7], $
  105*cum[2]^4 + 280*cum[2]*cum[3]^2 + 210*cum[2]^2*cum[4] + 35*cum[4]^2 + $
    56*cum[3]*cum[5] + 28*cum[2]*cum[6] + cum[8], $
  1260*cum[2]^3*cum[3] + 280*cum[3]^3 + 1260*cum[2]*cum[3]*cum[4] + $
    378*cum[2]^2*cum[5] + 126*cum[4]*cum[5] + 84*cum[3]*cum[6] + $
    36*cum[2]*cum[7] + cum[9], $
  945*cum[2]^5 + 6300*cum[2]^2*cum[3]^2 + 3150*cum[2]^3*cum[4] + $
    2100*cum[3]^2*cum[4] + 1575*cum[2]*cum[4]^2 + 2520*cum[2]*cum[3]*cum[5] + $
    126*cum[5]^2 + 630*cum[2]^2*cum[6] + 210*cum[4]*cum[6] + $
    120*cum[3]*cum[7] + 45*cum[2]*cum[8] + cum[10]]


end