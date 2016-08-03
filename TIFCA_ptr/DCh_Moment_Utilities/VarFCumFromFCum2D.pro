pro VarFCumFromFCum2D, fcum, VarFCum

VarFCum=dblarr(5,5)

VarFCum[0,0] =1.

VarFCum[0,1] = fcum[0, 1] + fcum[0, 2]

VarFCum[0,2] = 2*fcum[0, 1]^2 + 2*fcum[0, 2] + 4*fcum[0, 1]*fcum[0, 2] + 2*fcum[0, 2]^2 + 4*fcum[0, 3] +  fcum[0, 4]

VarFCum[0,3] = 6*fcum[0, 1]^3 + 18*fcum[0, 1]^2*fcum[0, 2] + 54*fcum[0, 2]^2 +  6*fcum[0, 2]^3 + 6*fcum[0, 3] + 9*fcum[0, 3]^2 + 18*fcum[0, 4] +  9*fcum[0, 1]*(2*fcum[0, 2] + 2*fcum[0, 2]^2 + 4*fcum[0, 3] + fcum[0, 4]) +    $
    9*fcum[0, 2]*(8*fcum[0, 3] + fcum[0, 4]) + 9*fcum[0, 5] + fcum[0, 6]

VarFCum[0,4] = 24*fcum[0, 1]^4 + 96*fcum[0, 1]^3*fcum[0, 2] + 720*fcum[0, 2]^3 +  24*fcum[0, 2]^4 + 720*fcum[0, 3]^2 + 24*fcum[0, 4] +  528*fcum[0, 3]*fcum[0, 4] + 34*fcum[0, 4]^2 +  $
    72*fcum[0, 1]^2*(2*fcum[0, 2] + 2*fcum[0, 2]^2 + 4*fcum[0, 3] + fcum[0, 4]) +  72*fcum[0, 2]^2*(1 + 12*fcum[0, 3] + fcum[0, 4]) + 96*fcum[0, 5] +  48*fcum[0, 3]*fcum[0, 5] + 72*fcum[0, 6] + $
    16*fcum[0, 1]*(54*fcum[0, 2]^2 + 6*fcum[0, 2]^3 + 6*fcum[0, 3] + 9*fcum[0, 3]^2 + 18*fcum[0, 4] + 9*fcum[0, 2]*(8*fcum[0, 3] + fcum[0, 4]) + 9*fcum[0, 5] + fcum[0, 6]) + 8*fcum[0, 2]*     $
    (120*fcum[0, 3] + 18*fcum[0, 3]^2 + 117*fcum[0, 4] + 30*fcum[0, 5] + 2*fcum[0, 6]) + 16*fcum[0, 7] + fcum[0, 8]

VarFcum[1,0] = fcum[1, 0] + fcum[2, 0]

VarFCum[1,1] = fcum[1, 1] + fcum[1, 1]^2 + fcum[1, 2] + (fcum[0, 1] + fcum[0, 2])*(fcum[1, 0] + fcum[2, 0]) + fcum[2, 1] + fcum[2, 2]

VarFCum[1,2] =4*fcum[0, 3]*fcum[1, 0] + fcum[0, 4]*fcum[1, 0] + 4*fcum[0, 3]*fcum[1, 1] +  4*fcum[1, 1]^2 + 2*fcum[1, 2] + 16*fcum[1, 1]*fcum[1, 2] + 5*fcum[1, 2]^2 +  4*fcum[1, 3] + 4*fcum[1, 1]*fcum[1, 3] + fcum[1, 4] + 4*fcum[0, 3]*fcum[2, 0] + $
    fcum[0, 4]*fcum[2, 0] + 2*fcum[0, 1]^2*(fcum[1, 0] + fcum[2, 0]) +  2*fcum[0, 2]^2*(fcum[1, 0] + fcum[2, 0]) + 4*fcum[0, 3]*fcum[2, 1] + 2*fcum[2, 2] +  4*fcum[0, 1]*(fcum[1, 1] + fcum[1, 1]^2 + fcum[1, 2] +   $
    fcum[0, 2]*(fcum[1, 0] + fcum[2, 0]) + fcum[2, 1] + fcum[2, 2]) + 2*fcum[0, 2]*(fcum[1, 0] + 6*fcum[1, 1] + 2*fcum[1, 1]^2 + 2*fcum[1, 2] + fcum[2, 0] +  6*fcum[2, 1] + 2*fcum[2, 2]) + 4*fcum[2, 3] + fcum[2, 4]

VarFCum[1,3] =6*fcum[0, 3]*fcum[1, 0] + 9*fcum[0, 3]^2*fcum[1, 0] + 18*fcum[0, 4]*fcum[1, 0] + 9*fcum[0, 5]*fcum[1, 0] + fcum[0, 6]*fcum[1, 0] + 72*fcum[0, 3]*fcum[1, 1] + 45*fcum[0, 4]*fcum[1, 1] +   $
     6*fcum[0, 5]*fcum[1, 1] + 72*fcum[0, 3]*fcum[1, 1]^2 + 9*fcum[0, 4]*fcum[1, 1]^2 + 90*fcum[0, 3]*fcum[1, 2] + 15*fcum[0, 4]*fcum[1, 2] + 36*fcum[1, 1]*fcum[1, 2] + 54*fcum[0, 3]*fcum[1, 1]*fcum[1, 2] + 108*fcum[1, 2]^2+   $
    6*fcum[1, 3] + 18*fcum[0, 3]*fcum[1, 3] + 108*fcum[1, 1]*fcum[1, 3] + 162*fcum[1, 2]*fcum[1, 3] + 19*fcum[1, 3]^2 + 18*fcum[1, 4] + 54*fcum[1, 1]*fcum[1, 4] + 24*fcum[1, 2]*fcum[1, 4] + 9*fcum[1, 5] + 6*fcum[1, 1]*fcum[1, 5] + fcum[1, 6] +    $
    6*fcum[0, 3]*fcum[2, 0] + 9*fcum[0, 3]^2*fcum[2, 0] + 18*fcum[0, 4]*fcum[2, 0] + 9*fcum[0, 5]*fcum[2, 0] + fcum[0, 6]*fcum[2, 0] + 6*fcum[0, 1]^3*(fcum[1, 0] + fcum[2, 0]) + 6*fcum[0, 2]^3*(fcum[1, 0] + fcum[2, 0]) +   $
    72*fcum[0, 3]*fcum[2, 1] + 45*fcum[0, 4]*fcum[2, 1] + 6*fcum[0, 5]*fcum[2, 1] + 90*fcum[0, 3]*fcum[2, 2] + 15*fcum[0, 4]*fcum[2, 2] + 18*fcum[0, 1]^2*(fcum[1, 1] + fcum[1, 1]^2 + fcum[1, 2] +       $
    fcum[0, 2]*(fcum[1, 0] + fcum[2, 0]) + fcum[2, 1] + fcum[2, 2]) + 18*fcum[0, 2]^2*(3*fcum[1, 0] + 5*fcum[1, 1] + fcum[1, 1]^2 + fcum[1, 2] + 3*fcum[2, 0] + 5*fcum[2, 1] + fcum[2, 2]) + 6*fcum[2, 3] + 18*fcum[0, 3]*fcum[2, 3] + 18*fcum[2, 4] + $
    9*fcum[0, 1]*(fcum[0, 4]*fcum[1, 0] + 4*fcum[1, 1]^2 + 2*fcum[1, 2] +  16*fcum[1, 1]*fcum[1, 2] + 5*fcum[1, 2]^2 + 4*fcum[1, 3] + 4*fcum[1, 1]*fcum[1, 3] +  fcum[1, 4] + fcum[0, 4]*fcum[2, 0] + 2*fcum[0, 2]^2*(fcum[1, 0] + fcum[2, 0]) +   $
    4*fcum[0, 3]*(fcum[1, 0] + fcum[1, 1] + fcum[2, 0] + fcum[2, 1]) + 2*fcum[2, 2] + 2*fcum[0, 2]*(fcum[1, 0] + 6*fcum[1, 1] + 2*fcum[1, 1]^2 + 2*fcum[1, 2] + fcum[2, 0] + 6*fcum[2, 1] + 2*fcum[2, 2]) + 4*fcum[2, 3] + fcum[2, 4]) +   $
    9*fcum[0, 2]*(2*fcum[1, 1] + 14*fcum[1, 1]^2 + 12*fcum[1, 2] + 28*fcum[1, 1]*fcum[1, 2] + 5*fcum[1, 2]^2 + 8*fcum[1, 3] + 4*fcum[1, 1]*fcum[1, 3] + fcum[1, 4] + fcum[0, 4]*(fcum[1, 0] + fcum[2, 0]) + 2*fcum[2, 1] +     $
    4*fcum[0, 3]*(2*fcum[1, 0] + fcum[1, 1] + 2*fcum[2, 0] + fcum[2, 1]) + 12*fcum[2, 2] + 8*fcum[2, 3] + fcum[2, 4]) + 9*fcum[2, 5] + fcum[2, 6]

VarFCum[1,4] = 1.

VarFCum[2,0] = 2*fcum[1, 0]^2 + 2*fcum[2, 0] + 4*fcum[1, 0]*fcum[2, 0] + 2*fcum[2, 0]^2 + 4*fcum[3, 0] +  fcum[4, 0]

VarFCum[2,1] = 4*fcum[1, 0]*fcum[1, 1] + 4*fcum[1, 1]^2 + 4*fcum[1, 0]*fcum[1, 1]^2 +  4*fcum[1, 0]*fcum[1, 2] + 12*fcum[1, 1]*fcum[2, 0] + 4*fcum[1, 1]^2*fcum[2, 0] +  12*fcum[1, 2]*fcum[2, 0] + 2*fcum[2, 1] + 4*fcum[1, 0]*fcum[2, 1] +    $
    16*fcum[1, 1]*fcum[2, 1] + 4*fcum[2, 0]*fcum[2, 1] + 5*fcum[2, 1]^2 + 2*fcum[2, 2] + 4*fcum[1, 0]*fcum[2, 2] + 4*fcum[2, 0]*fcum[2, 2] + 4*fcum[1, 1]*fcum[3, 0] +  4*fcum[1, 2]*fcum[3, 0] + 4*fcum[3, 1] + 4*fcum[1, 1]*fcum[3, 1] + 4*fcum[3, 2] +  $
    fcum[0, 1]*(2*fcum[1, 0]^2 + 2*fcum[2, 0] + 4*fcum[1, 0]*fcum[2, 0] + 2*fcum[2, 0]^2 + 4*fcum[3, 0] + fcum[4, 0]) + fcum[0, 2]*(2*fcum[1, 0]^2 + 2*fcum[2, 0] + 4*fcum[1, 0]*fcum[2, 0] + 2*fcum[2, 0]^2 + 4*fcum[3, 0] + fcum[4, 0]) + fcum[4, 1] +   $
    fcum[4, 2]

VarFCum[2,2] = 8*fcum[0, 3]*fcum[1, 0]^2 + 2*fcum[0, 4]*fcum[1, 0]^2 +  16*fcum[0, 3]*fcum[1, 0]*fcum[1, 1] + 8*fcum[1, 1]^2 + 16*fcum[1, 0]*fcum[1, 1]^2 + 48*fcum[1, 1]^3 + 4*fcum[1, 1]^4 + 8*fcum[1, 0]*fcum[1, 2] + 48*fcum[1, 1]*fcum[1, 2] + $
     64*fcum[1, 0]*fcum[1, 1]*fcum[1, 2] + 64*fcum[1, 1]^2*fcum[1, 2] + 12*fcum[1, 2]^2 + 20*fcum[1, 0]*fcum[1, 2]^2 + 16*fcum[1, 0]*fcum[1, 3] + 16*fcum[1, 1]*fcum[1, 3] +   $
     16*fcum[1, 0]*fcum[1, 1]*fcum[1, 3] + 4*fcum[1, 0]*fcum[1, 4] + 8*fcum[0, 3]*fcum[2, 0] + 2*fcum[0, 4]*fcum[2, 0] + 16*fcum[0, 3]*fcum[1, 0]*fcum[2, 0] + 4*fcum[0, 4]*fcum[1, 0]*fcum[2, 0] + 32*fcum[0, 3]*fcum[1, 1]*fcum[2, 0] +  $
     16*fcum[1, 1]^2*fcum[2, 0] + 24*fcum[1, 2]*fcum[2, 0] + 64*fcum[1, 1]*fcum[1, 2]*fcum[2, 0] + 20*fcum[1, 2]^2*fcum[2, 0] + 48*fcum[1, 3]*fcum[2, 0] + 16*fcum[1, 1]*fcum[1, 3]*fcum[2, 0] +   $
     12*fcum[1, 4]*fcum[2, 0] + 8*fcum[0, 3]*fcum[2, 0]^2 + 2*fcum[0, 4]*fcum[2, 0]^2 + 8*fcum[0, 3]*fcum[2, 1] + 16*fcum[0, 3]*fcum[1, 0]*fcum[2, 1] + 48*fcum[1, 1]*fcum[2, 1] + 64*fcum[1, 1]^2*fcum[2, 1] + 144*fcum[1, 2]*fcum[2, 1] +    $
     64*fcum[1, 1]*fcum[1, 2]*fcum[2, 1] + 48*fcum[1, 3]*fcum[2, 1] + 16*fcum[0, 3]*fcum[2, 0]*fcum[2, 1] + 12*fcum[2, 1]^2 + 4*fcum[2, 2] + 8*fcum[1, 0]*fcum[2, 2] + 112*fcum[1, 1]*fcum[2, 2] + 20*fcum[1, 1]^2*fcum[2, 2] +    $
     64*fcum[1, 2]*fcum[2, 2] + 8*fcum[2, 0]*fcum[2, 2] + 64*fcum[2, 1]*fcum[2, 2] + 17*fcum[2, 2]^2 + 8*fcum[2, 3] + 16*fcum[1, 0]*fcum[2, 3] + 32*fcum[1, 1]*fcum[2, 3] + 16*fcum[2, 0]*fcum[2, 3] + 20*fcum[2, 1]*fcum[2, 3] + 2*fcum[2, 4] +   $
     4*fcum[1, 0]*fcum[2, 4] + 4*fcum[2, 0]*fcum[2, 4] + 16*fcum[0, 3]*fcum[3, 0] + 4*fcum[0, 4]*fcum[3, 0] + 8*fcum[0, 3]*fcum[1, 1]*fcum[3, 0] + 8*fcum[1, 2]*fcum[3, 0] +   $
     16*fcum[1, 3]*fcum[3, 0] + 4*fcum[1, 4]*fcum[3, 0] + 16*fcum[0, 3]*fcum[3, 1] + 16*fcum[1, 1]*fcum[3, 1] + 48*fcum[1, 2]*fcum[3, 1] + 16*fcum[1, 3]*fcum[3, 1] + 8*fcum[3, 2] + 32*fcum[1, 1]*fcum[3, 2] + 20*fcum[1, 2]*fcum[3, 2] + 16*fcum[3, 3] + $
     8*fcum[1, 1]*fcum[3, 3] + 4*fcum[3, 4] + 4*fcum[0, 3]*fcum[4, 0] + fcum[0, 4]*fcum[4, 0] + 2*fcum[0, 1]^2*(2*fcum[1, 0]^2 + 2*fcum[2, 0] + 4*fcum[1, 0]*fcum[2, 0] + 2*fcum[2, 0]^2 + 4*fcum[3, 0] + fcum[4, 0]) +    $
     2*fcum[0, 2]^2*(2*fcum[1, 0]^2 + 2*fcum[2, 0] + 4*fcum[1, 0]*fcum[2, 0] +  2*fcum[2, 0]^2 + 4*fcum[3, 0] + fcum[4, 0]) + 4*fcum[0, 3]*fcum[4, 1] + 2*fcum[4, 2] +     $
     4*fcum[0, 1]*(4*fcum[1, 1]^2 + 12*fcum[1, 1]*fcum[2, 0] + 4*fcum[1, 1]^2*fcum[2, 0] + 12*fcum[1, 2]*fcum[2, 0] + 2*fcum[2, 1] + 16*fcum[1, 1]*fcum[2, 1] + 4*fcum[2, 0]*fcum[2, 1] + 5*fcum[2, 1]^2 + 2*fcum[2, 2] + 4*fcum[2, 0]*fcum[2, 2] +    $
     4*fcum[1, 0]*(fcum[1, 1] + fcum[1, 1]^2 + fcum[1, 2] + fcum[2, 1] + fcum[2, 2]) + 4*fcum[1, 1]*fcum[3, 0] + 4*fcum[1, 2]*fcum[3, 0] + 4*fcum[3, 1] + 4*fcum[1, 1]*fcum[3, 1] + 4*fcum[3, 2] + fcum[0, 2]*(2*fcum[1, 0]^2 + 2*fcum[2, 0] +     $
     4*fcum[1, 0]*fcum[2, 0] + 2*fcum[2, 0]^2 + 4*fcum[3, 0] + fcum[4, 0]) + fcum[4, 1] + fcum[4, 2]) + 2*fcum[0, 2]*(2*fcum[1, 0]^2 + 2*fcum[2, 0] + 24*fcum[1, 2]*fcum[2, 0] + 2*fcum[2, 0]^2 + 8*fcum[1, 1]^2*(1 + fcum[2, 0]) + 12*fcum[2, 1] +    $
     24*fcum[2, 0]*fcum[2, 1] + 10*fcum[2, 1]^2 + 4*fcum[2, 2] + 8*fcum[2, 0]*fcum[2, 2] + 4*fcum[1, 0]*(6*fcum[1, 1] + 2*fcum[1, 1]^2 + 2*fcum[1, 2] + fcum[2, 0] + 6*fcum[2, 1] + 2*fcum[2, 2]) + 4*fcum[3, 0] + 8*fcum[1, 2]*fcum[3, 0] +   $
     24*fcum[3, 1] + 8*fcum[1, 1]*(7*fcum[2, 0] + 4*fcum[2, 1] + 2*fcum[3, 0] +  fcum[3, 1]) + 8*fcum[3, 2] + fcum[4, 0] + 6*fcum[4, 1] + 2*fcum[4, 2]) +  4*fcum[4, 3] + fcum[4, 4]
VarFCum[2,3]=1.
VarFCum[2,4]=1.

VarFCum[3,0]=6*fcum[1, 0]^3 + 18*fcum[1, 0]^2*fcum[2, 0] + 54*fcum[2, 0]^2 + 6*fcum[2, 0]^3 +  6*fcum[3, 0] + 9*fcum[3, 0]^2 + 18*fcum[4, 0] +  9*fcum[1, 0]*(2*fcum[2, 0] + 2*fcum[2, 0]^2 + 4*fcum[3, 0] + fcum[4, 0]) +  $
    9*fcum[2, 0]*(8*fcum[3, 0] + fcum[4, 0]) + 9*fcum[5, 0] + fcum[6, 0]

VarFCum[3,1]=6*(fcum[0, 1] + fcum[0, 2])*fcum[1, 0]^3 + 6*(fcum[0, 1] + fcum[0, 2])*fcum[2, 0]^3 +  36*fcum[1, 1]*fcum[2, 1] + 108*fcum[2, 1]^2 + 18*fcum[2, 0]^2*(3*fcum[0, 1] + 3*fcum[0, 2] + 5*fcum[1, 1] + fcum[1, 1]^2 +   $
    5*fcum[1, 2] + fcum[2, 1] + fcum[2, 2]) + 18*fcum[1, 0]^2*(fcum[1, 1] + fcum[1, 1]^2 + fcum[1, 2] +  (fcum[0, 1] + fcum[0, 2])*fcum[2, 0] + fcum[2, 1] + fcum[2, 2]) + 6*fcum[0, 1]*fcum[3, 0] + 6*fcum[0, 2]*fcum[3, 0] + 72*fcum[1, 1]*fcum[3, 0] +  $
    72*fcum[1, 1]^2*fcum[3, 0] + 72*fcum[1, 2]*fcum[3, 0] + 90*fcum[2, 1]*fcum[3, 0] + 54*fcum[1, 1]*fcum[2, 1]*fcum[3, 0] + 90*fcum[2, 2]*fcum[3, 0] + 9*fcum[0, 1]*fcum[3, 0]^2 + 9*fcum[0, 2]*fcum[3, 0]^2 + 6*fcum[3, 1] +     $
    108*fcum[1, 1]*fcum[3, 1] + 162*fcum[2, 1]*fcum[3, 1] + 18*fcum[3, 0]*fcum[3, 1] + 19*fcum[3, 1]^2 + 6*fcum[3, 2] + 18*fcum[3, 0]*fcum[3, 2] + 18*fcum[0, 1]*fcum[4, 0] +  $
    18*fcum[0, 2]*fcum[4, 0] + 45*fcum[1, 1]*fcum[4, 0] + 9*fcum[1, 1]^2*fcum[4, 0] + 45*fcum[1, 2]*fcum[4, 0] + 15*fcum[2, 1]*fcum[4, 0] + 15*fcum[2, 2]*fcum[4, 0] +     $
    18*fcum[4, 1] + 54*fcum[1, 1]*fcum[4, 1] + 24*fcum[2, 1]*fcum[4, 1] + 18*fcum[4, 2] + 9*fcum[1, 0]*(4*fcum[1, 1]^2 + 2*(fcum[0, 1] + fcum[0, 2])*fcum[2, 0]^2 + 2*fcum[2, 1] +  16*fcum[1, 1]*fcum[2, 1] + 5*fcum[2, 1]^2 + 2*fcum[2, 2] + $
    2*fcum[2, 0]*(fcum[0, 1] + fcum[0, 2] + 6*fcum[1, 1] + 2*fcum[1, 1]^2 + 6*fcum[1, 2] + 2*fcum[2, 1] + 2*fcum[2, 2]) + 4*(fcum[0, 1] + fcum[0, 2] + fcum[1, 1] + fcum[1, 2])* fcum[3, 0] + 4*fcum[3, 1] + 4*fcum[1, 1]*fcum[3, 1] + 4*fcum[3, 2] +  $
    fcum[0, 1]*fcum[4, 0] + fcum[0, 2]*fcum[4, 0] + fcum[4, 1] + fcum[4, 2]) + 9*fcum[2, 0]*(2*fcum[1, 1] + 14*fcum[1, 1]^2 + 2*fcum[1, 2] + 12*fcum[2, 1] +  28*fcum[1, 1]*fcum[2, 1] + 5*fcum[2, 1]^2 + 12*fcum[2, 2] +  $
    4*(2*fcum[0, 1] + 2*fcum[0, 2] + fcum[1, 1] + fcum[1, 2])*fcum[3, 0] + 8*fcum[3, 1] + 4*fcum[1, 1]*fcum[3, 1] + 8*fcum[3, 2] + (fcum[0, 1] + fcum[0, 2])*fcum[4, 0] + fcum[4, 1] + fcum[4, 2]) + 9*fcum[0, 1]*fcum[5, 0] + 9*fcum[0, 2]*fcum[5, 0] +   $
    6*fcum[1, 1]*fcum[5, 0] + 6*fcum[1, 2]*fcum[5, 0] + 9*fcum[5, 1] + 6*fcum[1, 1]*fcum[5, 1] + 9*fcum[5, 2] + fcum[0, 1]*fcum[6, 0] + fcum[0, 2]*fcum[6, 0] + fcum[6, 1] + fcum[6, 2]

VarFCum[3,2]=1.

VarFCum[3,3]=1.

VarFCum[3,4]=1.

VarFCum[4,0]=24*fcum[1, 0]^4 + 96*fcum[1, 0]^3*fcum[2, 0] + 720*fcum[2, 0]^3 + 24*fcum[2, 0]^4 + 720*fcum[3, 0]^2 + 24*fcum[4, 0] + 528*fcum[3, 0]*fcum[4, 0] + 34*fcum[4, 0]^2 +     $
    72*fcum[1, 0]^2*(2*fcum[2, 0] + 2*fcum[2, 0]^2 + 4*fcum[3, 0] + fcum[4, 0]) + 72*fcum[2, 0]^2*(1 + 12*fcum[3, 0] + fcum[4, 0]) + 96*fcum[5, 0] + 48*fcum[3, 0]*fcum[5, 0] + 72*fcum[6, 0] +   $
    16*fcum[1, 0]*(54*fcum[2, 0]^2 + 6*fcum[2, 0]^3 + 6*fcum[3, 0] + 9*fcum[3, 0]^2 + 18*fcum[4, 0] + 9*fcum[2, 0]*(8*fcum[3, 0] + fcum[4, 0]) + 9*fcum[5, 0] + fcum[6, 0]) +     $
    8*fcum[2, 0]*(120*fcum[3, 0] + 18*fcum[3, 0]^2 + 117*fcum[4, 0] + 30*fcum[5, 0] +  2*fcum[6, 0]) + 16*fcum[7, 0] + fcum[8, 0]

VarFCum[4,1]=1.

VarFCum[4,2]=1.

VarFCum[4,3]=1.

VarFCum[4,4]=1.

end