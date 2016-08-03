function printfit_tifca_ptr, fit_result_ptr, nch=nch
; Pointer oriented code
; print the fit result for Sch, Dch, and Tch TIFCA
; 
; fit_result_ptr -> a pointer obtained by fit_tifca_ptr 
;

on_error, 2
error = 0
errmsg = ' '
 
if ( size(fit_result_ptr, /type) ne 10) then begin
    print, 'Input fit_resulr_ptr is not given by a pointer.'
    return, 1
endif

; check the ID in the structure
ncha2 = 0
if ~tag_exist( *fit_result_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the fit result ID tag'
    return, error
endif else begin
    fit_id = (*fit_result_ptr).ID
    if strcmp(fit_id, 'fitresult_of_tifca_sch', 22) then ncha2 = 1
    if strcmp(fit_id, 'fitresult_of_tifca_dch', 22) then ncha2 = 2
    if strcmp(fit_id, 'fitresult_of_tifca_tch', 22) then ncha2 = 3
endelse

   if keyword_set(nch) then begin
      if (nch ne ncha2) then begin
          print, 'input values are not proper for printing fit parameters.'
          return, 1
      endif else begin
          if (ncha2 eq 0) then begin
              print, 'Input values do not include any fit results.'
              return, 1
          endif
      endelse
   endif

nchannel = ncha2

case nchannel of 
    1: begin
        z1 = printfit_tifca_sch(fit_result_ptr)
    end

    2: begin
        z2 = printfit_tifca_dch(fit_result_ptr)
    end
    
    3: begin
        z3 = printfit_tifca_tch(fit_result_ptr)
    end
endcase    

return, 0

end