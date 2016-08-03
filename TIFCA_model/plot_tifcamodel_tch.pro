function plot_tifcamodel_tch, thefcstr_ptr

on_error, 2

if ~tag_exist( *thefcstr_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the tch TIFCA ID tag'
    return, error
endif else begin
    tchfc_id = (*thefcstr_ptr).ID
    if ~strcmp(tchfc_id, 'tifca_model_tch', 15) then begin
      print, 'Input does not include tch fcs.'
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

oi3d_ptr = orderindexftn_ptr(3)
ci3d_ptr = colorindexftn_ptr(3)
pi3d_ptr = psymindexftn_ptr(3)

;determin the range in x-axis
xr = max_min_forplot(binT)

;determine the range in y-axis
yr=dblarr(2, 5)
for k=1, 4 do begin
  oi=*oi3d_ptr[k]
  info = size(oi)
  yrr = dblarr(2, info[2])
  for i=0, info[2]-1 do begin
      xx= oi[0, i]
      yy= oi[1, i]
      zz= oi[2, i]
      yrr[*, i] = max_min_forplot( [(thefc[xx, yy, zz, *]-sqrt(thevarfc[xx, yy, zz, *]))/binT^(k-1) $
                                 , (thefc[xx, yy, zz, *]+sqrt(thevarfc[xx, yy, zz, *]))/binT^(k-1)])
  endfor
  yr[*, k] = max_min_forplot(yrr) 
endfor

window, 0, xsize=800, ysize=640
!p.multi=[0, 2, 2]

for j=1, 4 do begin
  oi = *oi3d_ptr[j]
  ci = *ci3d_ptr[j]
  pi = *pi3d_ptr[j]
  info = size(oi)
  xx = oi[0, 0]
  yy = oi[1, 0]
  zz = oi[2, 0]
  plot, binT, thefc[xx, yy, zz, *]/binT^(j-1), title="  ", psym=symcat(pi[0], color=fsc_color(ci[0])) $
       , /xlog $ 
       , thick=2.0, charsize=1.5, charthick=2.0  $
       , xrange=[xr[0], xr[1]], yrange=[yr[0, j], yr[1, j]], xstyle=1, ystyle=1 $
       , xmargin=[13,2], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
  errplot, binT, (thefc[xx, yy, zz, *]-sqrt(thevarfc[xx, yy, zz, *]))/binT^(j-1), (thefc[xx, yy, zz, *]+sqrt(thevarfc[xx, yy, zz, *]))/binT^(j-1) $
       , color=fsc_color("red"), thick=2.0
  for l=1, info[2]-1 do begin
      xx=oi[0,l]
      yy=oi[1,l]
      zz=oi[2,l]
      oplot, binT, thefc[xx, yy, zz, *]/binT^(j-1), psym=symcat(pi[l], color=fsc_color(ci[l])) $
       , thick = 2
      errplot, binT, (thefc[xx, yy, zz, *]-sqrt(thevarfc[xx, yy, zz, *]))/binT^(j-1), (thefc[xx, yy, zz, *]+sqrt(thevarfc[xx, yy, zz, *]))/binT^(j-1) $
       , color=fsc_color("red"), thick=2.0 
  endfor     
endfor

!p.multi=0

result = 1
return, result

end 