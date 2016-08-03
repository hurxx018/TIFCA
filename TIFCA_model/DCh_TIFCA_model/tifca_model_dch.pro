function tifca_model_dch, binT, para
;Calculate the dual-channel factorial cumulants based on thd Markov-process model
;for describing the diffusion of particles.
;Add the corrections due to the dead-time and afterpulsing effects
;
; Employ the three steps
; i) calculate the ideal FCs.
; ii) correct the dead-time effects up to the third order corrections ( delta^3)
; iii) correct the after-pulsing corrections


; para=[lambdaA1, lambdaB1, td1, N1, lambdaA2, lambdaB2, td2, N2, ..., 
; r2, f, DT1, DT2, AP_Pro1, AP_Pro2]

nb=n_elements(binT)
np=n_elements(para)

ideal_fcs = dblarr(11, 11, nb)
dt_fcs = dblarr(5, 5, nb)
dtap_fcs = dblarr(5, 5, nb)

result = dblarr(5, 5, nb)  ; 0 -> 0, [1,0]-> first, [2,0]->second, ..., [4,0]->fourth

para0=para[0:np-1-4]

ideal_fcs = ideal_fcs_dch(binT, para0)
dt_fcs = dt_fcs_dch(binT, ideal_fcs, para[np-4:np-3])
dtap_fcs = dtap_fcs_dch(binT, dt_fcs, para[np-2:np-1] )

result=DTAP_fcs[0:4, 0:4, *]

return, result

end