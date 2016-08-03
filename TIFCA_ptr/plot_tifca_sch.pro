function plot_tifca_sch, tifcasch_ptr, frequency, msecond=msecond
; Default frequency unit-> kHz
; Default time unit for display -> micro second (us)
; a keyword set
; msecond -> The time unit for displaying fc is mili second (ms). 

on_error, 2
result = 0

if (size(tifcasch_ptr, /type) ne 10) then begin
   print, "The input for plot is not given as a pointer. Let's convert"
   ptr = ptr_new(tifcasch_ptr)
endif else begin
   ptr = tifcasch_ptr
endelse

bfs = *((*ptr).binfac_ptr)
fc = (*((*ptr).schfcstr_ptr)).fc
varfc = (*((*ptr).schfcstr_ptr)).varfc

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

;determin the range in x-axis
xr = max_min_forplot(binT)

;determine the range in y-axis
yr=dblarr(2, 5)
for i=1, 4 do begin
  yr[*, i] = max_min_forplot( [(fc[i, *]-sqrt(varfc[i, *]))/binT^(i-1) $
                              , (fc[i, *]+sqrt(varfc[i, *]))/binT^(i-1)])
endfor

window, 0, xsize=800, ysize=640
!p.multi=[0, 2, 2]

for j=1, 4 do begin
plot, binT, fc[j, *]/binT^(j-1), title="  ", psym=5, /xlog $ 
       , thick=2.0, charsize=1.5, charthick=2  $
       , xrange=[xr[0], xr[1]], yrange=[yr[0, j], yr[1, j]], xstyle=1, ystyle=1 $
       , xmargin=[11, 2], ymargin=[3, 2] $
       , xtitle=xti, ytitle=yti[j] $ 
       , xthick=2.0, ythick=2.0
  errplot, binT, (fc[j, *]-sqrt(varfc[j, *]))/binT^(j-1), (fc[j, *]+sqrt(varfc[j, *]))/binT^(j-1) $
       , color=fsc_color("red"), thick=2.0

endfor

!p.multi=0

result = 1
return, result

end