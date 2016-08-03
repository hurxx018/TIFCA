function plot_tifca_tch, tifcatch_ptr, frequency, msecond=msecond
; Default frequency unit-> kHz
; Default time unit for display -> micro second (us)
; a keyword set
; msecond -> The time unit for displaying fc is mili second (ms). 

on_error, 2
result = 0

if (size(tifcatch_ptr, /type) ne 10) then begin
   print, "The input for plot is not given as a pointer. Let's convert"
   ptr = ptr_new(tifcatch_ptr)
endif else begin
   ptr = tifcatch_ptr
endelse

bfs = *((*ptr).binfac_ptr)
fc = (*((*ptr).tchfcstr_ptr)).fc
varfc = (*((*ptr).tchfcstr_ptr)).varfc

freq = frequency*1.d  ; unit -> kHz
if keyword_set(msecond) then begin
    binT = bfs/freq ; unit -> ms
    xti = 'T(ms)'
endif else begin
    binT = 1000.*bfs/freq ; unit -> us
    xti = 'T(!4l!3s)'
endelse

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
      yrr[*, i] = max_min_forplot( [(fc[xx, yy, zz, *]-sqrt(varfc[xx, yy, zz, *]))/binT^(k-1) $
                                 , (fc[xx, yy, zz, *]+sqrt(varfc[xx, yy, zz, *]))/binT^(k-1)])
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
  plot, binT, fc[xx, yy, zz, *]/binT^(j-1), title="  ", psym=symcat(pi[0], color=fsc_color(ci[0]), thick=2) $
       , /xlog $ 
       , thick=2, charsize=1.5, charthick=2  $
       , xrange=[xr[0], xr[1]], yrange=[yr[0, j], yr[1, j]], xstyle=1, ystyle=1 $
       , xmargin=[11, 2], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
  errplot, binT, (fc[xx, yy, zz, *]-sqrt(varfc[xx, yy, zz, *]))/binT^(j-1), (fc[xx, yy, zz, *]+sqrt(varfc[xx, yy, zz, *]))/binT^(j-1) $
       , color=fsc_color("red"), thick=2.0
  for l=1, info[2]-1 do begin
      xx=oi[0,l]
      yy=oi[1,l]
      zz=oi[2,l]
      oplot, binT, fc[xx, yy, zz, *]/binT^(j-1), psym=symcat(pi[l], color=fsc_color(ci[l]), thick=2) $
        , thick=2.      
      errplot, binT, (fc[xx, yy, zz, *]-sqrt(varfc[xx, yy, zz, *]))/binT^(j-1), (fc[xx, yy, zz, *]+sqrt(varfc[xx, yy, zz, *]))/binT^(j-1) $
       , color=fsc_color("red"), thick=2.0 
  
  endfor     
endfor

!p.multi=0

result = 1
return, result

end