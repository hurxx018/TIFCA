pro pdf2moments3D_ptr, a_ptr, b_ptr, c_ptr, fcum, varfcum, maxord=maxord
;Pointer oriented programming
;September, 2012
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

raw = dblarr( 2, 2, 2)
temp = dblarr(2, 2)
central = dblarr(maxord, maxord, maxord)

ma = total(*a_ptr, /double)/nd 
mb = total(*b_ptr, /double)/nd
mc = total(*c_ptr, /double)/nd

raw[1, 0, 0] = ma
raw[0, 1, 0] = mb
raw[0, 0, 1] = mc

h = hist_2d(*a_ptr, *b_ptr, min1=0, min2=0)
temp[*,*]=raw[*, *, 0]
central[*, *, 0]= pdf2central2d( h/total(h, /double), temp)
h = hist_2d(*b_ptr, *c_ptr, min1=0, min2=0)
temp[*,*]=raw[0, *, *]
central[0, *, *]= pdf2central2d( h/total(h, /double), temp)
h = hist_2d(*a_ptr, *c_ptr, min1=0, min2=0)
temp[*,*]=raw[*, 0, *]
central[*, 0, *]= pdf2central2d( h/total(h, /double), temp)

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
    ;calculate central moments
    ca[*,i]=ca[*,1]*ca[*,i-1]
    cb[*,i]=cb[*,1]*cb[*,i-1]
    cc[*,i]=cc[*,1]*cc[*,i-1]
endfor

for i=1, maxOrd-1-2 do begin
  for j=1, maxOrd-1-2 do begin
    for k=1, maxOrd-1-2 do begin
      if (i+j+k le 8) then begin
        central[i, j, k]= total(ca[*,i]*cb[*,j]*cc[*,k], /double)/nd
      endif   
    endfor
  endfor
endfor

maprawcentral2cum3D, raw, central, cum
mapcum2fcum3d, cum, fcum
varfcumfromcum3D, cum, varfcum

end