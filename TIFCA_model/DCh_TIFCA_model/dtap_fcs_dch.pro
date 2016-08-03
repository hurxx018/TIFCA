function dtap_fcs_dch, binT, dt_fcs, Para

fc = dt_fcs
nb = n_elements(binT)

PA = Para[0]*1.D
PB = Para[1]*1.D

result=dblarr(5, 5, nb)

sc_fcA=dblarr(5, nb)
sc_fcB=dblarr(5, nb)

sc_fcA[*,*]=fc[*, 0, *]
sc_fcB[*,*]=fc[0, *, *]

result[*, 0, *]=dtap_fcs_sch(binT, sc_fcA, PA)
result[0, *, *]=dtap_fcs_sch(binT, sc_fcB, PB)

result[1, 1, *]= (1.d + PA)*(1.d + PB)*fc[1, 1, *]

result[2, 1, *]= (2.d*PA*(1 + PB)*fc[1, 1, *] + (1 + PA)^2*(1 + PB)*fc[2, 1, *])
result[1, 2, *]= (2.d*PB*(1 + PA)*fc[1, 1, *] + (1 + PA)*(1 + PB)^2*fc[1, 2, *])

result[3, 1, *]= 6.D*PA*(1 + PA)*(1 + PB)*fc[2, 1, *]  + (1 + PA)^3*(1 + PB)*fc[3, 1, *]
result[2, 2, *]= PB*fc[1, 1, *] + 2.D*PA*(1 + PB)^2*fc[1, 2, *] + 2*(1 + PA)^2*PB*fc[2, 1, *] $
                 + (1 + PB)^2*(1 + PA)^2*fc[2, 2, *]
result[1, 3, *]= 6.D*PB*(1 + PA)*(1 + PB)*fc[1, 2, *]  + (1 + PA)*(1 + PB)^3*fc[1, 3, *]

return, result

end 