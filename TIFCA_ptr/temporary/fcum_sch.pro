function fcum_sch, rawdata
; rawdata -> a pointer

data = rawdata
if (size(data, /type) ne 10) then begin
    data = ptr_new(data)
endif

fcum = dblarr(9)

cum = *(cum_sch(data))

fcum[1] = cum[1]
fcum[2] = -cum[1] + cum[2]
fcum[3] = 2*cum[1] - 3*cum[2] + cum[3]
fcum[4] = -6*cum[1] + 11*cum[2] - 6*cum[3] + cum[4]
fcum[5] = 24*cum[1] - 50*cum[2] + 35*cum[3] - 10*cum[4] + cum[5]
fcum[6] = -120*cum[1] + 274*cum[2] - 225*cum[3] + 85*cum[4] - 15*cum[5] + cum[6]
fcum[7] = 720*cum[1] - 1764*cum[2] + 1624*cum[3] - 735*cum[4] + 175*cum[5] -      $
          21*cum[6] + cum[7]
fcum[8] = -5040*cum[1] + 13068*cum[2] - 13132*cum[3] +      $
          6769*cum[4] - 1960*cum[5] + 322*cum[6] - 28*cum[7] + cum[8]

result = ptr_new(fcum)

return, result

end