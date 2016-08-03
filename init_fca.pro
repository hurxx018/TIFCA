pro Init_FCA
common FCA_Binning_Func_Table, B3, B4, B5, B6, B7, B8
;common SetPathFCA, _exePath, _dataPath

if((strcmp(findfile('D:\IDL_KH\TIFCA\BF_Tables\Binning_Func_B3_Table.dat'),''))[0] eq 0) then begin
    restore,'D:\IDL_KH\TIFCA\BF_Tables\Binning_Func_B3_Table.dat'
    restore,'D:\IDL_KH\TIFCA\BF_Tables\Binning_Func_B4_Table.dat'
    restore,'D:\IDL_KH\TIFCA\BF_Tables\Binning_Func_B5_Table.dat'
    restore,'D:\IDL_KH\TIFCA\BF_Tables\Binning_Func_B6_Table.dat'
    restore,'D:\IDL_KH\TIFCA\BF_Tables\Binning_Func_B7_Table.dat'
    restore,'D:\IDL_KH\TIFCA\BF_Tables\Binning_Func_B8_Table.dat'
endif else begin
    if((strcmp(findfile(!BinIDLPath+'\FCA\BinningFunc\Binning_Func_B3_Table.dat'),''))[0] eq 0) then begin
;       restore, !BinIDLPath+'\FCA\BinningFunc\Binning_Func_B3_Table.dat'
;       restore, !BinIDLPath+'\FCA\BinningFunc\Binning_Func_B4_Table.dat'
;       restore, !BinIDLPath+'\FCA\BinningFunc\Binning_Func_B5_Table.dat'
;       restore, !BinIDLPath+'\FCA\BinningFunc\Binning_Func_B6_Table.dat'
;       restore, !BinIDLPath+'\FCA\BinningFunc\Binning_Func_B7_Table.dat'
;       restore, !BinIDLPath+'\FCA\BinningFunc\Binning_Func_B8_Table.dat'
    endif else begin
       message,'Cannot load the FCA_Binning_Func_Table'
    endelse
endelse

;dataPath='C:\public\LocalIDL\FCA\tables\'
;exePath='C:\public\LocalIDL\FCA\exe\'

;set_gamma_factor,/default
end