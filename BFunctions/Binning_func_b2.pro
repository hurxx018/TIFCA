function Binning_Func_B2, t, r, td


if (n_params() lt 2) then $
    message, 'Usage: b2(t,r)'
if (n_elements(t) eq 0) then tdt=1.0d

tt=t*1.0d
rt=r*1.0d
tdt=td*1.0d
results=(4.0d)/tdt*(rt*tdt-sqrt(rt*tdt*(rt*tdt+tt))-((tdt+tt)*alog(((-1.0+2.*rt-2.*sqrt((-1.+rt)*rt))*(sqrt((-1.+rt)*tdt)+sqrt(rt*tdt+tt)))/(-sqrt((-1.+rt)*tdt)+sqrt(rt*tdt+tt))))/(2.*sqrt((-1.+rt)/rt)))
;x=t/td
;s=sqrt(r^2-1)
;Results=4.D0*R/s*(R*S-S*Sqrt(R^2+x)-(1+x)*alog(((r-s)*(s+sqrt(R^2+x)))/Sqrt(1.D0+x)))

return,results
end