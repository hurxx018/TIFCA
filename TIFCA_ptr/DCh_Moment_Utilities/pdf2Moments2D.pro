pro pdf2moments2D, pdf, fcum, varfcum, MaxOrd=MaxOrd

;Jun 23rd, 2005
;Purpose: Calculate 2D factorial cumulants from PDF
;Parameter:
;   pdf      ->      2D histogram
;   fcum        <-     factorial cumulant
;   varfcum   <-     variance of factorial cumulant
;Algorithm: See my notes: first calculate raw moments, then cum, then fcum and varfcum
;
if(n_elements(MaxOrd) EQ 0) then MaxOrd=9
if(MaxOrd GT 9) then MaxOrd=9

pinfo=size(pdf)
if (pinfo[0] NE 2) then begin
    print, 'Usage: pdf2D2mom, pdf, mom'
    return
endif

NX=pinfo[1]
NY=pinfo[2]

X=rebin(dindgen(1, NX), MaxOrd, NX)          ;Generate the matrice X, Y
OrdX=rebin(dindgen(MaxOrd, 1), MaxOrd, NX)
X=X^OrdX
Y=rebin(dindgen(NY, 1), NY, MaxOrd)
OrdY=rebin(dindgen(1, MaxOrd), NY, MaxOrd)
Y=Y^OrdY

raw=Y ## pdf ## X             ;calculate the raw moments

MapRaw2Cum2D, raw, cum
MapCum2FCum2D, cum, fcum
VarFCumFromFCum2D, fcum, varfcum

end