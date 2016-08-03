function cum_sch, rawdata
; rawdata -> a pointer

data = rawdata
if (size(data, /type) ne 10) then begin
    data = ptr_new(data)
endif

info = size(*data)
av = float(1)
if info[0] gt 131072*20UL then begin
   w = (info[0] mod 131072*20UL)
   ww = (info[0]-w)/(131072*20UL)
   for i=0, ww-1 do begin
      www = avg( *data[131072*20UL*i:131072*20Ul*(i+1)-1] *1.)
      av = av + www
   endfor
      av = av + avg( *data[131072*20UL*ww:*] *1.)
      av = av/(ww+1)
endif else begin
av = avg( (*data)*1. )
endelse

u = (*data - av)

cmom = dblarr(9)
for i=2, 8 do begin
cmom[i] = avg( u^i )
endfor

cum = dblarr(9)

cum[1] = av
cum[2] = cmom[2]
cum[3] = cmom[3]
cum[4] = -3*cmom[2]^2 + cmom[4]
cum[5] = -10*cmom[2]*cmom[3] + cmom[5]
cum[6] = 30*cmom[2]^3 - 10*cmom[3]^2 - 15*cmom[2]*cmom[4] + cmom[6]
cum[7] = 210*cmom[2]^2*cmom[3] - 35*cmom[3]*cmom[4] - 21*cmom[2]*cmom[5] + cmom[7]
cum[8] = -630*cmom[2]^4 + 560*cmom[2]*cmom[3]^2 + 420*cmom[2]^2*cmom[4] - 35*cmom[4]^2 $
         - 56*cmom[3]*cmom[5] - 28*cmom[2]*cmom[6] + cmom[8]

result = ptr_new(cum)
return, result
end