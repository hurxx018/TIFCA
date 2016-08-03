function tifca_dch, rawdata1_ptr, rawdata2_ptr, binfac_ptr
; This uses the pointer for calculating rebinned factorial cumulants.
; rawdata1, rawdata2 -> a pointer
; binfac_ptr -> a pointer 
;            : if it is a vector of rebinning factors, this code itself converts it into a pointer for the calculation.


;catch, tifca_error
;
;if tifca_error ne 0 then begin  
;      print, 'Error index: ', tifca_error  
;      print, 'Error message: ', !ERROR_STATE.MSG  
;      ; Handle the error by extending A:  
;       
;      catch, /cancel  
;endif 
   
if n_params() ne 3 then begin
  error = 1 & errstr = 'Error: dc_fca needs three parameters such as a raw data1, a raw data2 and a binfac'
  print, errstr & return, error
endif

if size(rawdata1_ptr, /type) eq 10 then begin
   data1_ptr = rawdata1_ptr
endif else begin
   print, 'Rawdata1 is not the pointer, so convert.'
   data1_ptr = ptr_new(rawdata1_ptr)
endelse

if size(rawdata2_ptr, /type) eq 10 then begin
   data2_ptr = rawdata2_ptr
endif else begin
   print, 'Rawdata2 is not the pointer, so convert.'
   data2_ptr = ptr_new(rawdata2_ptr)
endelse

if size(binfac_ptr, /type) eq 10 then begin
   bfs_ptr = binfac_ptr
endif else begin
   print, 'binfac is not the pointer, so convert.'
   bfs_ptr = ptr_new(binfac_ptr)
endelse

dchfcstr_ptr = ptr_new( fc_dch(data1_ptr, data2_ptr, bfs_ptr) ) 
; a pointer array assigning the pointer structures

result = {ID:'tifca_dch', binfac_ptr:bfs_ptr, dchfcstr_ptr:dchfcstr_ptr   }

return, ptr_new(result)

end