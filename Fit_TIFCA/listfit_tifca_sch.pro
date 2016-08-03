function listfit_tifca_sch, fit_result_ptr, save_ptr, filename=filename

if (size(fit_result_ptr, /type) eq 10) then begin
    fit_result_ptr = fit_result_ptr
endif else begin
    fit_result_ptr = ptr_new(fit_result_ptr)
endelse

if ~tag_exist( *fit_result_ptr, 'ID' ) then begin 
    error = 1
    errmsg = 'Missing the sch tifca-fit ID tag'
    return, error
endif else begin
    fit_id = (*fit_result_ptr).ID
    if ~strcmp(fit_id, 'fitresult_of_tifca_sch',22) then begin
      print, 'Input does not include a fit result of sch tifca.'
      return, 1
    endif
endelse

if keyword_set(filename) then begin
    file = filename
endif else begin
    file = "no file"
endelse

gf = (*fit_result_ptr).gf
fit_para = (*fit_result_ptr).fit_parameters
chi2 = (*fit_result_ptr).chi2

species = (n_elements(fit_para) - 4 )/3
; take into account the number of species.......
; 
result = ptrarr(4, /allocate_heap)  ; result[1] -> for single species
                                    ; result[2] -> for double species
                                    ; result[3] -> for triple species

if (n_elements(save_ptr) eq 0) then begin
    res1 = strarr(12, 1)
    res1[0, 0] = 'file' & res1[1, 0] = 'lambda1(MHz)'
    res1[2, 0] = 'Td1(us)' & res1[3, 0] = 'N1'
    res1[4, 0] = 'r^2' & res1[5, 0] = 'f-para'
    res1[6, 0] = 'DT' & res1[7, 0] = 'Pa'
    res1[8, 0] = 'chi2' & res1[9, 0] = 'gamma2'
    res1[10, 0] = 'gamma3' & res1[11, 0] = 'gamma4'

    res2 = strarr(12 + 3, 1)
    res2[0, 0] = 'file' & res2[1, 0] = 'lambda1(MHz)'
    res2[2, 0] = 'Td1(us)' & res2[3, 0] = 'N1'
    res2[4, 0] = 'lambda2(MHz)' & res2[5, 0] = 'Td2(us)'
    res2[6, 0] = 'N2'
    res2[7, 0] = 'r^2' & res2[8, 0] = 'f-para'
    res2[9, 0] = 'DT' & res2[10, 0] = 'Pa'
    res2[11, 0] = 'chi2' & res2[12, 0] = 'gamma2'
    res2[13, 0] = 'gamma3' & res2[14, 0] = 'gamma4'
    
    res3 = strarr(12 + 6, 1)
    res3[0, 0] = 'file' & res3[1, 0] = 'lambda1(MHz)'
    res3[2, 0] = 'Td1(us)' & res3[3, 0] = 'N1'
    res3[4, 0] = 'lambda2(MHz)' & res3[5, 0] = 'Td2(us)'
    res3[6, 0] = 'N2' & res3[7, 0] = 'lambda3(MHz)' 
    res3[8, 0] = 'Td3(us)' & res3[9, 0] = 'N3'
    res3[10, 0] = 'r^2' & res3[11, 0] = 'f-para'
    res3[12, 0] = 'DT' & res3[13, 0] = 'Pa'
    res3[14, 0] = 'chi2' & res3[15, 0] = 'gamma2'
    res3[16, 0] = 'gamma3' & res3[17, 0] = 'gamma4'
endif else begin
    res1 = *save_ptr[1]
    res2 = *save_ptr[2]
    res3 = *save_ptr[3]
endelse

case species of
  1 : begin
      temp = strarr(12)
      temp[0] = file
      temp[1:7] = fit_para
      temp[8] = chi2
      temp[9:11] = gf[2:4]

      info = size(res1)
      if (info[0] eq 1) then begin
        tempres = strarr(info[1], 2)
        tempres[*, 0] = res1
        tempres[*, 1] = temp
      endif else begin
        tempres = strarr(info[1], info[2]+1)
        tempres[*, 0:(info[2]-1)] = res1
        tempres[*, info[2]] = temp
      endelse
      res1 = tempres
  end
  
  2: begin
      temp = strarr(12 + 3)
      temp[0] = file
      temp[1:10] = fit_para
      temp[11] = chi2
      temp[12:14] = gf[2:4]

      info = size(res2)
      if (info[0] eq 1) then begin
        tempres = strarr(info[1], 2)
        tempres[*, 0] = res2
        tempres[*, 1] = temp
      endif else begin
        tempres = strarr(info[1], info[2]+1)
        tempres[*, 0:(info[2]-1)] = res2
        tempres[*, info[2]] = temp
      endelse
      res2 = tempres
  end
  
  3: begin
      temp = strarr(12 + 6)
      temp[0] = file
      temp[1:13] = fit_para
      temp[14] = chi2
      temp[15:17] = gf[2:4]

      info = size(res3)
      if (info[0] eq 1) then begin
        tempres = strarr(info[1], 2)
        tempres[*, 0] = res3
        tempres[*, 1] = temp
      endif else begin
        tempres = strarr(info[1], info[2]+1)
        tempres[*, 0:(info[2]-1)] = res3
        tempres[*, info[2]] = temp
      endelse      
      res3 = tempres
  end
endcase

result[1] = ptr_new(res1)
result[2] = ptr_new(res2)
result[3] = ptr_new(res3)

return, result

end