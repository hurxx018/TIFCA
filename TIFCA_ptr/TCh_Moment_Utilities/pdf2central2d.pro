function pdf2central2D, pdf, raw, MaxOrd=MaxOrd

;Purpose: Calculate 2D central moments from PDF
;Parameter:
;   pdf      ->      2D histogram
;   raw      ->      first order moment
;

if(n_elements(MaxOrd) EQ 0) then MaxOrd=9
if(MaxOrd GT 9) then MaxOrd=9

pinfo=size(pdf)
if (pinfo[0] NE 2) then begin
    print, 'Usage: pdf2D2mom, pdf, mom'
    return, 1
endif

NX=pinfo[1]
NY=pinfo[2]

X=rebin(dindgen(1, NX), MaxOrd, NX)          ;Generate the matrice X, Y
OrdX=rebin(dindgen(MaxOrd, 1), MaxOrd, NX)
X=(X - raw[1,0])^OrdX
Y=rebin(dindgen(NY, 1), NY, MaxOrd)
OrdY=rebin(dindgen(1, MaxOrd), NY, MaxOrd)
Y=(Y - raw[0,1])^OrdY

ctrl=Y ## pdf ## X             ;calculate the raw moments

return, ctrl
end