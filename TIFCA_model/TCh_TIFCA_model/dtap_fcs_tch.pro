function dtap_fcs_tch, binT, dt_fcs, para

fc = dt_fcs
nb = n_elements(binT)

PA = Para[0]*1.D
PB = Para[1]*1.D
PC = Para[2]*1.D

result=dblarr(5, 5, 5, nb)

dc_fcAB=dblarr(5, 5, nb)
dc_fcAC=dblarr(5, 5, nb)
dc_fcBC=dblarr(5, 5, nb)

dc_fcAB[*,*,*]=fc[*, *, 0, *]
dc_fcAC[*,*,*]=fc[*, 0, *, *]
dc_fcBC[*,*,*]=fc[0, *, *, *]

result[*, *, 0, *]=DTAP_FCs_dch(binT, dc_fcAB, [PA, PB])
result[*, 0, *, *]=DTAP_FCs_dch(binT, dc_fcAC, [PA, PC])
result[0, *, *, *]=DTAP_FCs_dch(binT, dc_fcBC, [PB, PC])

result[1, 1, 1, *]= (1 + PA)*(1 + PB)*(1 + PC)*fc[1, 1, 1, *]

result[2, 1, 1, *]= 2*PA*(1 + PB)*(1 + PC)*fc[1, 1, 1, *] $
                    + (1 + PA)^2*(1 + PB)*(1 + PC)*fc[2, 1, 1, *]
result[1, 2, 1, *]= 2*(1 + PA)*PB*(1 + PC)*fc[1, 1, 1, *] $
                    + (1 + PA)*(1 + PB)^2*(1 + PC)*fc[1, 2, 1, *]
result[1, 1, 2, *]= 2*(1 + PA)*(1 + PB)*PC*fc[1, 1, 1, *] $
                    + (1 + PA)*(1 + PB)*(1 + PC)^2*fc[1, 1, 2, *]

return, result

end 