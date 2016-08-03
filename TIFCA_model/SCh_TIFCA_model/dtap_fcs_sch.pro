function dtap_fcs_sch, binT, dt_fcs, para

fc = dt_fcs
nb = n_elements(binT)

pa = para*1.D

result=dblarr(5, nb)

for i=1, 4 do begin
    case i of
        1: begin
           result[1, *] = (1.D + pa)*fc[1, *]
        end
        
        2: begin
           result[2, *] = 2*pa*fc[1, *] + (1 + pa)^2*fc[2, *]       
        end
        
        3: begin
           result[3, *] = 6*pa*(1 + pa)*fc[2, *] + (1 + pa)^3*fc[3, *]       
        end
        
        4: begin
           result[4, *] = 12*pa^2*fc[2, *] + 12*pa*(1 + pa)^2*fc[3, *] + (1 + pa)^4*fc[4, *]       
        end
    endcase
endfor 

return, result

end 