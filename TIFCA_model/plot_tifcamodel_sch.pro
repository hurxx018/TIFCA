function plot_tifcamodel_sch, thefcstr_ptr

on_error, 2

if ~tag_exist( *thefcstr_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the sch TIFCA ID tag'
    return, error
endif else begin
    schfc_id = (*thefcstr_ptr).ID
    if ~strcmp(schfc_id, 'tifca_model_sch', 15) then begin
      print, 'Input does not include sch fcs.'
      return, 1
    endif
endelse

thefc = (*thefcstr_ptr).thefc
thevarfc = (*thefcstr_ptr).thevarfc
binT = (*thefcstr_ptr).rebinT

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
for j=1, 4 do begin
  yr[*, j] = max_min_forplot( [(thefc[j, *]-sqrt(thevarfc[j, *]))/binT^(j-1) $
                             , (thefc[j, *]+sqrt(thevarfc[j, *]))/binT^(j-1)])
endfor

window, 0, xsize=800, ysize=640
!p.multi=[0, 2, 2]

for j=1, 4 do begin
plot, binT, thefc[j, *]/binT^(j-1), title="  ", psym=5, /xlog $ 
       , thick=2.0, charsize=1.5, charthick=2.0  $
       , yrange=[yr[0, j], yr[1, j]], xmargin=[12,2], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0       
  errplot, binT, (thefc[j, *]-sqrt(thevarfc[j, *]))/binT^(j-1), (thefc[j, *]+sqrt(thevarfc[j, *]))/binT^(j-1) $
       , color=fsc_color("red"), thick=2.0

endfor

!p.multi=0

result = 1
return, result

end 