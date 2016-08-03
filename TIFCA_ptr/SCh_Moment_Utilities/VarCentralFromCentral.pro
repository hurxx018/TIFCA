pro VarCentralFromCentral,C, VarC

;+
; NAME:
;       VarCentralFromCentral
;
; PURPOSE:
;		Determine variance of central population moments (for large sample sizes: n->Infinity),
;		use sample moments
;		NOTE: calculated variance is variance times n
;		Thus, TrueVariance = 1/n Var[mu_r]
;		Var[mu_r]
;
; CATEGORY:
;       MomentUtil
;
; CALLING SEQUENCE:
;       VarCentralFromCentral, C, VarC
;
; INPUTS:
;       C: [Vector, 0..r] contains central moments [0, mu_1, mu_2, ...]
;
; KEYWORD INPUTS:
;
;
; OUTPUTS:
;       VarC: [Vector,0..r/2] contains variance of central moments [0, Var[mu_1], Var[mu_2], ...]
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
;		requires input of central moments, 0th element is simply a dummy and not used
;
; EXAMPLE:
;		VarCentralFromCentral,[0,1,2,3,4]*1d,VarC
;		> print,VarC
;    0.00000000       1.0000000      -4.0000000
;
; PROCEDURE:
;		from Kendall and Stuart Vol.1 4th edition "Advanced theory of statistics"
;		p245, Eq(10.9). See also Excercise 10.13
;
;		Algorithm: from Mathematica (see VarCentralFromCentral.nb)
;		calculate Varaiance of central moments using h-statistics
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






nmax=(n_elements(c)-1)/2
VarC=dblarr(nmax+1)

for r=1,nmax do varc[r]=(c[2*r]-c[r]^2+r*r*c[2]*c[r-1]^2-2*r*c[r-1]*c[r+1])

end