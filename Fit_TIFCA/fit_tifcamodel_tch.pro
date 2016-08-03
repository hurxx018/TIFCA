function fit_tifcamodel_tch, arr_rebinT, para
; This code is written for employing 'mpfitfun'
; The fc's order used in the fit is determined by the dimension of arr_rebinT
; 

info = size(arr_rebinT)
if (info[0] ne 4) then begin
    message, 'arr_rebinT is not given properly for the fit.'
    return, 1
endif

order = info[1] -1
nb = info[4]

binT = arr_rebinT[1, 0, 0, *]
result = dblarr(order+1, order+1, order+1, nb) 

fc = tifca_model_tch(binT, para)

oi3d_ptr = orderindexftn_ptr(3)

;choose factorial cumulants which are necessary for the fit taking the order into account
for k=1, order do begin
  oi = *oi3d_ptr[k]
  info = size(oi)
  yrr = dblarr(2, info[2])
  for i=0, info[2]-1 do begin
      xx= oi[0, i]
      yy= oi[1, i]
      zz= oi[2, i]
      result[xx, yy, zz, *] = fc[xx, yy, zz, *]          ;the factorial cumulants from the first to the orderth.
  endfor
endfor

return, result

end