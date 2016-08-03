function tifca_model_sch, binT, para
; Calculate the single-channel factorial cumulants based on thd Markov-process model
;for describing the diffusion of particles.
;Add the corrections due to the dead-time and afterpulsing effects
;
; Employ the three steps
; i) calculate the ideal FCs.
; ii) correct the dead-time effects up to the third order corrections ( delta^3)
; iii) correct the after-pulsing corrections


; para=[lambda1, td1, N1, lambda2, td2, N2, ..., r2, f, DT, AP_Pro]

nb=n_elements(binT)
np=n_elements(para)

ideal_fcs = dblarr(11, nb)
dt_fcs = dblarr(11, nb)
dtap_fcs = dblarr(11, nb)

result = dblarr(5, nb)  ; 0 -> 0, 1-> first, 2->second, ..., 4->fourth

para0=para[0:np-1-2]

ideal_fcs = ideal_fcs_sch(binT, para0)
dt_fcs = dt_fcs_sch(binT, ideal_fcs, para[np-2])
dtap_fcs = dtap_fcs_sch(binT, dt_fcs, para[np-1] )

result=dtap_fcs[0:4, *]

return, result

end