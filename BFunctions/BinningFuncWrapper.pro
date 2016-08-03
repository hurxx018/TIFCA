function BinningFuncWrapper, t, r, td, order

results=0
case order of
	0 : results=t*0.
	1:	results=t*1.
	2:	results=td^2*Binning_Func_B2(t, r, td)
	3: 	results=td^3*Binning_Func_B3(t, r, td)
	4:	results=td^4*Binning_Func_B4(t, r, td)
	5:	results=td^5*Binning_Func_B5(t, r, td)
	6:	results=td^6*Binning_Func_B6(t, r, td)
	7:	results=td^7*Binning_Func_B7(t, r, td)
	8:	results=td^8*Binning_Func_B8(t, r, td)
else: results=(td^2*Binning_Func_B2(t, r, td))^(order-1)/T^(order-2)
endcase
return, results
end