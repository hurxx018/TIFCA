function plot_tifca_ptr, fcstr_ptr, frequency, nch=nch
; Pointer oriented code
; plot fc for Sch, Dch, and Tch TIFCA
; 
; fcstr_ptr -> 
; frequency 
;

on_error, 2

if n_params() ne 2 then begin
  print, "ERROR: plot_tifca_ptr needs two inputs."
  return, 1
endif

if ( size(fcstr_ptr, /type) ne 10) then begin
    print, 'Input fcstr_ptr is not given by a pointer.'
    return, 1
endif 

; check the ID in the structure
ncha1 = 0
if ~tag_exist( *fcstr_ptr, 'ID' ) then begin 
    print, 'Missing the TIFCA ID tag'
    return, 1
endif else begin
    tifca_id = (*fcstr_ptr).ID
    if strcmp(tifca_id, 'tifca_sch', 9) then ncha1 = 1
    if strcmp(tifca_id, 'tifca_dch', 9) then ncha1 = 2
    if strcmp(tifca_id, 'tifca_tch', 9) then ncha1 = 3
endelse

if keyword_set(nch) then begin
  if (nch ne ncha1) then begin
     print, 'input values are not proper for plotting factorial cumulants.'
     return, 1
  endif else begin
    if (ncha1 eq 0) then begin
      print, 'Input values do not include any factorial cumulants,'
      return,1 
    endif
  endelse
endif

nchannel = ncha1

case nchannel of 
    1: begin
        z1 = plot_tifca_sch( fcstr_ptr, frequency )
    end

    2: begin
        z2 = plot_tifca_dch( fcstr_ptr, frequency )
    end
    
    3: begin
        z3 = plot_tifca_tch( fcstr_ptr, frequency )
    end
endcase    

return, 0

end