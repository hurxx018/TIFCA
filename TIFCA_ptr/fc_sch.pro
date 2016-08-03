function fc_sch, rawdata1_ptr, bfs_ptr   
; Pointer oriented
; Originally written by Bin ( Rebinfc.pro)
; modifiedy by KH for pointer-oriented programming

; parameter
; rawdata1_ptr -> a pointer

; kewwords


nbf = n_elements(*bfs_ptr)
seglength = ulonarr(nbf)
dinfo = size( *(rawdata1_ptr) ) 

fc = dblarr(9, nbf)
varfc = dblarr(9, nbf)
varfcexp = dblarr(9, nbf)
varfcthe = dblarr(9, nbf)

; a data -> a vector (nseg = 1)
if (dinfo[0] eq 2)&&(dinfo[2] eq 1) then begin
    nseg = dinfo[2]
    fcbyseg = dblarr(9, nbf, 1)
    varfcthebyseg = dblarr(9, nbf, 1)
    for i=0, nbf-1 do begin
      data1_ptr = rebinning_ptr(rawdata1_ptr, (*bfs_ptr)[i])
      seglength[i] = (size(*data1_ptr[0]))[1]
      h = histogram(*data1_ptr[0], min=0)
      pdf2moments2, h/total(h,/double), mom, rel_err   ; a calculator for statistical moments and cumulants
      fcum = mom.e.factorialcumulant[1:8]
      varfcum = mom.var.factorialcumulant[1:8]/(seglength[i]*1.d)  ; a variance by moment of moment method
      fcbyseg[1:8, i, 0] = fcum
      varfcthebyseg[1:8, i, 0] = varfcum
    endfor
    
    fc[*, *] = fcbyseg[*, *, 0]
    varfcexp[*, *] = varfcthebyseg[*, *, 0]
    varfcthe[*, *] = varfcthebyseg[*, *, 0]
    varfc[*, *] = varfcexp[*, *]

endif

; a data -> an array (nseg > 1)
if (dinfo[0] eq 2)&&(dinfo[2] gt 1) then begin
    nseg = dinfo[2]
    fcbyseg = dblarr(9, nbf, nseg)
    varfcthebyseg = dblarr(9, nbf, nseg)
    for i=0, nbf-1 do begin     ; a loop for the rebinning
        data1_ptr = rebinning_ptr(rawdata1_ptr, (*bfs_ptr)[i])
        seglength[i] = (size(*data1_ptr[0]))[1]

        for j=0, nseg-1 do begin    ; a loop for the segments
          w = ptr_new((*data1_ptr[0])[*, j])
          h = histogram(*w, min=0)
          pdf2moments2, h/total(h, /double), mom, rel_err     ; a calculator for statistical moments and cumulants
          fcum = mom.e.factorialcumulant[1:8]
          varfcum = mom.var.factorialcumulant[1:8]/(seglength[i]*1.d)  ; a variance by moment of moment method
          fcbyseg[1:8, i, j] = fcum
          varfcthebyseg[1:8, i, j] = varfcum     ; moment of moment(MOM) analysis for the variances of f_cumulants
        endfor
    endfor
    fc = avg(fcbyseg, 2)    ; determine the f_cumulants over a data 
    varfcexp[*, *] = ( avg(fcbyseg^2, 2) - avg(fcbyseg, 2)^2 ) / (nseg - 1.d)
    varfcthe[*, *] = avg(varfcthebyseg, 2) ; determine the variance over a data by MOM
    
    varfc[*, *] = varfcexp ; choose the experimental variances for the least-square fit.
endif

result = {ID:'FCs_sch', fc:fc, varfc:varfc, varfcexp:varfcexp, varfcthe:varfcthe, $
          fcbyseg:fcbyseg, varfcthebyseg:varfcthebyseg, seglength:seglength, nseg:nseg}

return, result

end