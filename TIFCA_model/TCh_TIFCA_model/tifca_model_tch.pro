function tifca_model_tch, binT, para
;Calculate the triple-channel factorial cumulants based on thd Markov-process model
;for describing the diffusion of particles.
;Add the corrections due to the dead-time and afterpulsing effects
;
; Employ the three steps
; i) calculate the ideal FCs.
; ii) correct the dead-time effects up to the third order corrections ( delta^3)
; iii) correct the after-pulsing corrections


; para=[lambdaA1, lambdaB1, lambdaC1, td1, N1, lambdaA2, lambdaB2, lambdaC2, td2, N2, ..., 
; r2, f, DT_A, DT_B, DT_C, AP_Pro_A, AP_Pro_B, AP_Pro_C]

nb=n_elements(binT)
np=n_elements(para)

ideal_fcs = dblarr(11, 11, 11, nb)
dt_fcs = dblarr(5, 5, 5, nb)
dtap_fcs = dblarr(5, 5, 5, nb)

result = dblarr(5, 5, 5, nb)  ; [0,0,0] -> 0, [1,0,0]-> first, [2,0,0]->second, ..., [4,0,0]->fourth

para0=para[0:np-1-6]

ideal_fcs = ideal_fcs_tch(binT, para0)
dt_fcs = dt_fcs_tch(binT, ideal_fcs, para[np-6:np-4])
dtap_fcs = dtap_fcs_tch(binT, dt_fcs, para[np-3:np-1] )

result=dtap_fcs[0:4, 0:4, 0:4, *]

return, result

end