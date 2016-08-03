function fit_tifca_tch, rebinT, fc, varfc, para, fixed=fixed, nspecies=nspecies, order=order
; a fit on TIFCA for the triple channel
; mpfitfun.pro is used
; 
; rebinT -> rebinnin time (us)
; fc -> factorial cumulants
; varfc -> variance of factorial cumulants
; para=[          lambda1, td1, N1, lambda2, td2, N2, ......, r=w^2/wz^2, f, deadtime, Pa]     Pa=afterpulsing probability
; 
; 
; keyword set
; fixed -> condition for fixed parameters
; nspecies  -> the number of species
; order -> the order of factorial cumulants which are taken into account for fit


if keyword_set(order) then begin
   ofc=order
endif else begin
   ofc=4
endelse

binT = rebinT
nb = n_elements(binT)
np = n_elements(para)

oi3d_ptr = orderindexftn_ptr(3)

nnfc = dblarr(ofc+1, ofc+1, ofc+1, nb)
nnvarfc = dblarr(ofc+1, ofc+1, ofc+1, nb) + 1.
arr_rebinT = dblarr(ofc+1, ofc+1, ofc+1, nb)
;choose factorial cumulants which are necessary for the fit taking the order into account
for k=1, ofc do begin
  oi = *oi3d_ptr[k]
  info = size(oi)
  for i=0, info[2]-1 do begin
      xx= oi[0, i]
      yy= oi[1, i]
      zz= oi[2, i]
      arr_rebinT[xx, yy, zz, *] = binT                 ; an array of rebinT for using 'mpfitfun' 
      nnfc[xx, yy, zz, *] = fc[xx, yy, zz, *]          ;the factorial cumulants from the first .
      nnvarfc[xx, yy, zz, *] = varfc[xx, yy, zz, *]    ;the variances of the factorial cumulants
  endfor
endfor

if keyword_set(nspecies) then begin
    if (np-8)/5 ne nspecies then begin
      message, 'the numper of parameters is wrong for', nspecies
      return, 1
    endif
endif

;assign the condition on the parameters for the fitting
    pi=replicate({fixed:0,limited:[0,0],limits:[0.D,0.D]},np)
    pi[*].limited[0] = 1
    ind = where(arr_rebinT ne 0., count)
    dof = count - np

    if keyword_set(fixed) then begin
       for i=0, np-1 do begin
           pi[i].fixed=fixed[i]
       endfor
       dof = count - np + total(fixed)
    endif 

fit_parameters=mpfitfun('fit_tifcamodel_tch', arr_rebinT, nnfc, sqrt(nnvarfc), para, PARINFO=pi, BESTNORM=chi, /quiet)                        
chi2 = chi/dof
thefc= tifca_model_tch(binT, fit_parameters)
gf=calgammafactors(fit_parameters[np-7])

result={ID:'fitresult_of_tifca_tch', rebinT:binT, gf:gf, thefc:thefc, $
         fit_parameters:fit_parameters, chi:chi, chi2:chi2 }   ; data, theoretical values, fitparameters

return, ptr_new(result)

end