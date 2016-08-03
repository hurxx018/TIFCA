function plot_tifcamodel_ptr, thefcstr_ptr, nch=nch
; Pointer oriented code
; plot thefc for Sch, Dch, and Tch TIFCA
; 
; fcstr_ptr -> 
; fit_result_ptr -> a pointer obtained by fit_tifca_ptr 
;

on_error, 2
error = 0
errmsg = ' '

if ( size(thefcstr_ptr, /type) ne 10) then begin
    print, 'Input thefcstr_ptr is not given by a pointer.'
    return, 1
endif 

; check the ID in the structure
ncha1 = 0
if ~tag_exist( *thefcstr_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the TIFCA ID tag'
    return, error
endif else begin
    tifca_id = (*thefcstr_ptr).ID
    if strcmp(tifca_id, 'tifca_model_sch', 15) then ncha1 = 1
    if strcmp(tifca_id, 'tifca_model_dch', 15) then ncha1 = 2
    if strcmp(tifca_id, 'tifca_model_tch', 15) then ncha1 = 3
endelse

;if (ncha1 ne ncha2) then begin
;    print, 'input values are not proper for this plot.'
;    return, 1
;endif else begin
;   if keyword_set(nch) then begin
;      if (nch ne ncha1) then begin
;          print, 'input values are not proper for plotting factorial cumulants.'
;          return, 1
;      endif else begin
;          if (ncha1 eq 0) then begin
;              print, 'Input values do not include any factorial cumulants,'
;              return,1 
;          endif
;          if (ncha2 eq 0) then begin
;              print, 'Input values do not include any theoretical factorial cumulants.'
;              return, 1
;          endif
;      endelse
;   endif
;endelse

nchannel = ncha1

case nchannel of 
    1: begin
        z1 = plot_tifcamodel_sch( thefcstr_ptr )
    end

    2: begin
        z2 = plot_tifcamodel_dch( thefcstr_ptr )
    end
    
    3: begin
        z3 = plot_tifcamodel_tch( thefcstr_ptr )
    end
endcase    

return, 0

end