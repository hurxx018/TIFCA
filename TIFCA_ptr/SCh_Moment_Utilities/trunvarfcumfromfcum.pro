pro trunVarFCumFromFCum, FC, VarFC
;Calculate the variance of Factorial Cumulant from factorial cumulant
;Note:  In order to calculate the variance of k_[r], we need k_[2r]
;   The 0th element of FC and VarFC is not used
;Input:   FC[0:4]
;Output:  VarFC[0:4]

if(n_params() ne 2) then $
  message,'VarFCumFromFCum: Incorrect # of parameter'

;nfc=n_elements(FC)-1
VarFC=dblarr(4+1)
k = dblarr(9)
k[0:4]=FC

for i=1,4 do begin
  case i of
  1:  begin
      k = dblarr(9)
      k[0:1]=FC[0:1]
      VarFC[1]=k[1] + k[2]
      end
  2:  begin
      k = dblarr(9)
      k[0:2]=FC[0:2]
      VarFC[2]=(2*k[1]^2 + 2*k[2] + 4*k[1]*k[2] + 2*k[2]^2 + 4*k[3] + k[4])
      end
  3:  begin
      k = dblarr(9)
      k[0:3]=FC[0:3]
      VarFC[3]=(6*k[1]^3 + 18*k[1]^2*k[2] + 54*k[2]^2 + 6*k[2]^3 + 6*k[3] +       $
        9*k[3]^2 + 18*k[4] + 9*k[1]*((2*k[2] + 2*k[2]^2 + 4*k[3] + k[4]))     $
        + 9*k[2]*((8*k[3] + k[4])) + 9*k[5] + k[6])
      end
  4:  begin
      k = dblarr(9)
      k[0:4]=FC[0:4]
      VarFC[4]=(24*k[1]^4 + 144*k[1]^2*k[2] + 96*k[1]^3*k[2] + 72*k[2]^2 +      $
        864*k[1]*k[2]^2 + 144*k[1]^2*k[2]^2 + 720*k[2]^3 + 96*k[1]*k[2]^3 +   $
        24*k[2]^4 + 96*k[1]*k[3] + 288*k[1]^2*k[3] + 960*k[2]*k[3] +      $
        1152*k[1]*k[2]*k[3] + 864*k[2]^2*k[3] + 720*k[3]^2 + 144*k[1]*k[3]^2 +  $
          144*k[2]*k[3]^2 + 24*k[4] + 288*k[1]*k[4] + 72*k[1]^2*k[4] +      $
          936*k[2]*k[4] + 144*k[1]*k[2]*k[4] + 72*k[2]^2*k[4] + 528*k[3]*k[4] + $
          34*k[4]^2 + 96*k[5] + 144*k[1]*k[5] + 240*k[2]*k[5] + 48*k[3]*k[5] +  $
          72*k[6] + 16*k[1]*k[6] + 16*k[2]*k[6] + 16*k[7] + k[8])
      end
;  
;  5:  VarFC[5]=(120*k[1]^5 + 1200*k[1]^3*k[2] + 600*k[1]^4*k[2] + 1800*k[1]*k[2]^2 +  $
;        10800*k[1]^2*k[2]^2 + 1200*k[1]^3*k[2]^2 + 9000*k[2]^3 + 18000*k[1]*  $
;          k[2]^3 + 1200*k[1]^2*k[2]^3 + 8400*k[2]^4 + 600*k[1]*k[2]^4 +     $
;          120*k[2]^5 + 1200*k[1]^2*k[3] + 2400*k[1]^3*k[3] + 1200*k[2]*k[3] +   $
;          24000*k[1]*k[2]*k[3] + 14400*k[1]^2*k[2]*k[3] + 51600*k[2]^2*k[3] +   $
;          21600*k[1]*k[2]^2*k[3] + 9600*k[2]^3*k[3] + 6000*k[3]^2 +         $
;          18000*k[1]*k[3]^2 + 1800*k[1]^2*k[3]^2 + 41400*k[2]*k[3]^2 +      $
;          3600*k[1]*k[2]*k[3]^2 + 1800*k[2]^2*k[3]^2 + 5400*k[3]^3 +        $
;          600*k[1]*k[4] + 3600*k[1]^2*k[4] + 600*k[1]^3*k[4] + 9000*k[2]*k[4] + $
;          23400*k[1]*k[2]*k[4] + 1800*k[1]^2*k[2]*k[4] + 25800*k[2]^2*k[4] +    $
;          1800*k[1]*k[2]^2*k[4] + 600*k[2]^3*k[4] + 21000*k[3]*k[4] +       $
;          13200*k[1]*k[3]*k[4] + 19200*k[2]*k[3]*k[4] + 1500*k[3]^2*k[4] +    $
;          7000*k[4]^2 + 850*k[1]*k[4]^2 + 850*k[2]*k[4]^2 + 120*k[5]        $
;          + 2400*k[1]*k[5] + 1800*k[1]^2*k[5] + 11400*k[2]*k[5] +         $
;          6000*k[1]*k[2]*k[5] + 4200*k[2]^2*k[5] + 10800*k[3]*k[5] +        $
;          1200*k[1]*k[3]*k[5] + 1200*k[2]*k[3]*k[5] + 3100*k[4]*k[5] +      $
;          125*k[5]^2 + 600*k[6] + 1800*k[1]*k[6] + 200*k[1]^2*k[6] +        $
;          4400*k[2]*k[6] + 400*k[1]*k[2]*k[6] + 200*k[2]^2*k[6] +         $
;          1900*k[3]*k[6] + 200*k[4]*k[6] + 600*k[7] + 400*k[1]*k[7] +       $
;          600*k[2]*k[7] + 100*k[3]*k[7] + 200*k[8] + 25*k[1]*k[8] +       $
;          25*k[2]*k[8] + 25*k[9] + k[10])
;    6:  VarFC[6]=(720*k[1]^6 + 10800*k[1]^4*k[2] + 4320*k[1]^5*k[2] +           $
;          32400*k[1]^2*k[2]^2 + 129600*k[1]^3*k[2]^2 + 10800*k[1]^4*k[2]^2 +    $
;          10800*k[2]^3 + 324000*k[1]*k[2]^3 + 324000*k[1]^2*k[2]^3 +        $
;          14400*k[1]^3*k[2]^3 + 421200*k[2]^4 + 302400*k[1]*k[2]^4 +        $
;          10800*k[1]^2*k[2]^4 + 97200*k[2]^5 + 4320*k[1]*k[2]^5 + 720*k[2]^6 +  $
;        14400*k[1]^3*k[3] + 21600*k[1]^4*k[3] + 43200*k[1]*k[2]*k[3] +      $
;        432000*k[1]^2*k[2]*k[3] + 172800*k[1]^3*k[2]*k[3] + 453600*k[2]^2*k[3]+ $
;        1857600*k[1]*k[2]^2*k[3] + 388800*k[1]^2*k[2]^2*k[3] +          $
;        1699200*k[2]^3*k[3] + 345600*k[1]*k[2]^3*k[3] + 108000*k[2]^4*k[3] +  $
;        7200*k[3]^2 + 216000*k[1]*k[3]^2 + 324000*k[1]^2*k[3]^2 +         $
;        21600*k[1]^3*k[3]^2 + 1404000*k[2]*k[3]^2 + 1490400*k[1]*k[2]*k[3]^2 +  $
;        64800*k[1]^2*k[2]*k[3]^2 + 1360800*k[2]^2*k[3]^2 +            $
;        64800*k[1]*k[2]^2*k[3]^2 + 21600*k[2]^3*k[3]^2 + 626400*k[3]^3 +    $
;        194400*k[1]*k[3]^3 + 259200*k[2]*k[3]^3 + 8100*k[3]^4 +         $
;        10800*k[1]^2*k[4] + 43200*k[1]^3*k[4] + 5400*k[1]^4*k[4] +        $
;        10800*k[2]*k[4] + 324000*k[1]*k[2]*k[4] + 421200*k[1]^2*k[2]*k[4] +   $
;        21600*k[1]^3*k[2]*k[4] + 977400*k[2]^2*k[4] + 928800*k[1]*k[2]^2*k[4] + $
;        32400*k[1]^2*k[2]^2*k[4] + 550800*k[2]^3*k[4] + 21600*k[1]*k[2]^3*k[4]+ $
;        5400*k[2]^4*k[4] + 151200*k[3]*k[4] + 756000*k[1]*k[3]*k[4] +     $
;        237600*k[1]^2*k[3]*k[4] + 2462400*k[2]*k[3]*k[4] +            $
;        691200*k[1]*k[2]*k[3]*k[4] + 453600*k[2]^2*k[3]*k[4] +          $
;        820800*k[3]^2*k[4] + 54000*k[1]*k[3]^2*k[4] + 54000*k[2]*k[3]^2*k[4] +  $
;        189000*k[4]^2 + 252000*k[1]*k[4]^2 + 15300*k[1]^2*k[4]^2 +        $
;        512100*k[2]*k[4]^2 + 30600*k[1]*k[2]*k[4]^2 + 15300*k[2]^2*k[4]^2 +   $
;        174600*k[3]*k[4]^2 + 4950*k[4]^3 + 4320*k[1]*k[5] + 43200*k[1]^2*k[5] + $
;        21600*k[1]^3*k[5] + 90720*k[2]*k[5] + 410400*k[1]* k[2]*k[5] +      $
;        108000*k[1]^2*k[2]*k[5] + 626400*k[2]^2*k[5] + 151200*k[1]*k[2]^2*k[5]+ $
;        64800*k[2]^3*k[5] + 302400*k[3]*k[5] + 388800*k[1]*k[3]*k[5] +      $
;        21600*k[1]^2*k[3]*k[5] + 777600*k[2]*k[3]*k[5] +            $
;        43200*k[1]*k[2]*k[3]*k[5] + 21600*k[2]^2*k[3]*k[5] +          $
;        129600*k[3]^2*k[5] + 302400*k[4]*k[5] + 111600*k[1]*k[4]*k[5] +     $
;        154800*k[2]*k[4]*k[5] + 21600*k[3]*k[4]*k[5] + 56700*k[5]^2 +       $
;        4500*k[1]*k[5]^2 + 4500*k[2]*k[5]^2 + 720*k[6] + 21600*k[1]*k[6] +    $
;        32400*k[1]^2*k[6] + 2400*k[1]^3*k[6] + 140400*k[2]*k[6] +         $
;        158400*k[1]*k[2]*k[6] + 7200*k[1]^2*k[2]*k[6] + 151200*k[2]^2*k[6] +  $
;        7200*k[1]*k[2]^2*k[6] + 2400*k[2]^3*k[6] + 196800*k[3]*k[6] +       $
;        68400*k[1]*k[3]*k[6] + 93600*k[2]*k[3]*k[6] + 6300*k[3]^2*k[6] +    $
;        93600*k[4]*k[6] + 7200*k[1]*k[4]*k[6] + 7200*k[2]*k[4]*k[6] +       $
;        16560*k[5]*k[6] + 461*k[6]^2 + 4320*k[7] + 21600*k[1]*k[7] +      $
;        7200*k[1]^2*k[7] + 72000*k[2]*k[7] + 21600*k[1]*k[2]*k[7] +       $
;        14400*k[2]^2*k[7] + 50400*k[3]*k[7] + 3600*k[1]*k[3]*k[7] +       $
;        3600*k[2]*k[3]*k[7] + 11520*k[4]*k[7] + 780*k[5]*k[7] + 5400*k[8] +   $
;        7200*k[1]*k[8] + 450*k[1]^2*k[8] + 14850*k[2]*k[8] + 900*k[1]*k[2]*k[8]+ $
;        450*k[2]^2*k[8] + 5220*k[3]*k[8] + 465*k[4]*k[8] + 2400*k[9] +      $
;        900*k[1]*k[9] + 1260*k[2]*k[9] + 180*k[3]*k[9] + 450*k[10] +      $
;        36*k[1]*k[10] + 36*k[2]*k[10] + 36*k[11] + k[12])
;  7: VarFC[7]=(5040*k[1]^7 + 105840*k[1]^5*k[2] + 35280*k[1]^6*k[2] +         $
;        529200*k[1]^3*k[2]^2 + 1587600*k[1]^4*k[2]^2 + 105840*k[1]^5*k[2]^2 +   $
;        529200*k[1]*k[2]^3 + 7938000*k[1]^2*k[2]^3 + 5292000*k[1]^3*k[2]^3 +  $
;        176400*k[1]^4*k[2]^3 + 3704400*k[2]^4 + 20638800*k[1]*k[2]^4 +      $
;        7408800*k[1]^2*k[2]^4 + 176400*k[1]^3*k[2]^4 + 13230000*k[2]^5 +    $
;        4762800*k[1]*k[2]^5 + 105840*k[1]^2*k[2]^5 + 1164240*k[2]^6 +       $
;        35280*k[1]*k[2]^6 + 5040*k[2]^7 + 176400*k[1]^4*k[3] +          $
;        211680*k[1]^5*k[3] + 1058400*k[1]^2*k[2]*k[3] +             $
;        7056000*k[1]^3*k[2]*k[3] +2116800*k[1]^4*k[2]*k[3] +          $
;        529200*k[2]^2*k[3] + 22226400*k[1]*k[2]^2*k[3] +            $
;        45511200*k[1]^2*k[2]^2*k[3] + 6350400*k[1]^3*k[2]^2*k[3] +        $
;        56095200*k[2]^3*k[3] + 83260800*k[1]*k[2]^3*k[3] +            $
;        8467200*k[1]^2*k[2]^3*k[3] + 44629200*k[2]^4*k[3] +           $
;        5292000*k[1]*k[2]^4*k[3] + 1270080*k[2]^5*k[3] + 352800*k[1]*k[3]^2 + $
;        5292000*k[1]^2*k[3]^2 + 5292000*k[1]^3*k[3]^2 + 264600*k[1]^4*k[3]^2 +  $
;        9878400*k[2]*k[3]^2 + 68796000*k[1]*k[2]*k[3]^2 +             $
;        36514800*k[1]^2*k[2]*k[3]^2 + 1058400*k[1]^3*k[2]*k[3]^2 +        $
;        134152200*k[2]^2*k[3]^2 + 66679200*k[1]*k[2]^2*k[3]^2 +         $
;        1587600*k[1]^2*k[2]^2*k[3]^2 + 35456400*k[2]^3*k[3]^2 +         $
;        1058400*k[1]*k[2]^3*k[3]^2 + 264600*k[2]^4*k[3]^2 + 14817600*k[3]^3 +   $
;        30693600*k[1]*k[3]^3 + 4762800*k[1]^2*k[3]^3 + 76734000*k[2]*k[3]^3 +   $
;        12700800*k[1]*k[2]*k[3]^3 + 7938000*k[2]^2*k[3]^3 + 9525600*k[3]^4 +  $
;        396900*k[1]*k[3]^4 + 396900*k[2]*k[3]^4 + 176400*k[1]^3*k[4] +      $
;        529200*k[1]^4*k[4] + 52920*k[1]^5*k[4] + 529200*k[1]*k[2]*k[4] +    $
;        7938000*k[1]^2*k[2]*k[4] + 6879600*k[1]^3*k[2]*k[4] +           $
;        264600*k[1]^4*k[2]*k[4] + 7408800*k[2]^2*k[4] + 47892600*k[1]*k[2]^2*k[4] + $
;        22755600*k[1]^2*k[2]^2*k[4] + 529200*k[1]^3*k[2]^2*k[4] +         $
;        59535000*k[2]^3*k[4] + 26989200*k[1]*k[2]^3*k[4] + 529200*k[1]^2*k[2]^3*k[4] +  $
;        10584000*k[2]^4*k[4] + 264600*k[1]*k[2]^4*k[4] + 52920*k[2]^5*k[4] +  $
;        176400*k[3]*k[4] + 7408800*k[1]*k[3]*k[4] + 18522000*k[1]^2*k[3]*k[4] + $
;        3880800*k[1]^3*k[3]*k[4] + 62974800*k[2]*k[3]*k[4] + 120657600*k[1]*k[2]*k[3]*k[4] +  $
;        16934400*k[1]^2*k[2]*k[3]*k[4] + 146588400*k[2]^2*k[3]*k[4] +       $
;        22226400*k[1]*k[2]^2*k[3]*k[4] + 9172800*k[2]^3*k[3]*k[4] +       $
;        59711400*k[3]^2*k[4] + 40219200*k[1]*k[3]^2*k[4] +            $
;        1323000*k[1]^2*k[3]^2*k[4] + 70119000*k[2]*k[3]^2*k[4] +        $
;        2646000*k[1]*k[2]*k[3]^2*k[4] + 1323000*k[2]^2*k[3]^2*k[4] +      $
;        6262200*k[3]^3*k[4] + 1234800*k[4]^2 + 9261000* k[1]*k[4]^2 +       $
;        6174000*k[1]^2*k[4]^2 + 249900*k[1]^3*k[4]^2 + 40131000*k[2]*k[4]^2 +   $
;        25092900*k[1]*k[2]*k[4]^2 + 749700*k[1]^2*k[2]*k[4]^2 +         $
;        21476700*k[2]^2*k[4]^2 + 749700*k[1]*k[2]^2*k[4]^2 + 249900*k[2]^3*k[4]^2 + $
;        39939900*k[3]*k[4]^2 + 8555400*k[1]*k[3]*k[4]^2 + 11113200*k[2]*k[3]*k[4]^2 + $
;        639450*k[3]^2*k[4]^2 + 4806900*k[4]^3 + 242550*k[1]*k[4]^3 +      $
;        242550*k[2]*k[4]^3 + 105840*k[1]^2*k[5] + 705600*k[1]^3*k[5] +      $
;        264600*k[1]^4*k[5] + 105840*k[2]*k[5] + 4445280*k[1]*k[2]*k[5] +    $
;        10054800*k[1]^2*k[2]*k[5] + 1764000*k[1]^3*k[2]* k[5] +         $
;        17834040*k[2]^2*k[5] + 30693600*k[1]*k[2]^2*k[5] +            $
;        3704400*k[1]^2*k[2]^2*k[5] + 23814000* k[2]^3*k[5] +          $
;        3175200*k[1]*k[2]^3*k[5] + 970200*k[2]^4*k[5] + 1975680*k[3]*k[5] +   $
;        14817600*k[1]*k[3]*k[5] + 9525600*k[1]^2*k[3]*k[5] + 352800*k[1]^3*k[3]*k[5] +  $
;        63151200*k[2]*k[3]*k[5] + 38102400*k[1]*k[2]*k[3]*k[5] +        $
;        1058400*k[1]^2*k[2]*k[3]*k[5] + 32281200*k[2]^2*k[3]*k[5] +       $
;        1058400*k[1]*k[2]^2*k[3]*k[5] + 352800*k[2]^3*k[3]*k[5] +         $
;        30781800*k[3]^2*k[5] + 6350400*k[1]*k[3]^2*k[5] + 8202600*k[2]*k[3]^2*k[5] +  $
;        308700*k[3]^3*k[5] + 6667920*k[4]*k[5] + 14817600*k[1]*k[4]*k[5] +    $
;        2734200*k[1]^2*k[4]*k[5] + 39601800*k[2]*k[4]*k[5] +          $
;        7585200*k[1]*k[2]*k[4]*k[5] + 4851000*k[2]^2*k[4]*k[5] +        $
;        21785400*k[3]*k[4]*k[5] + 1058400*k[1]*k[3]*k[4]*k[5] +         $
;        1058400*k[2]*k[3]*k[4]*k[5] + 2021250*k[4]^2*k[5] + 3704400*k[5]^2 +  $
;        2778300*k[1]*k[5]^2 + 110250*k[1]^2*k[5]^2 + 5093550*k[2]*k[5]^2 +    $
;        220500*k[1]*k[2]*k[5]^2 + 110250*k[2]^2*k[5]^2 + 1499400*k[3]*k[5]^2 +  $
;        113925*k[4]*k[5]^2 + 35280*k[1]*k[6] + 529200*k[1]^2*k[6] +       $
;        529200*k[1]^3*k[6] + 29400*k[1]^4*k[6] + 987840*k[2]*k[6] +       $
;        6879600*k[1]*k[2]*k[6] + 3880800*k[1]^2*k[2]*k[6] +           $
;        117600*k[1]^3*k[2]*k[6] + 13847400*k[2]^2*k[6] + 7408800*k[1]*k[2]^2*k[6] + $
;        176400*k[1]^2*k[2]^2*k[6] + 4057200*k[2]^3*k[6] + 117600*k[1]*k[2]^3*k[6] + $
;        29400* k[2]^4*k[6] + 4445280*k[3]*k[6] + 9643200*k[1]*k[3]*k[6] +     $
;        1675800*k[1]^2*k[3]*k[6] + 25254600*k[2]*k[3]*k[6] +          $
;        4586400*k[1]*k[2]*k[3]*k[6] + 2910600*k[2]^2*k[3]*k[6] +        $
;        6756120*k[3]^2*k[6] + 308700*k[1]*k[3]^2*k[6] + 308700*k[2]*k[3]^2*k[6] + $
;        6174000*k[4]*k[6] + 4586400*k[1]*k[4]*k[6] + 176400*k[1]^2*k[4]*k[6] +    $
;        8361360*k[2]*k[4]*k[6] + 352800*k[1]*k[2]*k[4]*k[6] +           $
;        176400*k[2]^2*k[4]*k[6]+ 2437260*k[3]*k[4]*k[6] + 91630*k[4]^2*k[6] +   $
;        3395700*k[5]*k[6] + 811440*k[1]*k[5]*k[6] + 1078980*k[2]*k[5]*k[6] +  $
;        133770*k[3]*k[5]*k[6] + 407484*k[6]^2 + 22589*k[1]*k[6]^2 +       $
;        22589*k[2]*k[6]^2 + 5040*k[7] + 211680*k[1]*k[7] + 529200*k[1]^2*k[7] + $
;        117600*k[1]^3*k[7] + 1799280*k[2]*k[7] + 3528000*k[1]*k[2]*k[7] +     $
;        529200*k[1]^2*k[2]*k[7] + 4410000*k[2]^2*k[7] + 705600*k[1]*k[2]^2*k[7] + $
;        294000*k[2]^3*k[7] + 3469200*k[3]*k[7] + 2469600*k[1]*k[3]*k[7] +     $
;        88200*k[1]^2*k[3]*k[7] + 4427640*k[2]*k[3]*k[7] + 176400*k[1]*k[2]*k[3]*k[7] +  $
;        88200*k[2]^2*k[3]*k[7] + 626220*k[3]^2*k[7] + 2410800*k[4]*k[7] +     $
;        564480*k[1]*k[4]*k[7] + 746760*k[2]*k[4]*k[7] + 91140*k[3]*k[4]*k[7] +  $
;        696780*k[5]*k[7] + 38220*k[1]*k[5]*k[7] + 38220*k[2]*k[5]*k[7] +    $
;        83986*k[6]*k[7] + 1715*k[7]^2 + 35280*k[8] + 264600*k[1]*k[8] +     $
;        176400*k[1]^2*k[8] + 7350*k[1]^3*k[8] + 1146600*k[2]*k[8] +       $
;        727650*k[1]*k[2]*k[8] + 22050*k[1]^2*k[2]*k[8] + 630630*k[2]^2*k[8] +   $
;        22050*k[1]*k[2]^2*k[8] + 7350*k[2]^3*k[8] + 1153950*k[3]*k[8] +     $
;        255780*k[1]*k[3]*k[8] + 335160*k[2]*k[3]*k[8] + 19845*k[3]^2*k[8] +   $
;        427770*k[4]*k[8] + 22785*k[1]*k[4]*k[8] + 22785*k[2]*k[4]*k[8] +    $
;        62475*k[5]*k[8] + 2989*k[6]*k[8] + 52920*k[9] + 117600*k[1]* k[9] +   $
;        22050*k[1]^2*k[9] + 316050*k[2]*k[9] + 61740*k[1]*k[2]*k[9] +       $
;        39690*k[2]^2*k[9] + 176400*k[3]*k[9] + 8820*k[1]*k[3]*k[9] +      $
;        8820*k[2]*k[3]*k[9] + 33565*k[4]*k[9] + 1960*k[5]*k[9] + 29400*k[10] +  $
;        22050*k[1]*k[10] + 882*k[1]^2*k[10] + 40572*k[2]*k[10] +        $
;        1764*k[1]*k[2]*k[10] + 882*k[2]^2*k[10] + 12054*k[3]*k[10] +      $
;        931*k[4]*k[10] + 7350*k[11] + 1764*k[1]*k[11] + 2352*k[2]*k[11] +     $
;        294*k[3]*k[11] + 882*k[12] + 49*k[1]*k[12] + 49*k[2]*k[12] + 49*k[13] + k[14])
;  8:  VarFC[8]=0        ;Think it is not useful. Haven't implemented yet
;  9:  VarFC[9]=0
;  10: VarFC[10]=0
  else:   message,'VarFCumFromFCum: Cannot handle the variance of the order'
  endcase
endfor
end
