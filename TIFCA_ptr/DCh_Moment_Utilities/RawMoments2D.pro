pro RawMoments2D, a, b, fcum, varfcum, MaxOrd=MaxOrd

;Jan 09, 2006
;Purpose: Calculate 2D factorial cumulants from raw data a, b
;Parameter:
;   a, b      ->      2D raw data
;   fcum        <-     factorial cumulant
;   varfcum   <-     variance of factorial cumulant
;Algorithm: Calculate in brute force, which should be faster when the average count is high
;
if(n_elements(MaxOrd) EQ 0) then MaxOrd=9
if(MaxOrd GT 9) then MaxOrd=9

ND=n_elements(A)
if(ND NE n_elements(B)) then begin
	print, 'RawMoments2D: A, B do not have the same dimension'
	return
endif
Ex=indgen(MaxOrd)
AA=dblarr(ND, MaxOrd)
BB=dblarr(ND, MaxOrd)
AA[*,0]=1
AA[*,1]=double(A[*])
BB[*,0]=1
BB[*,1]=double(B[*])
for i=2, MaxOrd-1 do AA[*,i]=AA[*,1]*AA[*,i-1]
for i=2, MaxOrd-1 do BB[*,i]=BB[*,1]*BB[*,i-1]
Raw=dblarr(MaxOrd, MaxOrd)
for i=0, MaxOrd-1 do begin
	for j=0, MaxOrd-1 do begin
		Raw[j,i]=total(AA[*,j]*BB[*,i], /double)
	endfor
endfor
Raw=Raw/double(ND)

MapRaw2Cum2D, raw, cum
MapCum2FCum2D, cum, fcum
VarFCumFromFCum2D, fcum, varfcum

end