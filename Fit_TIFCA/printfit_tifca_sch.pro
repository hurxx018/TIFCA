function printfit_tifca_sch, fit_result_ptr


fit_paras = (*fit_result_ptr).fit_parameters
gf = (*fit_result_ptr).gf
chi2 = (*fit_result_ptr).chi2

np = n_elements(fit_paras)
nspecies = (np -4)/3

print, "r^2=", fit_paras[np-4], "  " , "f-pa=", fit_paras[np-3]
print, "DT=", fit_paras[np-2], "  " , "AP-P=", fit_paras[np-1]

print, "chi^2=", chi2 

case nspecies of 
      1: begin
          print, "Q=", gf[2]*fit_paras[0] 
          print, "r2=", gf[2], "  " , "lambda=", fit_paras[0], "  " , $
                 "td=", fit_paras[1], "  " , "N=", fit_paras[2]
      end
;      
      2: begin
          print, "Q1=", gf[2]*fit_paras[0], "  " , "Q2=", gf[2]*fit_paras[3]
          print, "r2=", gf[2], "  " , "lambda1=", fit_paras[0], "  " , $
                 "td1=", fit_paras[1], "  " , "N1=", fit_paras[2]
          print, "r2=", gf[2], "  " , "lambda2=", fit_paras[3], "  " , $
                 "td2=", fit_paras[4], "  " , "N2=", fit_paras[5]
      end

      3: begin
          print, "Q1=", gf[2]*fit_paras[0], "  " , "Q2=", gf[2]*fit_paras[3], $
                 "  " , "Q3=", gf[2]*fit_paras[6]
          print, "r2=", gf[2], "  " , "lambda1=", fit_paras[0], "  " , $
                 "td1=", fit_paras[1], "  " , "N1=", fit_paras[2]
          print, "r2=", gf[2], "  " , "lambda2=", fit_paras[3], "  " , $
                 "td2=", fit_paras[4], "  " , "N1=", fit_paras[5]
          print, "r2=", gf[2], "  " , "lambda3=", fit_paras[6], "  " , $
                 "td3=", fit_paras[7], "  " , "N3=", fit_paras[8]      
      end


endcase

return, 0

end