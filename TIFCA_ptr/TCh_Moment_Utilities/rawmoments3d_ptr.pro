pro rawmoments3D_ptr, a_ptr, b_ptr, c_ptr, fcum, varfcum, maxord=maxord
;Pointer oriented programming
;June, 2012
;Purpose: Calculate 3D factorial cumulants from raw data a, b, c and their variances by MOM
;Parameter:
;   a_ptr, b_ptr, c_ptr      ->      3D raw data
;   fcum        <-     factorial cumulant
;   varfcum   <-     variance of factorial cumulant
;Algorithm: Calculate in brute force, which should be faster when the average count is high
;

if(n_elements(maxord) EQ 0) then maxord=9
if(maxord GT 9) then maxord=9

nd=n_elements(*a_ptr)
if(ND ne n_elements(*b_ptr))||(ND ne n_elements(*c_ptr)) then begin
  print, 'RawMoments3D: a, b, c do not have the same dimension'
  return
endif

ma = total(*a_ptr, /double)/nd
mb = total(*b_ptr, /double)/nd
mc = total(*c_ptr, /double)/nd

Ex=indgen(maxord)
;for a raw moment
ka=dblarr(nd, maxord)
kb=dblarr(nd, maxord)
kc=dblarr(nd, maxord)
ka[*,0]=1.
ka[*,1]=double(*a_ptr)
kb[*,0]=1.
kb[*,1]=double(*b_ptr)
kc[*,0]=1.
kc[*,1]=double(*c_ptr)

;for a central moment
ca=dblarr(nd, maxord)
cb=dblarr(nd, maxord)
cc=dblarr(nd, maxord)
ca[*,0]=1.
ca[*,1]=double(*a_ptr - ma)
cb[*,0]=1.
cb[*,1]=double(*b_ptr - mb)
cc[*,0]=1.
cc[*,1]=double(*c_ptr - mc)

for i=2, maxord-1 do begin
    ;calculate raw moments
;    ka[*,i]=ka[*,1]*ka[*,i-1]
;    kb[*,i]=kb[*,1]*kb[*,i-1]
;    kc[*,i]=kc[*,1]*kc[*,i-1]
    ;calculate central moments
    ca[*,i]=ca[*,1]*ca[*,i-1]
    cb[*,i]=cb[*,1]*cb[*,i-1]
    cc[*,i]=cc[*,1]*cc[*,i-1]
endfor

raw=dblarr(maxord, maxord, maxord)
central=dblarr(maxord, maxord, maxord)

raw[1, 0, 0] = total(ka[*, 1], /double)
raw[0, 1, 0] = total(kb[*, 1], /double)
raw[0, 0, 1] = total(kc[*, 1], /double)

for i=0, maxOrd-1 do begin
  for j=0, maxOrd-1 do begin
    for k=0, maxOrd-1 do begin
;      raw[i, j, k] = total(ka[*,i]*kb[*,j]*kc[*,k], /double)
      central[i, j, k]= total(ca[*,i]*cb[*,j]*cc[*,k], /double)
    endfor
  endfor
endfor

raw=raw/double(nd)
central=central/double(nd)

maprawcentral2cum3D, raw, central, cum
mapcum2fcum3d, cum, fcum
varfcumfromcum3D, cum, varfcum

end