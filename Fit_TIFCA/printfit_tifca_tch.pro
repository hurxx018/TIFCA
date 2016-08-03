function printfit_tifca_tch, fit_result_ptr

fit_paras = (*fit_result_ptr).fit_parameters
gf = (*fit_result_ptr).gf

np = n_elements(fit_paras)
nspecies = (np -8)/5

print, "r^2=", fit_paras[np-8], " ", "f-pa=", fit_paras[np-7]
print, "DT_A=", fit_paras[np-6], " ", "AP-P_A=", fit_paras[np-3]
print, "DT_B=", fit_paras[np-5], " ", "AP-P_B=", fit_paras[np-2]
print, "DT_C=", fit_paras[np-4], " ", "AP-P_C=", fit_paras[np-1]

print, "chi^2=", (*fit_result_ptr).chi2 

case nspecies of 
      1: begin
          print, "r2=", gf[2], " ", "lambda_A=", fit_paras[0], " ", $
                 "lambda_B=", fit_paras[1], " ", "lambda_C=", fit_paras[2], " ", $
                 "td=", fit_paras[3], " ", "N=", fit_paras[4]
      end
;      
      2: begin
          print, "r2=", gf[2], " ", "lambda1_A=", fit_paras[0], " ", $
                 "lambda1_B=", fit_paras[1], " ", "lambda1_C=", fit_paras[2], " ", $
                 "td1=", fit_paras[3], " ", "N1=", fit_paras[4]
          print, "r2=", gf[2], " ", "lambda2_A=", fit_paras[5], " ", $
                 "lambda2_B=", fit_paras[6], " ", "lambda2_C=", fit_paras[7], " ", $
                 "td2=", fit_paras[8], " ", "N2=", fit_paras[9]
      end

      3: begin
          print, "r2=", gf[2], " ", "lambda1_A=", fit_paras[0], " ", $
                 "lambda1_B=", fit_paras[1], " ", "lambda1_C=", fit_paras[2], " ", $
                 "td1=", fit_paras[3], " ", "N1=", fit_paras[4]
          print, "r2=", gf[2], " ", "lambda2_A=", fit_paras[5], " ", $
                 "lambda2_B=", fit_paras[6], " ", "lambda2_C=", fit_paras[7], " ", $
                 "td2=", fit_paras[8], " ", "N2=", fit_paras[9]
          print, "r2=", gf[2], " ", "lambda3_A=", fit_paras[10], " ", $
                 "lambda3_B=", fit_paras[11], " ", "lambda3_C=", fit_paras[12], " ", $
                 "td3=", fit_paras[13], " ", "N3=", fit_paras[14]
      end

endcase

return, 0

end