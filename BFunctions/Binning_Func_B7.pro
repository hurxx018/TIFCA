function Binning_Func_B7, t, r, td
common FCA_Binning_Func_Table, B3, B4, B5, B6, B7, B8

;The 7th Binning Function
;Note:
; 	(1): The Value of binning Function is computed by Monte Carlo. The maximum std is about 5*10^(-5)
;	(2): I only calculated the Binning Func for r=25. So r in this interpolation routine is ignored. (It is only for uniform interface with B2-B4)

if (n_params() lt 2) then $
    message, 'Usage: Binning_Func_B7(t,r)'
if (n_elements(t) eq 0) then tdt=1.0d

dti=0.01
ti=(alog10(t/td)+4.0)/dti
results=interpolate(B7, ti, cubic=-0.5)

return,results
end