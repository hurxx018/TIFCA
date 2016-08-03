function Binning_Func_B3, t, r, td
common FCA_Binning_Func_Table, B3, B4, B5, B6, B7, B8

if (n_params() lt 2) then $
    message, 'Usage: interp_b3(t,r)'
if (n_elements(td) eq 0) then td=1.0d

dti=0.001d
dri=.01d
ti=(alog10(t/double(td))+4.d)/dti
ri=(alog10(double(r)))/dri
;TScale=rebin(transpose(10^((dindgen(81)-40)/10)), 41, 81)
result=interpolate(B3,ri,ti,cubic=-.5, /grid)
return, result
end