function plotfit_tifca_sch, schfcstr_ptr, fit_result_ptr

on_error, 2

if ~tag_exist( *schfcstr_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the sch TIFCA ID tag'
    return, error
endif else begin
    schfc_id = (*schfcstr_ptr).ID
    if ~strcmp(schfc_id, 'FCs_sch', 7) then begin
      print, 'Input does not include sch fcs.'
      return, 1
    endif
endelse

if ~tag_exist( *fit_result_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the sch tifca-fit ID tag'
    return, error
endif else begin
    fit_id = (*fit_result_ptr).ID
    if ~strcmp(fit_id, 'fitresult_of_tifca_sch',22) then begin
      print, 'Input does not include a fit result of sch tifca.'
      return, 1
    endif
endelse

fc = (*schfcstr_ptr).fc
varfc = (*schfcstr_ptr).varfc
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

;determine the range in y-axis
yr=dblarr(2, 5)
yr2=dblarr(2,5)
for j=1, 4 do begin
  yr[*, j] = max_min_forplot( [(fc[j, *]-sqrt(varfc[j, *]))/binT^(j-1) $
                              , (fc[j, *]+sqrt(varfc[j, *]))/binT^(j-1)$
                              , thefc[j, *]/binT^(j-1)])
  yr2[*, j] = max_min_forplot((fc[j, *]-thefc[j, *])/sqrt(varfc[j, *]) )
endfor

window, 0, xsize=800, ysize=640
!p.multi=[0, 2, 2]

for j=1, 4 do begin
plot, binT, fc[j, *]/binT^(j-1), title="  ", psym=5, /xlog $ 
       , thick=2.0, charsize=1.5, charthick=2.0  $
       , yrange=[yr[0, j], yr[1, j]], xmargin=[12,2], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
  errplot, binT, (fc[j, *]-sqrt(varfc[j, *]))/binT^(j-1), (fc[j, *]+sqrt(varfc[j, *]))/binT^(j-1) $
       , color=fsc_color("red"), thick=2.0
  oplot, binT, thefc[j, *]/binT^(j-1) $
       , thick = 2 $
       , color=fsc_color("blue")
        
endfor

!p.multi=0

window, 1, xsize=800, ysize=640
!p.multi=[0,2,2]
for j=1, 4 do begin
plot, binT, (fc[j, *]-thefc[j, *])/sqrt(varfc[j, *]), title="  ", psym=-symcat(5, color=fsc_color('blue'), thick=2), /xlog $ 
       , thick=2.0, charsize=1.5, charthick=2.0  $
       , yrange=[-4., 4], xmargin=[12,2], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
endfor
!p.multi=0
result = 1
return, result

end 