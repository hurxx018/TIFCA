function fit_tifca_ptr, fcstr_ptr, frequency, para, $
                                   fixed = fixed, $
                                   nch = nch, $
                                   nspecies = nspecies, $
                                   order = order, $
                                   noplot = noplot, $
                                   noprint = noprint, $
                                   msecond = msecond $
                                 , error=error            $
                                 , errstr=errstr
; Pointer Oriented
; fcstr_ptr -> a pointer which indicates a structure obtained by tifca_ptr.pro
; frequency -> a scalar : unit (kHz)
; para -> a vector which includes fit parameters
;   sch -> [lambda1, td1, N1, lambda2, td2, N2, ..., r2, f, DT, AP_Pro]
;   dch -> [lambdaA1, lambdaB1, td1, N1, lambdaA2, lambdaB2, td2, N2, ..., 
;           r2, f, DT1, DT2, AP_Pro1, AP_Pro2]
;   tch -> [lambdaA1, lambdaB1, lambdaC1, td1, N1, lambdaA2, lambdaB2, lambdaC2, td2, N2, ..., 
;           r2, f, DT_A, DT_B, DT_C, AP_Pro_A, AP_Pro_B, AP_Pro_C]
;
; keyword set
; fixed ->
; nch ->
; nspecies ->
; order ->
; noplot -> do not plot the values
; noprint -> do not print the values
; msecond -> 
; 

on_error, 2
error = 0 & errstr = ''

if ( size(fcstr_ptr, /type) ne 10) then begin
    error=-1 & errstr='Input fcstr_ptr is not given by a pointer.'
    print, errstr & return, error
endif else begin
    ; check the ID in the structure
    if ~tag_exist( *fcstr_ptr, 'ID' ) then begin 
        error = -1 & errstr = 'Missing the TIFCA ID tag'
        print, errstr & return, error
    endif else begin
        tifca_id = (*fcstr_ptr).ID
        if strcmp(tifca_id, 'tifca_sch', 9) then ncha = 1
        if strcmp(tifca_id, 'tifca_dch', 9) then ncha = 2
        if strcmp(tifca_id, 'tifca_tch', 9) then ncha = 3
        
        if ncha eq 0 then begin
          error=-1 & errstr='TIFCA ID is not available.'
          print, errstr & return, error
        endif  
    endelse
endelse
             
np = n_elements(para)
case ncha of 
      1: begin
         rem = ( (np-4) mod 3)
         nspe = (np-4)/3
      end
      
      2: begin
         rem = ( (np-6) mod 4)
         nspe = (np-6)/4
      end
      
      3: begin
         rem = ( (np-8) mod 5)
         nspe = (np-8)/5
      end
endcase

if (rem ne 0) then begin
      error = -1 & errstr = 'The element number in para is wrong for the fit model.'
      print, errstr & return, error
end

if (nspe le 0) then begin
      error = -1 &  errstr = 'The element number in para is proper for fit.'
      print, errstr & return, error
end

if (keyword_set(fixed)) then begin
      if n_elements(fixed) ne np then begin
            error= -1  & errstr = 'The element number in fixed is not matched to the number of parameters.' 
            print, errstr & return, error
      endif
endif else begin
      fixed = intarr(np)
endelse

if keyword_set(nch) then begin
      if (nch ne ncha) then begin
          error = -1  &  errstr = 'The input ID does not match to the channel number for the fit model.'
          print, errstr &  return, error
      endif
endif

if keyword_set(nspecies) then begin
      if (nspe ne nspecies) then begin
          error = -1 & errstr = 'The element number in para is not proper for fit in terms of species.'
          print, errstr & return, error
      endif
endif

if keyword_set(order) then begin
    if (order le 4)&&(order ge 2) then begin
        ord = order
    endif else begin
        error = -1 & errstr = 'The number in keyword order should be between 2 and 4."
        print, errstr & return, error
    endelse
endif else begin
    ord = 4 ; default
endelse

; unit -> us
rebinT = *((*fcstr_ptr).binfac_ptr)*1000.d/frequency

nchannel = ncha             
fix1 = fixed
nspe1 = nspe
ord1 = ord
                                
case nchannel of 
      1: begin
         fc = (*((*fcstr_ptr).schfcstr_ptr)).fc
         varfc = (*((*fcstr_ptr).schfcstr_ptr)).varfc
         fit_result_ptr = fit_tifca_sch(rebinT, fc, varfc, para, fixed=fix1, nspecies=nspe1, order=ord1)
      end
      
      2: begin
         fc = (*((*fcstr_ptr).dchfcstr_ptr)).fc
         varfc = (*((*fcstr_ptr).dchfcstr_ptr)).varfc
         fit_result_ptr = fit_tifca_dch(rebinT, fc, varfc, para, fixed=fix1, nspecies=nspe1, order=ord1)
      end
      
      3: begin
         fc = (*((*fcstr_ptr).tchfcstr_ptr)).fc
         varfc = (*((*fcstr_ptr).tchfcstr_ptr)).varfc 
         fit_result_ptr = fit_tifca_tch(rebinT, fc, varfc, para, fixed=fix1, nspecies=nspe1, order=ord1)
      end
endcase
                                
if ~keyword_set(noplot) then begin
      plot_res = plotfit_tifca_ptr(fcstr_ptr, fit_result_ptr, nch=nchannel)
endif

if ~keyword_set(noprint) then begin
      print_res = printfit_tifca_ptr(fit_result_ptr, nch=nchannel)
endif

result = fit_result_ptr                                
return, result

end
