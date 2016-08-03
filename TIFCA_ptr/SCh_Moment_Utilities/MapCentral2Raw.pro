pro MapCentral2Raw,C,Cum, Raw

;+
; NAME:
;       MapCentral2Raw
;
; PURPOSE:
;		Transform central moments --> raw moments
;
;		mu_r	-->	mu`_r
;
; CATEGORY:
;       MomentUtil
;
; CALLING SEQUENCE:
;       MapCentral2Raw, C, Cum, Raw
;
; INPUTS:
;		C:	 [Vector, 0..10] contains central moments [0, mu_1, mu_2, ...]
;       Cum: [Vector, 0..10] contains cumulants [0, kappa_1, kappa_2, ...]
;
; KEYWORD INPUTS:
;
;
; OUTPUTS:
;       Raw: [Vector,0..10] contains the calculated raw moments [0, mu`_1, mu`_2, ...]
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
;		requires input of first 10 central moments, 0th element is simply a dummy and not used
;		1st cumulant needed (cum[1]) because it is the 1st raw moment
;
; EXAMPLE:
;		mapCentral2Raw,[0,1,2,3,4,5,6,7,8,9,10]*1d,[0,1,2,3,4,5,6,7,8,9,10], raw
;		> print,raw
;    0.00000000      0.00000000       2.0000000       3.0000000       16.000000       65.000000
;     336.00000       1897.0000       11824.000       80145.000       586000.00
;
; PROCEDURE:
;		Algorithm: from Mathematica (see MapCentral2Raw.nb)
;		calculate raw moments in terms of central moments
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

raw=[0, cum[1], c[2] + cum[1]^2, c[3] + 3*c[2]*cum[1] + cum[1]^3, $
  c[4] + 4*c[3]*cum[1] + 6*c[2]*cum[1]^2 + cum[1]^4, $
  c[5] + 5*c[4]*cum[1] + 10*c[3]*cum[1]^2 + 10*c[2]*cum[1]^3 + cum[1]^5, $
  c[6] + 6*c[5]*cum[1] + 15*c[4]*cum[1]^2 + 20*c[3]*cum[1]^3 + $
    15*c[2]*cum[1]^4 + cum[1]^6, $
  c[7] + 7*c[6]*cum[1] + 21*c[5]*cum[1]^2 + 35*c[4]*cum[1]^3 + $
    35*c[3]*cum[1]^4 + 21*c[2]*cum[1]^5 + cum[1]^7, $
  c[8] + 8*c[7]*cum[1] + 28*c[6]*cum[1]^2 + 56*c[5]*cum[1]^3 + $
    70*c[4]*cum[1]^4 + 56*c[3]*cum[1]^5 + 28*c[2]*cum[1]^6 + cum[1]^8, $
  c[9] + 9*c[8]*cum[1] + 36*c[7]*cum[1]^2 + 84*c[6]*cum[1]^3 + $
    126*c[5]*cum[1]^4 + 126*c[4]*cum[1]^5 + 84*c[3]*cum[1]^6 + $
    36*c[2]*cum[1]^7 + cum[1]^9, $
  c[10] + 10*c[9]*cum[1] + 45*c[8]*cum[1]^2 + 120*c[7]*cum[1]^3 + $
    210*c[6]*cum[1]^4 + 252*c[5]*cum[1]^5 + 210*c[4]*cum[1]^6 + $
    120*c[3]*cum[1]^7 + 45*c[2]*cum[1]^8 + cum[1]^10]

end