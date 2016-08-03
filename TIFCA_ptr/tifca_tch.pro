function tifca_tch, rawdata1_ptr, rawdata2_ptr, rawdata3_ptr, binfac_ptr
; This uses the pointer for calculating rebinned factorial cumulants.
; rawdata1_ptr, rawdata2_ptr, rawdata3_ptr -> a pointer
; binfac_ptr -> a pointer 
;            : if it is a vector of rebinning factors, this code itself converts it into a pointer for the calculation.


error = 0
errstr = ' '
if n_params() ne 4 then begin
  error = -1 & errstr = 'Error: tc_fca needs four parameters such as a raw data1, a raw data2, a raw data3 and a binfac'
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

if size(rawdata3_ptr, /type) eq 10 then begin
   data3_ptr = rawdata3_ptr
endif else begin
   print, 'Rawdata3 is not the pointer, so convert.'
   data3_ptr = ptr_new(rawdata3_ptr)
endelse

if size(binfac_ptr, /type) eq 10 then begin
   bfs_ptr = binfac_ptr
endif else begin
   print, 'binfac is not the pointer, so convert.'
   bfs_ptr = ptr_new(binfac_ptr)
endelse

tchfcstr_ptr = ptr_new( fc_tch(data1_ptr, data2_ptr, data3_ptr, bfs_ptr) ) ; a pointer array assigning the pointer structures

result = {ID:'tifca_tch', binfac_ptr:bfs_ptr, tchfcstr_ptr:tchfcstr_ptr }

return, ptr_new(result)

end