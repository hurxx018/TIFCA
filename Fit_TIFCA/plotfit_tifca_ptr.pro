function plotfit_tifca_ptr, fcstr_ptr, fit_result_ptr, nch=nch
; Pointer oriented code
; plot fc and the_fc for Sch, Dch, and Tch TIFCA
; 
; fcstr_ptr -> 
; fit_result_ptr -> a pointer obtained by fit_tifca_ptr 
;

on_error, 2
error = 0
errmsg = ' '

if ( size(fcstr_ptr, /type) ne 10) then begin
    print, 'Input fcstr_ptr is not given by a pointer.'
    return, 1
endif 
if ( size(fit_result_ptr, /type) ne 10) then begin
    print, 'Input fit_resulr_ptr is not given by a pointer.'
    return, 1
endif

; check the ID in the structure
ncha1 = 0
if ~tag_exist( *fcstr_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the TIFCA ID tag'
    return, error
endif else begin
    tifca_id = (*fcstr_ptr).ID
    if strcmp(tifca_id, 'tifca_sch', 9) then ncha1 = 1
    if strcmp(tifca_id, 'tifca_dch', 9) then ncha1 = 2
    if strcmp(tifca_id, 'tifca_tch', 9) then ncha1 = 3
endelse

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

if (ncha1 ne ncha2) then begin
    print, 'input values are not proper for this plot.'
    return, 1
endif else begin
   if keyword_set(nch) then begin
      if (nch ne ncha1) then begin
          print, 'input values are not proper for plotting factorial cumulants.'
          return, 1
      endif else begin
          if (ncha1 eq 0) then begin
              print, 'Input values do not include any factorial cumulants,'
              return,1 
          endif
          if (ncha2 eq 0) then begin
              print, 'Input values do not include any theoretical factorial cumulants.'
              return, 1
          endif
      endelse
   endif
endelse

nchannel = ncha1

case nchannel of 
    1: begin
        z1 = plotfit_tifca_sch( (*fcstr_ptr).schfcstr_ptr, fit_result_ptr )
    end

    2: begin
        z2 = plotfit_tifca_dch( (*fcstr_ptr).dchfcstr_ptr, fit_result_ptr )
    end
    
    3: begin
        z3 = plotfit_tifca_tch( (*fcstr_ptr).tchfcstr_ptr, fit_result_ptr )
    end
endcase    

return, 0

end