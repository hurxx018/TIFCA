function tifca_ptr, ffs_ptr, binfac_ptr, channels=channels,       $
                                         seglength=seglength,     $
                                         nsegs=nsegs,             $
                                         frequency=frequency,     $
                                         legacy=legacy,           $
                                         error=error,             $
                                         errstr=errstr


; key words
; channels --> sort out the channel numbers which you want to calculate the TIFCs
;               ex) channels=[1,3] --> the first and the third channels
; seglength --> Default : 32768
;              '0'      -> total number of data points
;   otherwise  ####   -> the number for a segment
; nsegs --> the indices of segments which are calculated for TI cumulants
;           single value  --> index of the last segment
;           double vaues  --> interval eg) [5, 9] --> five to nine segments are considered.
; frequency --> frequency of data collection
; legacy --> when ffs_ptr is given by a vector of pointers, whered each indicates a photon count vector.


error = 0 & errstr = ''
if n_params() ne 2 then begin
  error = -1 & errstr = 'Error: tifca_ptr needs two parameters.'
  print, errstr & return, error
endif

if size(binfac_ptr, /type) eq 10 then begin
   bfs_ptr = binfac_ptr
endif else begin
   print, 'binfac is not the pointer, so convert.'
   bfs_ptr = ptr_new(binfac_ptr)
endelse

;read data pointer from the inpur ffs_ptr
if ~keyword_set(legacy) then begin
  if ~tag_exist( ffs_ptr, 'ID' ) then begin 
    error = -1 & errstr = 'Missing the FFS ID tag'
    print, errstr & return, error
  endif else begin
    ffs_id = (ffs_ptr).ID
    if strcmp(ffs_id, 'FFS', 3) then begin
      ncha = (ffs_ptr).nch
      ndata = (ffs_ptr).info[0].NData
      
      data_ptr = ptrarr(ncha, /allocate_heap)
      for i=0, ncha-1 do begin
        data_ptr[i] = (ffs_ptr).data[i].raw
      endfor
    endif
endelse    
endif else begin
  if size(ffs_ptr, /type) ne 10 then begin
    error=-1 & errstr= 'rffs_ptr should be given by a pointer array.' 
    print, errstr & return, error
  endif else begin
  
    data_ptr = ffs_ptr
    ncha = n_elements(data_ptr)
    ndata = n_elements(*data_ptr[0])
  endelse
  
endelse

;determine the indices of channels
if ~keyword_set(channels) then begin
  ;Default condition
  case ncha of
    1: begin
      chaindex = 0
    end
    2: begin
      chaindex = indgen(2)
    end
    3: begin
      chaindex = indgen(3)
    end
  endcase
endif else begin
;  count--->> the number of channels
    if n_elements(channels) le ncha then begin
      chaindex = channels - 1
    endif else begin
      error=-1 & errstr='The number of channels is bigger than the number of channel data.'
      print, errstr & return, error
    endelse
endelse

if keyword_set(seglength) then begin 
  if (seglength eq '0') then sl = ndata $
  else sl = seglength
endif else begin
  sl = 32768l
endelse
if keyword_set(nsegs) then begin
  if n_elements(nsegs) eq 1 then begin
    ns=[0, nsegs]
  endif else begin
    if n_elements(nsegs) eq 2 then begin
      ns = nsegs
    endif else begin
      error=-1 & errstr='The number of elements in nsegs is wrong.'
      print, errstr & return, error
    endelse
  endelse  
endif else begin
  ns = [0, ndata/sl-1]
endelse

case n_elements(chaindex) of
  1: begin
      print, 'execute the single-channel TIFCA.'
      a1 = ptr_new( reform((*data_ptr[chaindex[0]])[sl*ns[0]+0:sl*(ns[1]+1)-1], sl, (ns[1]-ns[0])+1) )
      result = tifca_sch(a1, bfs_ptr)
  end
  2: begin
      print, 'execute the dual-channel TIFCA.'
      a1 = ptr_new( reform((*data_ptr[chaindex[0]])[sl*ns[0]+0:sl*(ns[1]+1)-1], sl, (ns[1]-ns[0])+1) )
      a2 = ptr_new( reform((*data_ptr[chaindex[1]])[sl*ns[0]+0:sl*(ns[1]+1)-1], sl, (ns[1]-ns[0])+1) )
      result = tifca_dch(a1, a2, bfs_ptr)
  end
  3: begin
      print, 'execute the triple-channel TIFCA.'
      a1 = ptr_new( reform((*data_ptr[chaindex[0]])[sl*ns[0]+0:sl*(ns[1]+1)-1], sl, (ns[1]-ns[0])+1) )
      a2 = ptr_new( reform((*data_ptr[chaindex[1]])[sl*ns[0]+0:sl*(ns[1]+1)-1], sl, (ns[1]-ns[0])+1) )
      a3 = ptr_new( reform((*data_ptr[chaindex[2]])[sl*ns[0]+0:sl*(ns[1]+1)-1], sl, (ns[1]-ns[0])+1) )
      result = tifca_tch(a1,a2,a3, bfs_ptr)
  end
endcase


if keyword_set(frequency) then begin
freq = frequency
endif else begin
read, freq, prompt = 'What is the frequency of data (kHz)?   '
endelse

pres = plot_tifca_ptr(result, frequency=freq)

return, result

end