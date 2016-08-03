function fit_tifca_sch, rebinT, fc, varfc, para, fixed=fixed                $
                                               , nspecies=nspecies          $
                                               , order=order                $
                                               , error=error                $
                                               , errstr=errstr
; a fit on TIFCA for the single channel
; mpfitfun.pro is used
; 
; rebinT -> rebinnin time (us)
; fc -> factorial cumulants
; varfc -> variance of factorial cumulants
; para=[lambda1, td1, N1, lambda2, td2, N2, ......, r=w^2/wz^2, f, deadtime, Pa]     Pa=afterpulsing probability
; keywords set
; fixed -> condition for fixed parameters
; nspecies  -> the number of species
; order -> the order of factorial cumulants which are taken into account for fit

error='0' & errstr=''
if keyword_set(order) then ofc=order else ofc=4


fc=fc[0:ofc, *]          ;the factorial cumulants from the first to the fourth.
varfc=varfc[0:ofc, *]    ;the variances of the factorial cumulants

binT=rebinT

nb=n_elements(binT)
np=n_elements(para)

; an array of rebinT for using 'mpfitfun' 
arr_rebinT=dblarr(ofc+1, nb)
for i=1, ofc do arr_rebinT[i, *]=binT

nnfc = dblarr(ofc+1, nb)
nnvarfc = dblarr(ofc+1, nb) + 1.

nnfc[1:ofc, *] = fc[1:ofc, *]
nnvarfc[1:ofc, *] = varfc[1:ofc, *]

if (np-4)/3 ne nspecies then begin
  message, 'the numper of parameters is wrong for', nspecies
  return, 1
endif

if keyword_set(fixed) then begin
  fixp=fixed
endif else begin
  fixp=intarr(np)
endelse


;assign the condition on the parameters for the fitting
  pi=replicate({value:0.D, fixed:0, limited:[1,0],              $
                   limits:[0.D,0.D], parname:'',                $
                   step: 0D, mpside: 0D, mpminstep: 0D,         $
                   mpmaxstep: 0D, tied: ''}, np)
  for i=0, np-1 do begin   ;set the default value of parameter structure,
    pi[i].value=para[i]
    pi[i].fixed=fixp[i]
    pi[i].limited[0]=1  ; constraint the lower boundary of fit (fit result >= 0)
    pi[i].limits=[0.D, 1.0e10]
  endfor
  dof = nb*ofc - np + total(fixp)

fit_parameters=mpfitfun('fit_tifcamodel_sch', arr_rebinT, nnfc, sqrt(nnvarfc),    $
                        para, PARINFO=pi, BESTNORM=chi, /quiet, PERROR=perror,    $
                        YFIT=yfit, STATUS=status, Step=step, XTOL=1.0e-6)
chi2 = chi/dof
thefc= tifca_model_sch(binT, fit_parameters)
gf=calgammafactors(fit_parameters[np-3])

result={ID:'fitresult_of_tifca_sch', rebinT:binT, gf:gf, thefc:thefc, $
         fit_parameters:fit_parameters, chi:chi, chi2:chi2 }   ; data, theoretical values, fitparameters

return, ptr_new(result)

end