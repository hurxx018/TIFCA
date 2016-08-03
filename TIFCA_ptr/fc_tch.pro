function fc_tch, rawdata1_ptr, rawdata2_ptr, rawdata3_ptr, bfs_ptr
; Pointer oriented
; parameter

; rawdata1_ptr, rawdata2_ptr, rawdata3_ptr -> a pointer
; bfs_ptr -> a pointer

nbf = n_elements(*bfs_ptr)
dinfo1 = size( *rawdata1_ptr )
dinfo2 = size( *rawdata2_ptr )
dinfo3 = size( *rawdata3_ptr ) 

fc = dblarr(9, 9, 9, nbf)
varfc = dblarr(9, 9, 9, nbf)
varfcexp = dblarr(9, 9, 9, nbf)
varfcthe = dblarr(5, 5, 5, nbf)
seglength = dblarr(nbf)

; a data -> a vector (nseg = 1)
if (dinfo1[0] eq 1)&&(dinfo1[2] eq 1) then begin
    nseg = dinfo1[2]
    fcbyseg = dblarr(9, 9, 9, nbf, 1)
    varfcthebyseg = dblarr(5, 5, 5, nbf, 1)
    for i=0, nbf-1 do begin
      data1_ptr = rebinning_ptr(rawdata1_ptr, (*bfs_ptr)[i])
      data2_ptr = rebinning_ptr(rawdata2_ptr, (*bfs_ptr)[i])
      data3_ptr = rebinning_ptr(rawdata3_ptr, (*bfs_ptr)[i])
      seglength[i] = (size(*data1_ptr[0]))[1]
      w1 = data1_ptr[0]
      w2 = data2_ptr[0]
      w3 = data3_ptr[0]
      if (max( [max(*w1),max(*w2),max(*w3)] ) le 2000) then begin
        pdf2moments3d_ptr, w1, w2, w3, fcum, varfcum
      endif else begin
        rawmoments3d_ptr, w1, w2, w3, fcum, varfcum
      endelse
      fcbyseg[*, *, *, i, 0] = fcum
      varfcthebyseg[*, *, *, i, 0] = varfcum/seglength[i]
    endfor
    
    fc[*, *, *, *] = fcbyseg[*, *, *, *, 0]
    varfcexp[*, *, *, *] = varfcthebyseg[*, *, *, *, 0]
    varfcthe[*, *, *, *] = varfcthebyseg[*, *, *, *, 0]
    varfc[*, *, *, *] = varfcexp[*, *, *, *]

endif

; a data -> an array (nseg > 1)
if (dinfo1[0] eq 2)&&(dinfo1[2] gt 1) then begin
    nseg = dinfo1[2]
    fcbyseg = dblarr(9, 9, 9, nbf, nseg)
    varfcthebyseg = dblarr(5, 5, 5, nbf, nseg)
    for i=0, nbf-1 do begin     ; a loop for the rebinning
        data1_ptr = rebinning_ptr(rawdata1_ptr, (*bfs_ptr)[i])
        data2_ptr = rebinning_ptr(rawdata2_ptr, (*bfs_ptr)[i])
        data3_ptr = rebinning_ptr(rawdata3_ptr, (*bfs_ptr)[i])
        seglength[i] = (size(*data1_ptr[0]))[1]
        for j=0, nseg-1 do begin    ; a loop for the segments
          w1 = ptr_new((*data1_ptr[0])[*, j])
          w2 = ptr_new((*data2_ptr[0])[*, j])
          w3 = ptr_new((*data3_ptr[0])[*, j])
          if (max( [max(*w1),max(*w2),max(*w3)] ) le 2000) then begin
            pdf2moments3d_ptr, w1, w2, w3, fcum, varfcum
          endif else begin
            rawmoments3d_ptr, w1, w2, w3, fcum, varfcum
          endelse
          fcbyseg[*, *, *, i, j] = fcum
          varfcthebyseg[*, *, *, i, j] = varfcum/seglength[i] ; moment of moment(MOM) analysis for the variances of f_cumulants
        endfor
    endfor
    fc[*, *, *, *] = avg(fcbyseg, 4)    ; determine the f_cumulants over a data 
    varfcexp[*, *, *, *] = ( avg(fcbyseg^2, 4) - avg(fcbyseg, 4)^2) / (nseg - 1.d)
    varfcthe[*, *, *, *] = avg(varfcthebyseg, 4) ; determine the variance over a data by MOM
    
    varfc[*, *, *, *] = varfcexp ; choose the experimental variances for the least-square fit.
endif

result = {ID:'FCs_tch', fc:fc, varfc:varfc, varfcexp:varfcexp, varfcthe:varfcthe, $
          fcbyseg:fcbyseg, varfcthebyseg:varfcthebyseg, seglength:seglength, nseg:nseg}

return, result
end