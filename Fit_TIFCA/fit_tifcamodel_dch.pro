function fit_tifcamodel_dch, arr_rebinT, para
; This code is written for employing 'mpfitfun'
; The fc's order used in the fit is determined by the dimension of arr_rebinT
; 

info = size(arr_rebinT)
if (info[0] ne 3) then begin
    message, 'arr_rebinT is not given properly for the fit.'
    return, 1
endif

order = info[1] -1
nb = info[3]

binT = arr_rebinT[1, 0, *]
result = dblarr(order+1, order+1, nb) 

fc = tifca_model_dch(binT, para)

oi2d_ptr = orderindexftn_ptr(2)

;choose factorial cumulants which are necessary for the fit taking the order into account
for k=1, order do begin
  oi = *oi2d_ptr[k]
  info = size(oi)
  for i=0, info[2]-1 do begin
      xx= oi[0, i]
      yy= oi[1, i]
      result[xx, yy, *] = fc[xx, yy, *]          ;the factorial cumulants from the first to the orderth.
  endfor
endfor

return, result

end