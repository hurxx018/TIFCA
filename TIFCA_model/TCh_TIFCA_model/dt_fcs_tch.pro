function dt_fcs_tch, binT, ideal_fcs, deadtime
; Correct the deadtime effect up to the third order for the three-channel FCs

fc=ideal_fcs*1.D
nb = n_elements(binT)

dt_A = 1.d*deadtime[0]/binT
dt_B = 1.d*deadtime[1]/binT
dt_C = 1.d*deadtime[2]/binT

result = dblarr(5, 5, 5, nb)

dc_fcAB=dblarr(11, 11, nb)
dc_fcAC=dblarr(11, 11, nb)
dc_fcBC=dblarr(11, 11, nb)

dc_fcAB[*, *, *]=fc[*, *, 0, *]
dc_fcAC[*, *, *]=fc[*, 0, *, *]
dc_fcBC[*, *, *]=fc[0, *, *, *]

result[*, *, 0, *] = dt_fcs_dch(binT, dc_fcAB, DeadTime[0:1]  )
result[*, 0, *, *] = dt_fcs_dch(binT, dc_fcAC, [DeadTime[0], DeadTime[2]])
result[0, *, *, *] = dt_fcs_dch(binT, dc_fcBC, DeadTime[1:2] )

result[1, 1, 1, *] = fc111_dt(binT, fc, Deadtime)

result[2, 1, 1, *] = fc211_dt(binT, fc, Deadtime)

result[1, 2, 1, *] = fc211_dt(binT, fc, Deadtime, /swapAB)

result[1, 1, 2, *] = fc211_dt(binT, fc, Deadtime, /swapAC)

return, result

end