pro VarRawFromRaw,Raw, VarRaw

;+
; NAME:
;       VarRawFromRaw
;
; PURPOSE:
;		Determine variance of raw population moments (for large sample sizes: n->Infinity),
;		use sample moments
;		NOTE: calculated variance is variance times n
;		Thus, TrueVariance = 1/n Var[mu'_r]
;		Var[mu'_r]
;
; CATEGORY:
;       MomentUtil
;
; CALLING SEQUENCE:
;       VarRawFromRaw, Raw, VarRaw
;
; INPUTS:
;       Raw: [Vector, 0..r] contains raw moments [0, mu'_1, mu'_2, ...]
;
; KEYWORD INPUTS:
;
;
; OUTPUTS:
;       VarRaw: [Vector,0..r/2] contains variance of central moments [0, Var[mu'_1], Var[mu'_2], ...]
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
;		requires input of raw moments, 0th element is simply a dummy and not used
;
; EXAMPLE:
;		VarRawFromRaw,[0,1,3,3,4]*1d,VarRaw
;		> print,VarRaw
;    0.00000000       2.0000000      -5.0000000
;
; PROCEDURE:
;		from Kendall and Stuart Vol.1 4th edition "Advanced theory of statistics"
;		p244, Eq(10.5).
;
;		Algorithm: from Mathematica (see VarRawFromRaw.nb)
;		calculate Variance from PowerSums
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



nmax=(n_elements(raw)-1)/2
VarRaw=dblarr(nmax+1)
for r=1,nmax do VarRaw[r]=(raw[2*r]-raw[r]^2)

end