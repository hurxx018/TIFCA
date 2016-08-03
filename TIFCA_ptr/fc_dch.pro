function fc_dch, rawdata1_ptr, rawdata2_ptr, bfs_ptr
; Pointer oriented
; Originally written by Bin (Rebinfc.pro)
; modifiedy by KH for pointer-oriented programming

; parameter
; rawdata1_ptr, rawdata2_ptr -> a pointer
; bfs_ptr -> a pointer

nbf = n_elements(*bfs_ptr)
dinfo1 = size( *rawdata1_ptr )
dinfo2 = size( *rawdata2_ptr ) 

if (dinfo1[1] ne dinfo2[1]) then begin
    print, "The formats of two input data are different."
    stop
endif

fc = dblarr(9, 9, nbf)
varfc = dblarr(9, 9, nbf)
varfcexp = dblarr(9, 9, nbf)
varfcthe = dblarr(5, 5, nbf)
seglength = dblarr(nbf)
; a data -> a vector (nseg = 1)
if (dinfo1[0] eq 2)&&(dinfo1[2] eq 1) then begin
    nseg = dinfo1[2]
    fcbyseg = dblarr(9, 9, nbf, 1)
    varfcthebyseg = dblarr(5, 5, nbf, 1)
    for i=0, nbf-1 do begin
      data1_ptr = rebinning_ptr(rawdata1_ptr, (*bfs_ptr)[i])
      data2_ptr = rebinning_ptr(rawdata2_ptr, (*bfs_ptr)[i])          
      seglength[i] = (size(*data1_ptr[0]))[1]
      w1 = *data1_ptr[0]
      w2 = *data2_ptr[0]
      if (max([max(w1), max(w2)]) lt 2000) then begin
         h = hist_2d(*w1, *w2, min1=0, min2=0)
         pdf2moments2d, h/total(h, /double), fcum, varfcum     ; a calculator for statistical moments and cumulants
      endif else begin
         rawmoments2d, *w1, *w2, fcum, varfcum
      endelse
      fcbyseg[*, *, i, 0] = fcum
      varfcthebyseg[*, *, i, 0] = varfcum/seglength[i]
    endfor
    
    fc[*, *, *] = fcbyseg[*, *, *, 0]
    varfcexp[*, *, *] = varfcthebyseg[*, *, *, 0]
    varfcthe[*, *, *] = varfcthebyseg[*, *, *, 0]
    varfc[*, *, *] = varfcexp[*, *, *]

endif

; a data -> an array (nseg > 1)
if (dinfo1[0] eq 2)&&(dinfo1[2] gt 1) then begin
    nseg = dinfo1[2]
    fcbyseg = dblarr(9, 9, nbf, nseg)
    varfcthebyseg = dblarr(5, 5, nbf, nseg)
    for i=0, nbf-1 do begin     ; a loop for the rebinning
      data1_ptr = rebinning_ptr(rawdata1_ptr, (*bfs_ptr)[i])
      data2_ptr = rebinning_ptr(rawdata2_ptr, (*bfs_ptr)[i])
        seglength[i] = (size(*data1_ptr[0]))[1]
        for j=0, nseg-1 do begin    ; a loop for the segments
          w1 = ptr_new((*data1_ptr[0])[*, j])
          w2 = ptr_new((*data2_ptr[0])[*, j])
          if (max([max(*w1), max(*w2)]) lt 2000) then begin
            h = hist_2d(*w1, *w2, min1=0, min2=0)
            pdf2moments2d, h/total(h, /double), fcum, varfcum     ; a calculator for statistical moments and cumulants
          endif else begin
            rawmoments2d, *w1, *w2, fcum, varfcum
          endelse
          fcbyseg[*, *, i, j] = fcum
          varfcthebyseg[*, *, i, j] = varfcum/seglength[i]     ; moment of moment(MOM) analysis for the variances of f_cumulants        endfor
        endfor
    endfor
    fc[*, *, *] = avg(fcbyseg, 3)    ; determine the f_cumulants over a data 
    varfcexp[*, *, *] = ( avg(fcbyseg^2, 3) - avg(fcbyseg, 3)^2) / (nseg - 1.d)
    varfcthe[*, *, *] = avg(varfcthebyseg, 3) ; determine the variance over a data by MOM
    
    varfc[*, *, *] = varfcexp ; choose the experimental variances for the least-square fit.
endif

result = {ID:'FCs_dch', fc:fc, varfc:varfc, varfcexp:varfcexp, varfcthe:varfcthe, $
          fcbyseg:fcbyseg, varfcthebyseg:varfcthebyseg, seglength:seglength, nseg:nseg}

return, result
end