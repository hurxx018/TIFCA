function splotfit_tifca_tch, tchfcstr_ptr, fit_result_ptr

on_error, 2
result = 0

if ~tag_exist( *tchfcstr_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the tch TIFCA ID tag'
    return, error
endif else begin
    tchfc_id = (*tchfcstr_ptr).ID
    if ~strcmp(tchfc_id, 'FCs_tch', 7) then begin
      print, 'Input does not include tch fcs.'
      return, 1
    endif
endelse

if ~tag_exist( *fit_result_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the tch tifca-fit ID tag'
    return, error
endif else begin
    fit_id = (*fit_result_ptr).ID
    if ~strcmp(fit_id, 'fitresult_of_tifca_tch',22) then begin
      print, 'Input does not include a fit result of tch tifca.'
      return, 1
    endif
endelse

fc = (*tchfcstr_ptr).fc
varfc = (*tchfcstr_ptr).varfc
thefc = (*fit_result_ptr).thefc
binT = (*fit_result_ptr).rebinT

xti = 'T(!4l!3s)'

;determine y-titles.
yti = strarr(10)
yti[1] = '!4j!3!D[1]!N'
yti[2] = '!4j!3!D[2]!N/T'
yti[3] = '!4j!3!D[2]!N/T'
yti[4] = '!4j!3!D[3]!N/T!U2!N'
yti[5] = '!4j!3!D[3]!N/T!U2!N'
yti[6] = '!4j!3!D[4]!N/T!U3!N'
yti[7] = '!4j!3!D[4]!N/T!U3!N'
yti[8] = '!4j!3!D[4]!N/T!U3!N'
yti[9] = '!4j!3!D[4]!N/T!U3!N'

oi3d_ptr = orderindexftn_ptr(3, /split)
ci3d_ptr = colorindexftn_ptr(3, /split)
pi3d_ptr = psymindexftn_ptr(3, /split)

;determin the range in x-axis
xr = max_min_forplot(binT)

;determine the range in y-axis
yr=dblarr(2, 10)
yr2=dblarr(2, 10)
for k=1, 9 do begin
  oi=*oi3d_ptr[k]
  info = size(oi)
  yrr = dblarr(2, info[2])
  yrr2 = dblarr(2, info[2])
  case k of
   1: q=1
   2: q=2  
   3: q=2  
   4: q=3  
   5: q=3  
   6: q=4  
   7: q=4  
   8: q=4  
   9: q=4  
  endcase
  for i=0, info[2]-1 do begin
      xx= oi[0, i]
      yy= oi[1, i]
      zz= oi[2, i]
      yrr[*, i] = max_min_forplot( [(fc[xx, yy, zz, *]-sqrt(varfc[xx, yy, zz, *]))/binT^(q-1.) $
                                 , (fc[xx, yy, zz, *]+sqrt(varfc[xx, yy, zz, *]))/binT^(q-1.) $
                                 , thefc[xx, yy, zz, *]/binT^(q-1.)])
      yrr2[*, i] = max_min_forplot((fc[xx, yy, zz, *]-thefc[xx, yy, zz, *])/sqrt(varfc[xx, yy, zz, *]))                                                      
  endfor
  yr[*, k] = max_min_forplot(yrr)
  yr2[*, k] = max_min_forplot(yrr2) 
endfor

window, 1, xsize=1200, ysize=750
!p.multi=[0, 3, 3]

for j=1, 9 do begin
  oi = *oi3d_ptr[j]
  ci = *ci3d_ptr[j]
  pi = *pi3d_ptr[j]
  info = size(oi)
  xx = oi[0, 0]
  yy = oi[1, 0]
  zz = oi[2, 0]
  case j of
  1: q=1
  2: q=2  
  3: q=2  
  4: q=3  
  5: q=3  
  6: q=4  
  7: q=4  
  8: q=4  
  9: q=4  
  endcase
  plot, binT, fc[xx, yy, zz, *]/binT^(q-1.), title="  ", psym=symcat(pi[0], color=fsc_color(ci[0]), thick=2) $
       , /xlog $ 
       , thick=2, charsize=2.2, charthick=2  $
       , xrange=[xr[0], xr[1]], yrange=[yr[0, j], yr[1, j]], xstyle=1, ystyle=1 $
       , xmargin=[13, 2], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
  errplot, binT, (fc[xx, yy, zz, *]-sqrt(varfc[xx, yy, zz, *]))/binT^(q-1.), (fc[xx, yy, zz, *]+sqrt(varfc[xx, yy, zz, *]))/binT^(q-1.) $
       , color=fsc_color("red"), thick=2.0
  oplot, binT, thefc[xx, yy, zz, *]/binT^(q-1.) $
       , thick = 2 $
       , color=fsc_color("black")
  for l=1, info[2]-1 do begin
      xx=oi[0,l]
      yy=oi[1,l]
      zz=oi[2,l]
      oplot, binT, fc[xx, yy, zz, *]/binT^(q-1.), psym=symcat(pi[l], color=fsc_color(ci[l]), thick=2) $
        , thick=2.      
      errplot, binT, (fc[xx, yy, zz, *]-sqrt(varfc[xx, yy, zz, *]))/binT^(q-1.), (fc[xx, yy, zz, *]+sqrt(varfc[xx, yy, zz, *]))/binT^(q-1.) $
       , color=fsc_color("red"), thick=2.0 
      oplot, binT, thefc[xx, yy, zz, *]/binT^(q-1.) $
       , thick = 2 $
       , color=fsc_color("black")
  endfor     
endfor

!p.multi=0

;residuals
window, 2, xsize=1200, ysize=750
!p.multi=[0, 3, 3]

for j=1, 9 do begin
  oi = *oi3d_ptr[j]
  ci = *ci3d_ptr[j]
  pi = *pi3d_ptr[j]
  info = size(oi)
  xx = oi[0, 0]
  yy = oi[1, 0]
  zz = oi[2, 0]
  case j of
  1: q=1
  2: q=2  
  3: q=2  
  4: q=3  
  5: q=3  
  6: q=4  
  7: q=4  
  8: q=4  
  9: q=4  
  endcase
  plot, binT, (fc[xx, yy, zz, *]-thefc[xx, yy, zz, *])/sqrt(varfc[xx, yy, zz, *]), title="  ", psym=-symcat(pi[0], color=fsc_color(ci[0]), thick=2) $
       , /xlog $ 
       , thick=2, charsize=2.2, charthick=2  $
       , xrange=[xr[0], xr[1]] , yrange=[yr2[0, j], yr2[1, j]], xstyle=1, ystyle=1 $
       , xmargin=[13, 2], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
  for l=1, info[2]-1 do begin
      xx=oi[0,l]
      yy=oi[1,l]
      zz=oi[2,l]
      oplot, binT, (fc[xx, yy, zz, *]-thefc[xx, yy, zz, *])/sqrt(varfc[xx, yy, zz, *]), psym=-symcat(pi[l], color=fsc_color(ci[l]), thick=2) $
        , thick=2.      
  endfor     
endfor

!p.multi=0
result = 1
return, result

end