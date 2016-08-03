function splot_tifca_tch, tifcatch_ptr, frequency, msecond=msecond
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
yti = strarr(10)
yti[1] = '!4j!3!D[1]!N/T'
yti[2] = '!4j!3!D[2]!N/T!U2!N'
yti[3] = '!4j!3!D[2]!N/T!U2!N'
yti[4] = '!4j!3!D[3]!N/T!U3!N'
yti[5] = '!4j!3!D[3]!N/T!U3!N'
yti[6] = '!4j!3!D[4]!N/T!U4!N'
yti[7] = '!4j!3!D[4]!N/T!U4!N'
yti[8] = '!4j!3!D[4]!N/T!U4!N'
yti[9] = '!4j!3!D[4]!N/T!U4!N'

oi3d_ptr = orderindexftn_ptr(3, /split)
ci3d_ptr = colorindexftn_ptr(3, /split)
pi3d_ptr = psymindexftn_ptr(3, /split)

;determin the range in x-axis
xr = max_min_forplot(binT)

;determine the range in y-axis
yr=dblarr(2, 10)
for k=1, 9 do begin
  oi=*oi3d_ptr[k]
  info = size(oi)
  yrr = dblarr(2, info[2])
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
      yrr[*, i] = max_min_forplot( [(fc[xx, yy, zz, *]-sqrt(varfc[xx, yy, zz, *]))/binT^(q) $
                                 , (fc[xx, yy, zz, *]+sqrt(varfc[xx, yy, zz, *]))/binT^(q)])
  endfor
  yr[*, k] = max_min_forplot(yrr) 
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
  plot, binT, fc[xx, yy, zz, *]/binT^(q), title="  ", psym=symcat(pi[0], color=fsc_color(ci[0]), thick=2) $
       , /xlog $ 
       , thick=2, charsize=2.2, charthick=2  $
       , xrange=[xr[0], xr[1]], yrange=[yr[0, j], yr[1, j]], xstyle=1, ystyle=1 $
       , xmargin=[13, 2], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
  errplot, binT, (fc[xx, yy, zz, *]-sqrt(varfc[xx, yy, zz, *]))/binT^(q), (fc[xx, yy, zz, *]+sqrt(varfc[xx, yy, zz, *]))/binT^(q) $
       , color=fsc_color("red"), thick=2.0
  for l=1, info[2]-1 do begin
      xx=oi[0,l]
      yy=oi[1,l]
      zz=oi[2,l]
      oplot, binT, fc[xx, yy, zz, *]/binT^(q), psym=symcat(pi[l], color=fsc_color(ci[l]), thick=2) $
        , thick=2.      
      errplot, binT, (fc[xx, yy, zz, *]-sqrt(varfc[xx, yy, zz, *]))/binT^(q), (fc[xx, yy, zz, *]+sqrt(varfc[xx, yy, zz, *]))/binT^(q) $
       , color=fsc_color("red"), thick=2.0 
  
  endfor     
endfor

!p.multi=0

result = 1
return, result

end