function plotfit_tifca_dch, dchfcstr_ptr, fit_result_ptr

on_error, 2

if ~tag_exist( *dchfcstr_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the dch TIFCA ID tag'
    return, error
endif else begin
    dchfc_id = (*dchfcstr_ptr).ID
    if ~strcmp(dchfc_id, 'FCs_dch', 7) then begin
      print, 'Input does not include dch fcs.'
      return, 1
    endif
endelse

if ~tag_exist( *fit_result_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the dch tifca-fit ID tag'
    return, error
endif else begin
    fit_id = (*fit_result_ptr).ID
    if ~strcmp(fit_id, 'fitresult_of_tifca_dch',22) then begin
      print, 'Input does not include a fit result of dch tifca.'
      return, 1
    endif
endelse

fc = (*dchfcstr_ptr).fc
varfc = (*dchfcstr_ptr).varfc
thefc = (*fit_result_ptr).thefc
binT = (*fit_result_ptr).rebinT

;freq = frequency*1.d  ; unit -> kHz
;if keyword_set(msecond) then begin
;    binT = bfs/freq ; unit -> ms
;    xti = 'T(ms)'
;endif else begin
;    binT = 1000*bfs/freq ; unit -> us
    xti = 'T(!4l!3s)'
;endelse

;determine y-titles.
yti = strarr(5)
yti[1] = '!4j!D[1]!N'
yti[2] = '!4j!3!D[2]!N/T'
yti[3] = '!4j!3!D[3]!N/T!U2!N'
yti[4] = '!4j!3!D[4]!N/T!U3!N'

oi2d_ptr = orderindexftn_ptr(2)
ci2d_ptr = colorindexftn_ptr(2)
pi2d_ptr = psymindexftn_ptr(2)

;determin the range in x-axis
xr = max_min_forplot(binT)

;determine the range in y-axis
yr=dblarr(2, 5)
yr2=dblarr(2, 5)
for k=1, 4 do begin
  oi=*oi2d_ptr[k]
  info = size(oi)
  yrr = dblarr(2, info[2])
  yrr2 = dblarr(2, info[2])
  for i=0, info[2]-1 do begin
      xx= oi[0, i]
      yy= oi[1, i]
      yrr[*, i] = max_min_forplot( [(fc[xx, yy, *]-sqrt(varfc[xx, yy, *]))/binT^(k-1) $
                                 , (fc[xx, yy, *]+sqrt(varfc[xx, yy, *]))/binT^(k-1) $
                                 , thefc[xx, yy, *]/binT^(k-1)])
      yrr2[*, i] = max_min_forplot((fc[xx, yy, *]-thefc[xx, yy, *])/sqrt(varfc[xx, yy, *]) )
  endfor
  yr[*, k] = max_min_forplot(yrr)
  yr2[*, k] = max_min_forplot(yrr2) 
endfor

window, 0, xsize=800, ysize=640
!p.multi=[0, 2, 2]

for j=1, 4 do begin
  oi = *oi2d_ptr[j]
  ci = *ci2d_ptr[j]
  pi = *pi2d_ptr[j]
  info = size(oi)
  xx = oi[0, 0]
  yy = oi[1, 0]
  plot, binT, fc[xx, yy, *]/binT^(j-1), title="  ", psym=symcat(pi[0], color=fsc_color(ci[0])), /xlog $ 
       , thick=2.0, charsize=1.5, charthick=2.0  $
       , xrange=[xr[0], xr[1]], yrange=[yr[0, j], yr[1, j]], xstyle=1, ystyle=1 $
       , xmargin=[13,3], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
  errplot, binT, (fc[xx, yy, *]-sqrt(varfc[xx, yy, *]))/binT^(j-1), (fc[xx, yy, *]+sqrt(varfc[xx, yy, *]))/binT^(j-1) $
       , color=fsc_color("red"), thick=2.0
  oplot, binT, thefc[xx, yy, *]/binT^(j-1) $
       , thick = 2 $
       , color=fsc_color("black")
  for l=1, info[2]-1 do begin
      xx=oi[0,l]
      yy=oi[1,l]
      oplot, binT, fc[xx, yy, *]/binT^(j-1), psym=symcat(pi[l], color=fsc_color(ci[l]))
      
      errplot, binT, (fc[xx, yy, *]-sqrt(varfc[xx, yy, *]))/binT^(j-1), (fc[xx, yy, *]+sqrt(varfc[xx, yy, *]))/binT^(j-1) $
       , color=fsc_color("red"), thick=2.0 
      oplot, binT, thefc[xx, yy, *]/binT^(j-1) $
       , thick = 2 $
       , color=fsc_color("black")
  endfor     
        
endfor

!p.multi=0

window, 1, xsize=800, ysize=640
!p.multi=[0, 2, 2]

for j=1, 4 do begin
  oi = *oi2d_ptr[j]
  ci = *ci2d_ptr[j]
  pi = *pi2d_ptr[j]
  info = size(oi)
  xx = oi[0, 0]
  yy = oi[1, 0]
  plot, binT, (fc[xx, yy, *]-thefc[xx, yy, *])/sqrt(varfc[xx, yy, *]), title="  ", psym=-symcat(pi[0], color=fsc_color(ci[0])), /xlog $ 
       , thick=2.0, charsize=1.5, charthick=2.0  $
       , xrange=[xr[0], xr[1]], yrange=[yr2[0, j], yr2[1, j]], xstyle=1, ystyle=1 $
       , xmargin=[13,3], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
  for l=1, info[2]-1 do begin
      xx=oi[0,l]
      yy=oi[1,l]
      oplot, binT, (fc[xx, yy, *]-thefc[xx, yy, *])/sqrt(varfc[xx, yy, *]), psym=-symcat(pi[l], color=fsc_color(ci[l]))
  endfor
endfor
!p.multi=0

result = 1
return, result

end 