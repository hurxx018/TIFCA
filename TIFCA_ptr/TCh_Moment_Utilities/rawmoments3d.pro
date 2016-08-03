pro rawmoments3D, a, b, c, fcum, varfcum, maxord=maxord
;June, 2012
;Purpose: Calculate 3D factorial cumulants from raw data a, b, c and their variances by MOM
;Parameter:
;   a, b, c      ->      3D raw data
;   fcum        <-     factorial cumulant
;   varfcum   <-     variance of factorial cumulant
;Algorithm: Calculate in brute force, which should be faster when the average count is high
;

if(n_elements(maxord) EQ 0) then maxord=9
if(maxord GT 9) then maxord=9

nd=n_elements(a)
if(ND ne n_elements(b))||(ND ne n_elements(c)) then begin
  print, 'RawMoments3D: a, b, c do not have the same dimension'
  return
endif

ma = total(a, /double)/nd
mb = total(b, /double)/nd
mc = total(c, /double)/nd

Ex=indgen(maxord)
;for a raw moment
ka=dblarr(nd, maxord)
kb=dblarr(nd, maxord)
kc=dblarr(nd, maxord)
ka[*,0]=1.
ka[*,1]=double(a[*])
kb[*,0]=1.
kb[*,1]=double(b[*])
kc[*,0]=1.
kc[*,1]=double(c[*])

;for a central moment
ca=dblarr(nd, maxord)
cb=dblarr(nd, maxord)
cc=dblarr(nd, maxord)
ca[*,0]=1.
ca[*,1]=double(a[*] - ma)
cb[*,0]=1.
cb[*,1]=double(b[*] - mb)
cc[*,0]=1.
cc[*,1]=double(c[*] - mc)

for i=2, maxord-1 do begin
    ;calculate raw moments
    ka[*,i]=ka[*,1]*ka[*,i-1]
    kb[*,i]=kb[*,1]*kb[*,i-1]
    kc[*,i]=kc[*,1]*kc[*,i-1]
    ;calculate central moments
    ca[*,i]=ca[*,1]*ca[*,i-1]
    cb[*,i]=cb[*,1]*cb[*,i-1]
    cc[*,i]=cc[*,1]*cc[*,i-1]
endfor

raw=dblarr(maxord, maxord, maxord)
central=dblarr(maxord, maxord, maxord)

for i=0, maxOrd-1 do begin
  for j=0, maxOrd-1 do begin
    for k=0, maxOrd-1 do begin
      raw[i, j, k] = total(ka[*,i]*kb[*,j]*kc[*,k], /double)
      central[i, j, k]= total(ca[*,i]*cb[*,j]*cc[*,k], /double)
    endfor
  endfor
endfor

raw=raw/double(ND)
central=central/double(ND)

maprawcentral2cum3D, raw, central, cum
mapcum2fcum3d, cum, fcum
varfcumfromcum3D, cum, varfcum

end