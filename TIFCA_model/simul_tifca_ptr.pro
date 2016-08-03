function simul_tifca_ptr, binfactors, frequency, dataacqt, nchannel, $
                          spe1=spe1, spe2=spe2, spe3=spe3, $
                          spe4=spe4, spe5=spe5, $
                          instrpara=instrpara
; generate a pointer for modeling the tifca 
; use the code 'tifca_model_ptr' to calculate the cumulants and their variacecs.
; The variaces are evaluated by using Moment of Moment methods.
; The resultant pointer contains the same variables which the resulting pointer of 
; tifca_ptr involves. Therefor, we can fit the result.

; binfactors -> [1, 2, 4, ...]
; frequency -> kHz
; dataacqt -> s
; spe1, spe2, ..., spe5 -> keywords for each species' parameters
; instrpara -> parameters for instrumentation [r^2, f, DT,..., Pa,...]

if n_params() ne 4 then begin
    print, "The number of parameters are not enough."
    return, 1
endif

bfs = binfactors
frq = frequency  ; kHz
daqt = dataacqt  ; second
nch = nchannel

; read species' parameters and count the number of species
nspecies = intarr(1)
para_ptr = ptrarr(5, /allocate_heap)
indpara0 = intarr(5)
if keyword_set(spe1) then begin
   para_ptr[0] = ptr_new(double(spe1))
   indpara0[0] = 1 
endif
if keyword_set(spe2) then begin
   para_ptr[1] = ptr_new(double(spe2))
   indpara0[1] = 1
endif
if keyword_set(spe3) then begin
   para_ptr[2] = ptr_new(double(spe3))
   indpara0[2] = 1
endif
if keyword_set(spe4) then begin
   para_ptr[3] = ptr_new(double(spe4))
   indpara0[3] = 1
endif
if keyword_set(spe5) then begin
   para_ptr[4] = ptr_new(double(spe5))
   indpara0[4] = 1
endif

indpara1 = where(indpara0 eq 1, nspecies) 
if nspecies eq 0 then begin
   print, "No parameters for characterizing each species are available."
   print, "Use keywords spe1, spe2 and so on"
   return,1 
endif else begin
   for i=0, nspecies-1 do begin
    if (n_elements(*para_ptr[indpara1[i]]) mod (nch+2)) eq 0 then begin
        if i eq 0 then begin
          para = *para_ptr[indpara1[i]]
        endif else begin
          para = [para, *para_ptr[indpara1[i]] ]
        endelse
    endif else begin
        print, "The number of parameters in a keyword spe" + strtrim(indpara1[i]+1, 2) + $
                " is wrong. Check it!"
        return, 1
    endelse    
   endfor
   
endelse

if keyword_set(instrpara) then begin
    if (( n_elements(instrpara) - 2)/2. mod nch ) eq 0 then begin 
      para = [para, double(instrpara)]
    endif else begin
      print, "The number of intrumentation parameters is wrong for "+ $
            strtrim( string(nch), 2) + "-channel TIFCA."
    endelse  
endif else begin
    print, "The parameters for instrumentation set-up are not given."
    return, 1
endelse

binT = double(bfs)/(frq*1.)*1000

temp = tifca_model_ptr( binT, para, nch, daqt*10.^6)
fc = (*temp).thefc
varfc = (*temp).thevarfc
case nch of 
  1: begin
      schfcstr_ptr = {ID:'FCs_sch', fc:fc, varfc:varfc }
      result = {ID:'tifca_sch', binfac_ptr:ptr_new(bfs), schfcstr_ptr:ptr_new(schfcstr_ptr)}
  end
  
  2: begin
      dchfcstr_ptr = {ID:'FCs_dch', fc:fc, varfc:varfc }
      result = {ID:'tifca_dch', binfac_ptr:ptr_new(bfs), dchfcstr_ptr:ptr_new(dchfcstr_ptr)}  
  end
  
  3: begin
      tchfcstr_ptr = {ID:'FCs_tch', fc:fc, varfc:varfc }
      result = {ID:'tifca_tch', binfac_ptr:ptr_new(bfs), tchfcstr_ptr:ptr_new(tchfcstr_ptr)}  
  end
endcase

return, ptr_new(result)

end 