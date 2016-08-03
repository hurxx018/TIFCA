function tifca_sch, rawdata1_ptr, binfac_ptr
; This uses the pointer for calculating rebinned factorial cumulants.
; rawdata1_ptr -> a pointer
;            : if it is a vector of rebinning factors, this code itself converts it into a pointer for the calculation.
; binfac_ptr -> a pointer 
;            : if it is a vector of rebinning factors, this code itself converts it into a pointer for the calculation.

error = 0
errstr = ' '
if n_params() ne 2 then begin
  error = -1 & errstr = 'Error: tifca_sch needs two parameters such as a raw data and a binfac'
  print, errstr & return, error
endif

if size(rawdata1_ptr, /type) eq 10 then begin
   data1_ptr = rawdata1_ptr
endif else begin
   print, 'Rawdata1 is not the pointer, so convert.'
   data1_ptr = ptr_new(rawdata1_ptr)
endelse

if size(binfac_ptr, /type) eq 10 then begin
   bfs_ptr = binfac_ptr
endif else begin
   print, 'binfac is not the pointer, so convert.'
   bfs_ptr = ptr_new(binfac_ptr)
endelse

schfcstr_ptr = ptr_new( fc_sch(data1_ptr, bfs_ptr) ) ; a pointer assigned for the sch TIFCA structure

result = {ID:'tifca_sch', binfac_ptr:bfs_ptr, schfcstr_ptr:schfcstr_ptr}

return, ptr_new(result)

end