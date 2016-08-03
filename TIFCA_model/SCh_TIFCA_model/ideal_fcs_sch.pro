Function ideal_fcs_sch, binT, para0
; Calculate the ideal factorial cumulants up to the 10th order

nb = n_elements(binT)
np = n_elements(para0)
nspe = (np-2)/3 ; the number of species

r2 = para0[np-2]*1.d
f = para0[np-1]*1.d
gf=calgammafactors(f)

result = dblarr(11, nb)

for i=0, nspe-1 do begin

lambda = para0[3*i]*1.d
td = para0[3*i+1]*1.d
N = para0[3*i+2]*1.d
  
  for j=1, 10 do begin
      result[j, *]= result[j, *] + gf[j]*lambda^j*N*BinningFuncWrapper(binT*1.d, r2, td, j)
  endfor

endfor

return, result

end