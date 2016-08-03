function momvarfcum_dch



varfcum[1, 1] = fcum[0, 1]* fcum[1, 0] + fcum[0, 2]* fcum[1, 0] + fcum[1, 1] + $
                fcum[1, 1]^2 + fcum[1, 2] + fcum[0, 1]*fcum[2, 0] + $
                fcum[0, 2]* fcum[2, 0] + fcum[2, 1] + fcum[2, 2]
                
varfcum[2, 1] = 2* fcum[0, 1]* fcum[1, 0]^2 + 2* fcum[0, 2]* fcum[1, 0]^2 + $
                4* fcum[1, 0]* fcum[1, 1] + 4* fcum[1, 1]^2 + $
                4* fcum[1, 0]* fcum[1, 1]^2 + 4* fcum[1, 0]* fcum[1, 2] + $
                2* fcum[0, 1]* fcum[2, 0] + 2* fcum[0, 2]* fcum[2, 0] + $
                4* fcum[0, 1]* fcum[1, 0]* fcum[2, 0] + $
                4* fcum[0, 2]* fcum[1, 0]* fcum[2, 0] + 12* fcum[1, 1]* fcum[2, 0] + $
                4* fcum[1, 1]^2* fcum[2, 0] + 12* fcum[1, 2]* fcum[2, 0] + $
                2* fcum[0, 1]* fcum[2, 0]^2 + 2* fcum[0, 2]* fcum[2, 0]^2 + $
                2* fcum[2, 1] + 4* fcum[1, 0]* fcum[2, 1] + 16* fcum[1, 1]* fcum[2, 1] + $
                4* fcum[2, 0]* fcum[2, 1] + 5* fcum[2, 1]^2 + 2v fcum[2, 2] + $
                4* fcum[1, 0]* fcum[2, 2] + 4* fcum[2, 0]* fcum[2, 2] + $
                4* fcum[0, 1]* fcum[3, 0] + 4* fcum[0, 2]* fcum[3, 0] + $
                4* fcum[1, 1]* fcum[3, 0] + 4* fcum[1, 2]* fcum[3, 0] + 4* fcum[3, 1] + $
                4* fcum[1, 1]* fcum[3, 1] + 4* fcum[3, 2] + fcum[0, 1]* fcum[4, 0] + $
                fcum[0, 2]* fcum[4, 0] + fcum[4, 1] + fcum[4, 2]

varfcum[1, 2] = 2* fcum[0, 1]^2* fcum[1, 0] + 2* fcum[0, 2]* fcum[1, 0] + $
                4* fcum[0, 1]* fcum[0, 2]* fcum[1, 0] + 2* fcum[0, 2]^2* fcum[1, 0] + $
                4* fcum[0, 3]* fcum[1, 0] + fcum[0, 4]* fcum[1, 0] + $
                4* fcum[0, 1]* fcum[1, 1] + 12* fcum[0, 2]* fcum[1, 1] + $
                4* fcum[0, 3]* fcum[1, 1] + 4* fcum[1, 1]^2 + $
                4* fcum[0, 1]* fcum[1, 1]^2 + 4* fcum[0, 2]* fcum[1, 1]^2 + $
                2* fcum[1, 2] + 4* fcum[0, 1]* fcum[1, 2] + 4* fcum[0, 2]* fcum[1, 2] + $
                16* fcum[1, 1]* fcum[1, 2] + 5* fcum[1, 2]^2 + 4* fcum[1, 3] + $ 
                4* fcum[1, 1]* fcum[1, 3] + fcum[1, 4] + 2* fcum[0, 1]^2* fcum[2, 0] + $
                2* fcum[0, 2]* fcum[2, 0] + 4* fcum[0, 1]* fcum[0, 2]* fcum[2, 0] + $
                2* fcum[0, 2]^2* fcum[2, 0] + 4* fcum[0, 3]* fcum[2, 0] + $
                fcum[0, 4]* fcum[2, 0] + 4* fcum[0, 1]* fcum[2, 1] + $
                12* fcum[0, 2]* fcum[2, 1] + 4* fcum[0, 3]* fcum[2, 1] + 2* fcum[2, 2] + $
                4* fcum[0, 1]* fcum[2, 2] + 4* fcum[0, 2]* fcum[2, 2] + 4* fcum[2, 3] + $
                fcum[2, 4]

varfcum[3, 1] = 6* fcum[0, 1]v fcum[1, 0]^3 + 6* fcum[0, 2] fcum[1, 0]^3 + $
                18* fcum[1, 0]^2* fcum[1, 1] + 36* fcum[1, 0] fcum[1, 1]^2 + $
                18* fcum[1, 0]^2* fcum[1, 1]^2 + 18* fcum[1, 0]^2 fcum[1, 2] + $
                18* fcum[0, 1]* fcum[1, 0]* fcum[2, 0] + $
                18* fcum[0, 2]* fcum[1, 0]* fcum[2, 0] + $
                18* fcum[0, 1]* fcum[1, 0]^2* fcum[2, 0] + $
                18* fcum[0, 2]* fcum[1, 0]^2* fcum[2, 0] + 18* fcum[1, 1]* fcum[2, 0] + $
                108* fcum[1, 0]* fcum[1, 1]* fcum[2, 0] + 126* fcum[1, 1]^2* fcum[2, 0] + $
                36* fcum[1, 0]* fcum[1, 1]^2* fcum[2, 0] + 18* fcum[1, 2]* fcum[2, 0] + $
                108* fcum[1, 0]* fcum[1, 2]* fcum[2, 0] + 54* fcum[0, 1]* fcum[2, 0]^2 + $
                54* fcum[0, 2]* fcum[2, 0]^2 + 18* fcum[0, 1]* fcum[1, 0]* fcum[2, 0]^2 + $
                18* fcum[0, 2]* fcum[1, 0]* fcum[2, 0]^2 + 90* fcum[1, 1]* fcum[2, 0]^2 + $
                18* fcum[1, 1]^2* fcum[2, 0]^2 + 90* fcum[1, 2]* fcum[2, 0]^2 + $
                6* fcum[0, 1]* fcum[2, 0]^3 + 6* fcum[0, 2]* fcum[2, 0]^3 + $
                18* fcum[1, 0]* fcum[2, 1] + 18* fcum[1, 0]^2* fcum[2, 1] + $
                36* fcum[1, 1]* fcum[2, 1] + 144* fcum[1, 0]* fcum[1, 1]* fcum[2, 1] + $
                108* fcum[2, 0]* fcum[2, 1] + 36* fcum[1, 0]* fcum[2, 0]* fcum[2, 1] + $
                252* fcum[1, 1]* fcum[2, 0]* fcum[2, 1] + 18* fcum[2, 0]^2* fcum[2, 1] + $
                108* fcum[2, 1]^2 + 45* fcum[1, 0]* fcum[2, 1]^2 + $
                45* fcum[2, 0]* fcum[2, 1]^2 + 18* fcum[1, 0]* fcum[2, 2] + $
                18* fcum[1, 0]^2* fcum[2, 2] + 108* fcum[2, 0]* fcum[2, 2] + $
                36* fcum[1, 0]* fcum[2, 0]* fcum[2, 2] + 18* fcum[2, 0]^2* fcum[2, 2] + $
                6* fcum[0, 1]* fcum[3, 0] + 6* fcum[0, 2]* fcum[3, 0] + $
                36* fcum[0, 1]* fcum[1, 0]* fcum[3, 0] + $
                36* fcum[0, 2]* fcum[1, 0]* fcum[3, 0] + 72* fcum[1, 1]* fcum[3, 0] + $
                36* fcum[1, 0]* fcum[1, 1]* fcum[3, 0] + 72* fcum[1, 1]^2* fcum[3, 0] + $ 
                72* fcum[1, 2]* fcum[3, 0] + 36* fcum[1, 0]* fcum[1, 2]* fcum[3, 0] + $
                72* fcum[0, 1]* fcum[2, 0]* fcum[3, 0] + $
                72* fcum[0, 2]* fcum[2, 0]* fcum[3, 0] + $
                36* fcum[1, 1]* fcum[2, 0]* fcum[3, 0] + $
                36* fcum[1, 2]* fcum[2, 0]* fcum[3, 0] + 90* fcum[2, 1]* fcum[3, 0] + $
                54* fcum[1, 1]* fcum[2, 1]* fcum[3, 0] + 90* fcum[2, 2]* fcum[3, 0] + $
                9* fcum[0, 1]* fcum[3, 0]^2 + 9* fcum[0, 2]* fcum[3, 0]^2 + $
                6* fcum[3, 1] + 36* fcum[1, 0]* fcum[3, 1] + $
                108* fcum[1, 1]* fcum[3, 1] + 36* fcum[1, 0]* fcum[1, 1]* fcum[3, 1] + $
                72* fcum[2, 0]* fcum[3, 1] + 36* fcum[1, 1]* fcum[2, 0]* fcum[3, 1] + $
                162* fcum[2, 1]* fcum[3, 1] + 18* fcum[3, 0]* fcum[3, 1] + $
                19* fcum[3, 1]^2 + 6 fcum[3, 2] + 36* fcum[1, 0]* fcum[3, 2] + $
                72* fcum[2, 0]* fcum[3, 2] + 18* fcum[3, 0]* fcum[3, 2] + $
                18* fcum[0, 1]* fcum[4, 0] + 18* fcum[0, 2]* fcum[4, 0] + $
                9* fcum[0, 1]* fcum[1, 0]* fcum[4, 0] + $
                9* fcum[0, 2]* fcum[1, 0]* fcum[4, 0] + 45* fcum[1, 1]* fcum[4, 0] + $
                9* fcum[1, 1]^2* fcum[4, 0] + 45* fcum[1, 2]* fcum[4, 0] + $
                9* fcum[0, 1]* fcum[2, 0]* fcum[4, 0] + $
                9* fcum[0, 2]* fcum[2, 0]* fcum[4, 0] + 15* fcum[2, 1]* fcum[4, 0] + $
                15* fcum[2, 2]* fcum[4, 0] + 18* fcum[4, 1] + 9* fcum[1, 0]* fcum[4, 1] + $
                54* fcum[1, 1]* fcum[4, 1] + 9* fcum[2, 0]* fcum[4, 1] + $
                24* fcum[2, 1]* fcum[4, 1] + 18* fcum[4, 2] + 9* fcum[1, 0]* fcum[4, 2] + $
                9* fcum[2, 0]* fcum[4, 2] + 9* fcum[0, 1]* fcum[5, 0] + $
                9* fcum[0, 2]* fcum[5, 0] + 6* fcum[1, 1]* fcum[5, 0] + $
                6* fcum[1, 2]* fcum[5, 0] + 9* fcum[5, 1] + 6* fcum[1, 1]* fcum[5, 1] + $
                9* fcum[5, 2] + fcum[0, 1]* fcum[6, 0] + fcum[0, 2]* fcum[6, 0] + $
                fcum[6, 1] + fcum[6, 2]

varfcum[2, 2] = 4 fcum[0, 1]^2 fcum[1, 0]^2 + 4 fcum[0, 2] fcum[1, 0]^2 + $
                8 fcum[0, 1] fcum[0, 2] fcum[1, 0]^2 + 4 fcum[0, 2]^2 fcum[1, 0]^2 + $
                8 fcum[0, 3] fcum[1, 0]^2 + 2 fcum[0, 4] fcum[1, 0]^2 + $
                16 fcum[0, 1] fcum[1, 0] fcum[1, 1] + $
                48 fcum[0, 2] fcum[1, 0] fcum[1, 1] + $
                16 fcum[0, 3] fcum[1, 0] fcum[1, 1] + 8 fcum[1, 1]^2 + $
                16 fcum[0, 1] fcum[1, 1]^2 + 16 fcum[0, 2] fcum[1, 1]^2 + $
                16 fcum[1, 0] fcum[1, 1]^2 + 16 fcum[0, 1] fcum[1, 0] fcum[1, 1]^2 + $
                16 fcum[0, 2] fcum[1, 0] fcum[1, 1]^2 + 48 fcum[1, 1]^3 + $
                4 fcum[1, 1]^4 + 8 fcum[1, 0] fcum[1, 2] + $
                16 fcum[0, 1] fcum[1, 0] fcum[1, 2] + $
                16 fcum[0, 2] fcum[1, 0] fcum[1, 2] + 48 fcum[1, 1] fcum[1, 2] + $
                64 fcum[1, 0] fcum[1, 1] fcum[1, 2] + 64 fcum[1, 1]^2 fcum[1, 2] + $
                12 fcum[1, 2]^2 + 20 fcum[1, 0] fcum[1, 2]^2 + $
                16 fcum[1, 0] fcum[1, 3] + 16 fcum[1, 1] fcum[1, 3] + $
                16 fcum[1, 0] fcum[1, 1] fcum[1, 3] + 4 fcum[1, 0] fcum[1, 4] + $
                4 fcum[0, 1]^2 fcum[2, 0] + 4 fcum[0, 2] fcum[2, 0] + $
                8 fcum[0, 1] fcum[0, 2] fcum[2, 0] + 4 fcum[0, 2]^2 fcum[2, 0] + $
                8 fcum[0, 3] fcum[2, 0] + 2 fcum[0, 4] fcum[2, 0] + $
                8 fcum[0, 1]^2 fcum[1, 0] fcum[2, 0] + $
                8 fcum[0, 2] fcum[1, 0] fcum[2, 0] + $
                16 fcum[0, 1] fcum[0, 2] fcum[1, 0] fcum[2, 0] + $
                8 fcum[0, 2]^2 fcum[1, 0] fcum[2, 0] + $
                16 fcum[0, 3] fcum[1, 0] fcum[2, 0] + $
                4 fcum[0, 4] fcum[1, 0] fcum[2, 0] + $
                48 fcum[0, 1] fcum[1, 1] fcum[2, 0] + $
                112 fcum[0, 2] fcum[1, 1] fcum[2, 0] + $
                32 fcum[0, 3] fcum[1, 1] fcum[2, 0] + 16 fcum[1, 1]^2 fcum[2, 0] + $
                16 fcum[0, 1] fcum[1, 1]^2 fcum[2, 0] + $
                16 fcum[0, 2] fcum[1, 1]^2 fcum[2, 0] + 24 fcum[1, 2] fcum[2, 0] + $
                48 fcum[0, 1] fcum[1, 2] fcum[2, 0] + $
                48 fcum[0, 2] fcum[1, 2] fcum[2, 0] + $
                64 fcum[1, 1] fcum[1, 2] fcum[2, 0] + 20 fcum[1, 2]^2 fcum[2, 0] + $ 
                48 fcum[1, 3] fcum[2, 0] + 16 fcum[1, 1] fcum[1, 3] fcum[2, 0] + $ 
                12 fcum[1, 4] fcum[2, 0] + 4 fcum[0, 1]^2 fcum[2, 0]^2 + $
                4 fcum[0, 2] fcum[2, 0]^2 + 8 fcum[0, 1] fcum[0, 2] fcum[2, 0]^2 + $
                4 fcum[0, 2]^2 fcum[2, 0]^2 + 8 fcum[0, 3] fcum[2, 0]^2 + $
                2 fcum[0, 4] fcum[2, 0]^2 + 8 fcum[0, 1] fcum[2, 1] + $
                24 fcum[0, 2] fcum[2, 1] + 8 fcum[0, 3] fcum[2, 1] + $
                16 fcum[0, 1] fcum[1, 0] fcum[2, 1] + $
                48 fcum[0, 2] fcum[1, 0] fcum[2, 1] + $
                16 fcum[0, 3] fcum[1, 0] fcum[2, 1] + 48 fcum[1, 1] fcum[2, 1] + $
                64 fcum[0, 1] fcum[1, 1] fcum[2, 1] + $
                64 fcum[0, 2] fcum[1, 1] fcum[2, 1] + 64 fcum[1, 1]^2 fcum[2, 1] + $ 
                144 fcum[1, 2] fcum[2, 1] + 64 fcum[1, 1] fcum[1, 2] fcum[2, 1] + $
                48 fcum[1, 3] fcum[2, 1] + 16 fcum[0, 1] fcum[2, 0] fcum[2, 1] + $
                48 fcum[0, 2] fcum[2, 0] fcum[2, 1] + $
                16 fcum[0, 3] fcum[2, 0] fcum[2, 1] + 12 fcum[2, 1]^2 + $
                20 fcum[0, 1] fcum[2, 1]^2 + 20 fcum[0, 2] fcum[2, 1]^2 + $ 
                4 fcum[2, 2] + 8 fcum[0, 1] fcum[2, 2] + 8 fcum[0, 2] fcum[2, 2] + $
                8 fcum[1, 0] fcum[2, 2] + 16 fcum[0, 1] fcum[1, 0] fcum[2, 2] + $
                16 fcum[0, 2] fcum[1, 0] fcum[2, 2] + 112 fcum[1, 1] fcum[2, 2] + $ 
                20 fcum[1, 1]^2 fcum[2, 2] + 64 fcum[1, 2] fcum[2, 2] + $
                8 fcum[2, 0] fcum[2, 2] + 16 fcum[0, 1] fcum[2, 0] fcum[2, 2] + $
                16 fcum[0, 2] fcum[2, 0] fcum[2, 2] + 64 fcum[2, 1] fcum[2, 2] + $
                17 fcum[2, 2]^2 + 8 fcum[2, 3] + 16 fcum[1, 0] fcum[2, 3] + $
                32 fcum[1, 1] fcum[2, 3] + 16 fcum[2, 0] fcum[2, 3] + $
                20 fcum[2, 1] fcum[2, 3] + 2 fcum[2, 4] + 4 fcum[1, 0] fcum[2, 4] + $
                4 fcum[2, 0] fcum[2, 4] + 8 fcum[0, 1]^2 fcum[3, 0] + $
                8 fcum[0, 2] fcum[3, 0] + 16 fcum[0, 1] fcum[0, 2] fcum[3, 0] + $
                8 fcum[0, 2]^2 fcum[3, 0] + 16 fcum[0, 3] fcum[3, 0] + $
                4 fcum[0, 4] fcum[3, 0] + 16 fcum[0, 1] fcum[1, 1] fcum[3, 0] + $
                32 fcum[0, 2] fcum[1, 1] fcum[3, 0] + $
                8 fcum[0, 3] fcum[1, 1] fcum[3, 0] + 8 fcum[1, 2] fcum[3, 0] + $
                16 fcum[0, 1] fcum[1, 2] fcum[3, 0] + $
                16 fcum[0, 2] fcum[1, 2] fcum[3, 0] + 16 fcum[1, 3] fcum[3, 0] + $
                4 fcum[1, 4] fcum[3, 0] + 16 fcum[0, 1] fcum[3, 1] + $
                48 fcum[0, 2] fcum[3, 1] + 16 fcum[0, 3] fcum[3, 1] + $
                16 fcum[1, 1] fcum[3, 1] + 16 fcum[0, 1] fcum[1, 1] fcum[3, 1] + $
                16 fcum[0, 2] fcum[1, 1] fcum[3, 1] + 48 fcum[1, 2] fcum[3, 1] + $
                16 fcum[1, 3] fcum[3, 1] + 8 fcum[3, 2] + 16 fcum[0, 1] fcum[3, 2] + $
                16 fcum[0, 2] fcum[3, 2] + 32 fcum[1, 1] fcum[3, 2] + $ 
                20 fcum[1, 2] fcum[3, 2] + 16 fcum[3, 3] + 8 fcum[1, 1] fcum[3, 3] + $ 
                4 fcum[3, 4] + 2 fcum[0, 1]^2 fcum[4, 0] + 2 fcum[0, 2] fcum[4, 0] + $
                4 fcum[0, 1] fcum[0, 2] fcum[4, 0] + 2 fcum[0, 2]^2 fcum[4, 0] + $
                4 fcum[0, 3] fcum[4, 0] + fcum[0, 4] fcum[4, 0] + $
                4 fcum[0, 1] fcum[4, 1] + 12 fcum[0, 2] fcum[4, 1] + $
                4 fcum[0, 3] fcum[4, 1] + 2 fcum[4, 2] + 4 fcum[0, 1] fcum[4, 2] + $
                4 fcum[0, 2] fcum[4, 2] + 4 fcum[4, 3] + fcum[4, 4]

varfcum[1, 3] = 6* fcum[0, 1]^3* fcum[1, 0] + 18* fcum[0, 1]* fcum[0, 2]* fcum[1, 0] + $
                18* fcum[0, 1]^2* fcum[0, 2]* fcum[1, 0] + 54* fcum[0, 2]^2* fcum[1, 0] + $
                18* fcum[0, 1]* fcum[0, 2]^2* fcum[1, 0] + 6* fcum[0, 2]^3* fcum[1, 0] + $
                6* fcum[0, 3]* fcum[1, 0] + 36* fcum[0, 1]* fcum[0, 3]* fcum[1, 0] + $
                72* fcum[0, 2]* fcum[0, 3]* fcum[1, 0] + 9* fcum[0, 3]^2* fcum[1, 0] + $
                18* fcum[0, 4]* fcum[1, 0] + 9* fcum[0, 1]* fcum[0, 4]* fcum[1, 0] + $
                9* fcum[0, 2]* fcum[0, 4]* fcum[1, 0] + 9* fcum[0, 5]* fcum[1, 0] + $
                fcum[0, 6]* fcum[1, 0] + 18* fcum[0, 1]^2* fcum[1, 1] + $
                18* fcum[0, 2]* fcum[1, 1] + 108* fcum[0, 1]* fcum[0, 2] fcum[1, 1] + $
                90* fcum[0, 2]^2* fcum[1, 1] + 72* fcum[0, 3]* fcum[1, 1] + $
                36* fcum[0, 1]* fcum[0, 3]* fcum[1, 1] + $
                36* fcum[0, 2]* fcum[0, 3]* fcum[1, 1] + 45* fcum[0, 4]* fcum[1, 1] + $
                6* fcum[0, 5]* fcum[1, 1] + 36* fcum[0, 1]* fcum[1, 1]^2 + $
                18* fcum[0, 1]^2* fcum[1, 1]^2 + 126* fcum[0, 2]* fcum[1, 1]^2 + $
                36* fcum[0, 1]* fcum[0, 2]* fcum[1, 1]^2 + $
                18* fcum[0, 2]^2* fcum[1, 1]^2 + 72* fcum[0, 3]* fcum[1, 1]^2 + $
                9* fcum[0, 4]* fcum[1, 1]^2 + 18* fcum[0, 1]* fcum[1, 2] + $
                18* fcum[0, 1]^2* fcum[1, 2] + 108* fcum[0, 2]* fcum[1, 2] + $
                36* fcum[0, 1]* fcum[0, 2]* fcum[1, 2] + 18* fcum[0, 2]^2* fcum[1, 2] + $
                90* fcum[0, 3]* fcum[1, 2] + 15* fcum[0, 4]* fcum[1, 2] + $
                36* fcum[1, 1]* fcum[1, 2] + 144* fcum[0, 1]* fcum[1, 1]* fcum[1, 2] + $
                252* fcum[0, 2]* fcum[1, 1]* fcum[1, 2] + $
                54* fcum[0, 3]* fcum[1, 1]* fcum[1, 2] + 108* fcum[1, 2]^2 + $
                45* fcum[0, 1]* fcum[1, 2]^2 + 45* fcum[0, 2]* fcum[1, 2]^2 + $
                6* fcum[1, 3] + 36* fcum[0, 1]* fcum[1, 3] + 72* fcum[0, 2]* fcum[1, 3] + $
                18* fcum[0, 3]* fcum[1, 3] + 108* fcum[1, 1]* fcum[1, 3] + $
                36* fcum[0, 1]* fcum[1, 1]* fcum[1, 3] + $
                36* fcum[0, 2]* fcum[1, 1]* fcum[1, 3] + 162* fcum[1, 2]* fcum[1, 3] + $
                19* fcum[1, 3]^2 + 18* fcum[1, 4] + 9* fcum[0, 1] fcum[1, 4] + $
                9* fcum[0, 2]* fcum[1, 4] + 54* fcum[1, 1]* fcum[1, 4] + $
                24* fcum[1, 2]* fcum[1, 4] + 9* fcum[1, 5] + 6* fcum[1, 1]* fcum[1, 5] + $
                fcum[1, 6] + 6* fcum[0, 1]^3* fcum[2, 0] + $
                18* fcum[0, 1]* fcum[0, 2]* fcum[2, 0] + $
                18* fcum[0, 1]^2* fcum[0, 2]* fcum[2, 0] + 54* fcum[0, 2]^2* fcum[2, 0] + $
                18* fcum[0, 1]* fcum[0, 2]^2* fcum[2, 0] + 6* fcum[0, 2]^3* fcum[2, 0] + $
                6* fcum[0, 3]* fcum[2, 0] + 36* fcum[0, 1]* fcum[0, 3]* fcum[2, 0] + $
                72* fcum[0, 2]* fcum[0, 3]* fcum[2, 0] + 9* fcum[0, 3]^2* fcum[2, 0] + $
                18* fcum[0, 4]* fcum[2, 0] + 9* fcum[0, 1]* fcum[0, 4]* fcum[2, 0] + $
                9* fcum[0, 2]* fcum[0, 4]* fcum[2, 0] + 9* fcum[0, 5]* fcum[2, 0] + $
                fcum[0, 6]* fcum[2, 0] + 18* fcum[0, 1]^2* fcum[2, 1] + $
                18* fcum[0, 2]* fcum[2, 1] + 108* fcum[0, 1]* fcum[0, 2]* fcum[2, 1] + $
                90* fcum[0, 2]^2* fcum[2, 1] + 72* fcum[0, 3]* fcum[2, 1] + $
                36* fcum[0, 1]* fcum[0, 3]* fcum[2, 1] + $
                36* fcum[0, 2]* fcum[0, 3]* fcum[2, 1] + 45* fcum[0, 4]* fcum[2, 1] + $
                6* fcum[0, 5]* fcum[2, 1] + 18* fcum[0, 1]* fcum[2, 2] + $
                18* fcum[0, 1]^2* fcum[2, 2] + 108 fcum[0, 2]* fcum[2, 2] + $
                36* fcum[0, 1]* fcum[0, 2]* fcum[2, 2] + 18* fcum[0, 2]^2* fcum[2, 2] + $
                90* fcum[0, 3]* fcum[2, 2] + 15* fcum[0, 4]* fcum[2, 2] + 6* fcum[2, 3] + $
                36* fcum[0, 1]* fcum[2, 3] + 72* fcum[0, 2]* fcum[2, 3] + $
                18* fcum[0, 3]* fcum[2, 3] + 18* fcum[2, 4] + 9* fcum[0, 1]* fcum[2, 4] + $
                9* fcum[0, 2]* fcum[2, 4] + 9* fcum[2, 5] + fcum[2, 6]      


result = ptr_new(varfcum)
return, result

end