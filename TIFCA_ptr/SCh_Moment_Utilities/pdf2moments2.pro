pro pdf2moments2,pdf,mom,rel_err

;+
; NAME:
;       PDF2Moments2
;
; PURPOSE:
;		Calculate various moments, their variance and the relative error
;		from a given probability distribution function.
;
; CATEGORY:
;       MomentUtil
;
; CALLING SEQUENCE:
;       pdf2Moments2,pdf,mom,rel_err
;
; INPUTS:
;       pdf: [Vector] contains the discrete prob. distr. function (normalized)
;
; KEYWORD INPUTS:
;
;
; OUTPUTS:
;       mom: [Structure] contains the expectation values and their variances
;			{mom-
;				{E							Expectation of
;					-raw					mu'_r:		raw moment
;					-raw2					mu'_r:		raw moment
;					-central				mu_r:		central moment
;					-factorial				mu[r]:		factorial moment
;					-cumulant				kappa_r:	cumulant
;					-factorialcumulant		kappa[r]:	factorial cumulant
;				}
;				{Var						Variance of
;					-raw					mu'_r:		raw moment
;					-raw2					mu'_r:		raw moment (calculated by a different method)
;					-central				mu_r:		central moment
;					-factorial				mu[r]:		factorial moment
;					-cumulant				kappa_r:	cumulant
;					-factorialcumulant		kappa[r]:	factorial cumulant
;					}
;				}
;
;		rel_err: [Vector] contains the relative uncertainty of
;						factorial cumulants [kappa[1], ..., kappa[10]]
;				=SQRT( VAR(kappa[r]) / E[kappa[r]] )
;				(statistics is based on a single data point)
;
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
;			program calculates the moments only up to r:
;				raw moments: 		raw[r]			r=[0..20]
;				central moments: 	central[r]		r=[0..20]
;				cumulants: 			cumulants[r]	r=[0..10]
;				factorial moments	fraw[r]			r=[0..10]
;				factorial cumulants	fcumulants[r]	r=[0..10]
;			NOTE: 0th element is simply a dummy and not used
;
; EXAMPLE:
;		@initpch
;		loadgl
;		pdf=pch(4d,0.1d,nkmax=120)
;		pdf2Moments2,pdf,mom,rel_err
;		print,rel_err
;	0.57095636       6.4570427       38.034566       225.25349       1445.4014
;    10125.984       77019.036       631884.26       5624521.8       51138993.
;
;
;
;		pdf=pch1d(4d,0.1d,nkmax=35)
;		model2moments2,4d,0.1d,fcum,varfcum,relerr
;		pdf2moments2,pdf,mom,relerr
;		plot_io,fcum[1:*]
;		oplot,mom.E.factorialcumulant[1:*],color=255,psym=4
;
;	Calculate pdf for a single species (eps=4 and N=0.1)
;	determine the moments theoretically using model2moments2.pro
;	use this program to determine the moments of the pdf
;	plot the theoretically determined fac cumulants and oplot the pdf determined ones
;
;	BEWARE of numerical instabilities for the higher cumulants !!!
;
;
;
; PROCEDURE:
;		see moment programs and their description.
;		NOTE: the variance is calculated for n (number of sample points) -> Infinity,
;			but expressed for n=1.
;			Thus, to get the real variance for n data points: Var -> Var/n
;
;
; REFERENCE:
;
; MODIFICATION HISTORY:
;       Written by JM: sometime in 2002
;       Modified:
;
; TODO:
;
;-


maxr=20	;calculate moments up to maxr order: <x^maxr>
p=pdf
pinfo=size(p)
if pinfo[0] ne 1 then begin
 stop; not a vector
endif
nx=pinfo[1]
xvec=dindgen(nx)

nr=maxr


ones_r=dblarr(nr+1)+1
vec_r=dindgen(nr+1)
ones_x=dblarr(nx)+1

;calculate raw moments <x^r> up to maxr
temp=(xvec#ones_r)^ (ones_x # vec_r)
raw=reform(p#temp)

;now calculate central moments from pdf <(k-<k>)^r>
dxvec=xvec-raw[1]
temp=(dxvec#ones_r)^ (ones_x # vec_r)
central=reform(p#temp)
c=central
MapCentral2Cumulant,central,raw,Cumulant
MapRaw2FRaw,raw,fraw
MapCum2FCum,Cumulant,FCumulant


;Moments of Moments and standard error (see Kendall and Stuart, Volume 1 (4th Edn), p244ff)
VarCentralFromCentral,Central,var_central
VarRawFromRaw,Raw,var_raw

var_raw2=dblarr(nr/2+1)
;variance around the random variable y=x-<x>
for r=1,10 do var_raw2[r]=central[2*r]-central[r]^2

VarCumFromCum,Cumulant,var_cumulant
VarFCumFromCum,Cumulant,var_Fcumulant

Emom={EStructure,raw:raw, raw2:raw, central:central, factorial:fraw, cumulant:cumulant, factorialcumulant:fcumulant}
Varmom={VarStructure,raw:var_raw, raw2:var_raw2, central:var_central, cumulant:var_cumulant, $
		factorialcumulant:var_fcumulant}
mom={momstructure,E:Emom,Var:Varmom}

rel_err=sqrt(mom.Var.factorialcumulant[1:10])/mom.E.factorialcumulant[1:10]

;stop
end