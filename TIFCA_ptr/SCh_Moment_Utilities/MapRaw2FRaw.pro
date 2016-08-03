pro MapRaw2FRaw,Raw, FRaw

;+
; NAME:
;       MapRaw2FRaw
;
; PURPOSE:
;		Transform RawMoments --> FactorialMoments
;
;		mu'_r	-->	mu'[r]
;
; CATEGORY:
;       MomentUtil
;
; CALLING SEQUENCE:
;       MapRaw2Fraw, raw, fraw
;
; INPUTS:
;       Raw: [Vector, 0..10] contains raw moments [0, mu'_1, mu'_2, ...]
;
; KEYWORD INPUTS:
;       None
;
; OUTPUTS:
;       FRaw: [Vector,0..10] contains the calculated factorial moments
;
; OPTIONAL OUTPUT PARAMETERS:
;     none
;
; RETURNS:
;		none
;
; SIDE EFFECTS:
;       None.
;
; COMMON BLOCKS:
;
;
; RESTRICTIONS:
;		requires input of first 10 raw moments, 0th element is simply a dummy and not used
;
; EXAMPLE:
;		mapRaw2Fraw,[0,1,2,3,4,5,6,7,8,9,10]*1d,fraw
;		print,fraw
;		> 0	 1	1	-1	 2	-6	24	-120   720	-5040	40320
;
; PROCEDURE: (see mapRaw2Fraw.nb)
;		Algorithm: from Mathematica
;		calculate factorial moments in terms on raw moments
;		Mathematica
;			<< mathStatica.m
;			res = FactorialToRaw[3] /. \[Mu]\&\[Prime]\_r_ -> raw[r];
;   		Format[res[[2]], InputForm]
;		end Mathematica
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

fraw=[0,raw[1], -raw[1] + raw[2], 2*raw[1] - 3*raw[2] + raw[3], $
  -6*raw[1] + 11*raw[2] - 6*raw[3] + raw[4], $
  24*raw[1] - 50*raw[2] + 35*raw[3] - 10*raw[4] + raw[5], -120*raw[1] + $
    274*raw[2] - 225*raw[3] + 85*raw[4] - 15*raw[5] + raw[6], $
  720*raw[1] - 1764*raw[2] + 1624*raw[3] - 735*raw[4] + 175*raw[5] - $
    21*raw[6] + raw[7], -5040*raw[1] + 13068*raw[2] - 13132*raw[3] + $
    6769*raw[4] - 1960*raw[5] + 322*raw[6] - 28*raw[7] + raw[8], $
  40320*raw[1] - 109584*raw[2] + 118124*raw[3] - 67284*raw[4] + $
    22449*raw[5] - 4536*raw[6] + 546*raw[7] - 36*raw[8] + $
    raw[9], -362880*raw[1] + 1026576*raw[2] - 1172700*raw[3] + $
    723680*raw[4] - 269325*raw[5] + 63273*raw[6] - 9450*raw[7] + 870*raw[8] - $
    45*raw[9] + raw[10]]

end