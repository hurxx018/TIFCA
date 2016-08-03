function fit_tifcamodel_sch, arr_rebinT, para
; This code is written for employing 'mpfitfun'
; The fc's order used in the fit is determined by the dimension of arr_rebinT
; 

info = size(arr_rebinT)
if (info[0] ne 2) then begin
    message, 'arr_rebinT is not given properly for the fit.'
    return, 1
endif

order = info[1] -1
nb = info[2]

binT = arr_rebinT[1, *]
result = dblarr(order+1, nb) 

fc = tifca_model_sch(binT, para)
result[0:order, *] = fc[0:order, *]

return, result

end