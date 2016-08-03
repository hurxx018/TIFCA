function tifca_model_ptr, rebinT, para, nch, daqt, noplot=noplot      $
                                                 , errstr=errstr      $
                                                 , error=error
; Pointer Oriented code
; calculate variances of factorial cumulants for single channel(nch=1), dual channel(nch=2), and triple channel(nch=3)
; Employ moment of moment methods, 
; 
; rebinT -> either a pointer or a vector for rebin time
; para -> either a pointer or a vector for parameters
; nch -> a schalar for the number of channels ( 1 for Sch, 2 for Dch, 3 for Tch)
; daqt -> data acquisition time
; result -> a pointer of factorial cumulants
;
; keywords
;
; 

error=0 & errstr=''
if (size(rebinT, /type) eq 10) then binT = *rebinT  $
  else binT = rebinT
if (size(para, /type) eq 10) then ipara = *para     $
  else ipara = para

nbf = n_elements(binT)
np = n_elements(ipara)
id_string = strarr(1)
gf = dblarr(20)

if nch gt 3 then begin
  error=1 & errstr='The number on nch parameter is not appropriate for this calculation.'
  print, errstr & return, error
endif

nchannel = nch
;test the number of elements in para
case nchannel of 
    1: begin
       if (((np-4) mod 3) ne 0 ) then begin
          error=1 & errstr='The number of elements in para is wrong for the calculation.'
          print, errstr & return, error
       endif
       ID_string = 'tifca_model_sch'
       thefc = tifca_model_sch(binT, ipara)
       varcorr = (tifca_model_sch([daqt, daqt], ipara))[2,0] ; a correlation term for variance of the first order
       thevarfc = dblarr(5, nbf)
       for k=0, nbf-1 do begin
          fcum = dblarr(n_elements(thefc[*, 0]))
          fcum = thefc[*, k]
          trunvarfcumfromfcum, fcum, varfcum
          thevarfc[*, k] = varfcum/(daqt/binT[k])
          
          thevarfc[1, k] = thevarfc[1, k] + varcorr/(daqt/binT[k])^2 ;- fcum[2]/(daqt/binT)          
       endfor
       gf = calgammafactors(ipara[np-3])
    end
    2: begin
       if (((np-6) mod 4) ne 0 ) then begin
          error=1 & errstr='The number of elements in para is wrong for the calculation.'
          print, errstr & return, error
       endif    
       ID_string = 'tifca_model_dch'
       thefc = tifca_model_dch(binT, ipara)
       varcorr = (tifca_model_dch([daqt, daqt], ipara)) ; a correlation term for variance of the first order
       varcorr1 = varcorr[2,0,0] ; a correlation term for variance of the first order
       varcorr2 = varcorr[0,2,0] ; a correlation term for variance of the first order
       thevarfc = dblarr(5,5,nbf)
       for k=0, nbf-1 do begin
          fcum = dblarr(n_elements(thefc[*, *, 0]))
          fcum = thefc[*, *, k]
          trunvarfcumfromfcum2D, fcum, varfcum
          thevarfc[*, *, k] = varfcum/(daqt/binT[k])
          thevarfc[1, 0, k] = thevarfc[1, 0, k] + varcorr1/(daqt/binT[k])^2 ;- fcum[2, 0]/(daqt/binT)
          thevarfc[0, 1, k] = thevarfc[0, 1, k] + varcorr2/(daqt/binT[k])^2 ;- fcum[0, 2]/(daqt/binT) 
       endfor
       gf = calgammafactors(ipara[np-5])
    end
    3: begin
       if (((np-8) mod 5) ne 0 ) then begin
          error=1 & errstr='The number of elements in para is wrong for the calculation.'
          print, errstr & return, error
       endif   
       ID_string = 'tifca_model_tch'
       thefc = tifca_model_tch(binT, ipara)
       varcorr = (tifca_model_tch([daqt, daqt], ipara)) ; a correlation term for variance of the first order
       varcorr1 = varcorr[2,0,0,0] ; a correlation term for variance of the first order
       varcorr2 = varcorr[0,2,0,0] ; a correlation term for variance of the first order
       varcorr3 = varcorr[0,0,2,0] ; a correlation term for variance of the first order 
       thevarfc = dblarr(5,5,5,nbf)      
       for k=0, nbf-1 do begin
          fcum = dblarr(n_elements(thefc[*, *, *, 0]))
          fcum = thefc[*, *, *, k]
          varfcum = trunvarfcumfromfcum3d(fcum)/(daqt/binT[k])
          thevarfc[*, *, *, k] = varfcum
          thevarfc[1, 0, 0, k] = thevarfc[1, 0, 0, k] + varcorr1/(daqt/binT[k])^2 ;- fcum[2, 0, 0]/(daqt/binT)
          thevarfc[0, 1, 0, k] = thevarfc[0, 1, 0, k] + varcorr2/(daqt/binT[k])^2 ;- fcum[0, 2, 0]/(daqt/binT) 
          thevarfc[0, 0, 1, k] = thevarfc[0, 0, 1, k] + varcorr3/(daqt/binT[k])^2 ;- fcum[0, 0, 2]/(daqt/binT)
       endfor
       gf = calgammafactors(ipara[np-7])
    end
endcase

result = {ID:ID_string, gf:gf, rebinT:binT, thefc:thefc, thevarfc:thevarfc, input_para:ipara, daqt:daqt}

if ~keyword_set(noplot) then begin
    plres = plot_tifcamodel_ptr(ptr_new(result))
endif

return, ptr_new(result)

end