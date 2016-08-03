function momvarfcum_sch, fc, seglength, trun=trun
; fc -> a pointer
; 
; variances calculated by moment of moment methods
; 
; 
; trun -> a keyword for using the truncated variance

if n_params() ne 2 then begin
   print, 'Two inputs should be given.'
   stop
endif

if (size(fc, /type) ne 10) then begin
   print, 'The input should be a pointer.'
   fcum = *fc
endif

varfcum = dblarr(5)

if keyword_set(trun) then begin

varfcum[1] =fcum[1] 

varfcum[2] =2* fcum[1]^2 + 2* fcum[2] + 4* fcum[1]* fcum[2] + 2* fcum[2]^2

varfcum[3] =6* fcum[1]^3 + 18* fcum[1]* fcum[2] + 18* fcum[1]^2* fcum[2] + $
            54* fcum[2]^2 + 18* fcum[1]* fcum[2]^2 + 6* fcum[2]^3 + 6* fcum[3] + $
            36* fcum[1]* fcum[3] + 72* fcum[2]* fcum[3] + 9* fcum[3]^2 
            
varfcum[4] =24* fcum[1]^4 + 144* fcum[1]^2* fcum[2] + 96* fcum[1]^3* fcum[2] + $
            72* fcum[2]^2 + 864* fcum[1]* fcum[2]^2 + 144* fcum[1]^2* fcum[2]^2 + $
            720* fcum[2]^3 + 96* fcum[1]* fcum[2]^3 + 24* fcum[2]^4 + $
            96* fcum[1]* fcum[3] + 288* fcum[1]^2* fcum[3] + 960* fcum[2]* fcum[3] + $
            1152* fcum[1]* fcum[2]* fcum[3] + 864* fcum[2]^2* fcum[3] + $
            720* fcum[3]^2 + 144* fcum[1]* fcum[3]^2 + 144* fcum[2]* fcum[3]^2 + $
            24* fcum[4] + 288* fcum[1]* fcum[4] + 72* fcum[1]^2* fcum[4] + $
            936* fcum[2]* fcum[4] + 144* fcum[1]* fcum[2] fcum[4] + $
            72* fcum[2]^2* fcum[4] + 528* fcum[3]* fcum[4] + 34* fcum[4]^2
endif else begin

varfcum[1] =fcum[1] + fcum[2]

varfcum[2] =2* fcum[1]^2 + 2* fcum[2] + 4* fcum[1]* fcum[2] + 2* fcum[2]^2 + $
            4* fcum[3] + fcum[4]

varfcum[3] =6* fcum[1]^3 + 18* fcum[1]* fcum[2] + 18* fcum[1]^2* fcum[2] + $
            54* fcum[2]^2 + 18* fcum[1]* fcum[2]^2 + 6* fcum[2]^3 + 6* fcum[3] + $
            36* fcum[1]* fcum[3] + 72* fcum[2]* fcum[3] + 9* fcum[3]^2 + 18* fcum[4] + $
            9* fcum[1]* fcum[4] + 9* fcum[2]* fcum[4] + 9* fcum[5] + fcum[6]

varfcum[4] =24* fcum[1]^4 + 144* fcum[1]^2* fcum[2] + 96* fcum[1]^3* fcum[2] + $
            72* fcum[2]^2 + 864* fcum[1]* fcum[2]^2 + 144* fcum[1]^2* fcum[2]^2 + $
            720* fcum[2]^3 + 96* fcum[1]* fcum[2]^3 + 24* fcum[2]^4 + $
            96* fcum[1]* fcum[3] + 288* fcum[1]^2* fcum[3] + 960* fcum[2]* fcum[3] + $
            1152* fcum[1]* fcum[2]* fcum[3] + 864* fcum[2]^2* fcum[3] + $
            720* fcum[3]^2 + 144* fcum[1]* fcum[3]^2 + 144* fcum[2]* fcum[3]^2 + $
            24* fcum[4] + 288* fcum[1]* fcum[4] + 72* fcum[1]^2* fcum[4] + $
            936* fcum[2]* fcum[4] + 144* fcum[1]* fcum[2] fcum[4] + $
            72* fcum[2]^2* fcum[4] + 528* fcum[3]* fcum[4] + 34* fcum[4]^2 + $
            96* fcum[5] + 144* fcum[1]* fcum[5] + 240* fcum[2]* fcum[5] + $
            48* fcum[3]* fcum[5] + 72* fcum[6] + 16* fcum[1]* fcum[6] + $
            16* fcum[2]* fcum[6] + 16* fcum[7] + fcum[8]
endelse

result = ptr_new(varfcum/seglength)

return, result

end