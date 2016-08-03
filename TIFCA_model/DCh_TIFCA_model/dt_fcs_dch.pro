function dt_fcs_dch, binT, ideal_fcs, deadtime
; Correct the deadtime effect up to the third order for the first four factorial cumulants

fc=Ideal_fcs*1.D
nb = n_elements(binT)

dt_A = 1.d*deadtime[0]/binT
dt_B = 1.d*deadtime[1]/binT

result = dblarr(5, 5, nb)

sc_fcA=dblarr(11, nb)
sc_fcB=dblarr(11, nb)

sc_fcA[*, *]=fc[*, 0, *]
sc_fcB[*, *]=fc[0, *, *]
result[*, 0, *] = dt_fcs_sch(binT, sc_fcA, deadtime[0] )
result[0, *, *] = dt_fcs_sch(binT, sc_fcB, deadtime[1] )

result[1, 1, *] = fc11_dt(binT, fc, deadtime)

result[2, 1, *] = fc21_dt(binT, fc, deadtime)

result[1, 2, *] = fc21_dt(binT, fc, deadtime, /swap)

result[3, 1, *] = fc31_dt(binT, fc, deadtime)

result[2, 2, *] = fc22_dt(binT, fc, deadtime)

result[1, 3, *] = fc31_dt(binT, fc, deadtime, /swap)


return, result

end