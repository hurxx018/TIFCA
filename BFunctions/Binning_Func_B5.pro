function Binning_Func_B5, t, r, td
common FCA_Binning_Func_Table, B3, B4, B5, B6, B7, B8
common BinFuncB5, B5Init, B5Prime
;The 5th Binning Function
;Note:
;   (1): The Value of binning Function is computed by Monte Carlo. The maximum std is about 5*10^(-5)
;   (2): I only calculated the Binning Func for r=1, 10, 15, 20, 25, 30, 40, 50, 60, 70, 80, 90, 100

if (n_params() lt 2) then $
    message, 'Usage: Binning_Func_B5(t,r,td)'
if (n_elements(t) eq 0) then tdt=1.0d

TGr=dindgen(801)/100-4
RGr=[1,10,15,20,25,30,40,50,60,70,80,90,100]
nRGr=n_elements(RGr)
ti=alog10(t/double(td))
if r gt 100 then ri=100 else ri=r
if n_elements(B5Init) EQ 0 then B5Init=0
if B5Init NE 1 or n_elements(B5Prime) EQ 0 then begin
    splie2, RGr, TGr, B5, nRGr, 801,  B5Prime
    B5Init=1
endif
nt=n_elements(ti)
result=dblarr(nt)
for i=0, nt-1 do begin
    splin2,RGr,TGr,B5,B5Prime,nRGr,801,ri,ti[i],dum
    result[i]=dum
endfor
return, result
end