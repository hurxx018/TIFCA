Function ideal_fcs_tch, binT, para0
; Calculate the ideal factorial cumulants up to the 10th order

nb = n_elements(binT)
np = n_elements(para0)
ns = (np-2)/5 ; the number of species

r2 = para0[np-2]*1.d
f = para0[np-1]*1.d
gf=calgammafactors(f)

result = dblarr(11, 11, 11, nb)

for i=0, ns-1 do begin

Lm_A = para0[5*i]*1.d    ;for A-channel
Lm_B = para0[5*i+1]*1.d  ;for B-channel
Lm_C = para0[5*i+2]*1.d  ;for C-channel
td   = para0[5*i+3]*1.d
N    = para0[5*i+4]*1.d
  
  for j=0, 10 do begin
      for k=0, 10 do begin
          for l=0, 10 do begin
              if (j+k+l le 10) then begin
              result[j, k, l, *]= result[j, k, l, *] $
                                 + gf[j+k+l]*Lm_A^j*Lm_B^k*Lm_C^l*N*BinningFuncWrapper(binT*1.d, r2, td, j+k+l)
              endif
          endfor
      endfor
  endfor

endfor

return, result

end