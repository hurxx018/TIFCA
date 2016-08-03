function rebinning_ptr, rawdata, binfac
; this code is for pointer oriented FFS codes
; rawdata -> a pointer
;            : if it is a vector of rebinning factors, this code itself converts it into a pointer for the calculation.
; binfac -> a vector
;            : if it is a pointer, this code itself converts it into a vactor for the calculation.

error = 0
errstr = ' '
if n_params() ne 2 then begin
  error = 1 
  errstr = 'Error: sc_fca needs two parameters such as a raw data and a binfac'
  return, error
endif

if size(rawdata, /type) eq 10 then begin
   idata = rawdata
endif else begin
   print, 'Rawdata is not the pointer, so convert.'
   idata = ptr_new(rawdata)
endelse

if size(binfac, /type) eq 10 then begin
   bfs = *binfac  ; bfs -> a vector for binfactors
endif else begin
   bfs = binfac   ; bfs -> a vector for binfactors
endelse

data = idata
dinfo = size(*data)

nbf = n_elements(bfs)
re_data=ptrarr(nbf, /allocate_heap)

cut = (dinfo[1] mod bfs)
reb_seglength = (dinfo[1] - cut)/(bfs)

;rebin for a vector
if dinfo[0] eq 1 then begin
    for i=0, nbf-1 do begin
       w = rebin( (*data)[0:reb_seglength[i]*bfs[i]-1]*1., reb_seglength[i])*bfs[i]
       re_data[i] = ptr_new(uint(w))
    endfor
endif

;rebinf for an array
if dinfo[0] eq 2 then begin
    nseg = dinfo[2]
    for i=0, nbf-1 do begin
       w = rebin( (*data)[0:reb_seglength[i]*bfs[i]*nseg-1]*1., reb_seglength[i]*nseg)*bfs[i]
       w = uint(reform( w, reb_seglength[i], nseg))
       re_data[i] = ptr_new(w)    
    endfor
endif

result = re_data

return, result

end