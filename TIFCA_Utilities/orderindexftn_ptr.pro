function orderindexftn_ptr, nch, split=split

order_ptr = ptrarr(5, /allocate_heap)

case nch of
    2: begin
       order_ptr[1] = ptr_new( [[1,0], [0,1]] )
       order_ptr[2] = ptr_new( [[2,0], [0,2], [1,1]] )
       order_ptr[3] = ptr_new( [[3,0], [0,3], [2,1], [1,2]] )
       order_ptr[4] = ptr_new( [[4,0], [0,4], [3,1], [1,3], [2,2]] )
    end
    
    3: begin
       if ~keyword_set(split) then begin
       order_ptr[1] = ptr_new( [[1,0,0], [0,1,0], [0,0,1]] )
       order_ptr[2] = ptr_new( [[2,0,0], [0,2,0], [0,0,2], $
                                [1,1,0], [1,0,1], [0,1,1]] )
       order_ptr[3] = ptr_new( [[3,0,0], [0,3,0], [0,0,3], $
                                [2,1,0], [2,0,1], [1,2,0], $
                                [0,2,1], [1,0,2], [0,1,2], $
                                [1,1,1]] )
       order_ptr[4] = ptr_new( [[4,0,0], [0,4,0], [0,0,4], $
                                [3,1,0], [3,0,1], [1,3,0], $
                                [0,3,1], [1,0,3], [0,1,3], $
                                [2,2,0], [2,0,2], [0,2,2], $
                                [2,1,1], [1,2,1], [1,1,2]] )
       endif else begin
       order_ptr = ptrarr(10, /allocate_heap)
       order_ptr[1] = ptr_new( [[1,0,0], [0,1,0], [0,0,1]] )
       order_ptr[2] = ptr_new( [[2,0,0], [0,2,0], [0,0,2]] )
       order_ptr[3] = ptr_new( [[1,1,0], [1,0,1], [0,1,1]] )
       order_ptr[4] = ptr_new( [[3,0,0], [0,3,0], [0,0,3], [1,1,1]] )
       order_ptr[5] = ptr_new( [[2,1,0], [2,0,1], [1,2,0], $
                                [0,2,1], [1,0,2], [0,1,2]] )
       order_ptr[6] = ptr_new( [[4,0,0], [0,4,0], [0,0,4]] )
       order_ptr[7] = ptr_new( [[3,1,0], [3,0,1], [1,3,0], $
                                [0,3,1], [1,0,3], [0,1,3]] )
       order_ptr[8] = ptr_new( [[2,2,0], [2,0,2], [0,2,2]] )
       order_ptr[9] = ptr_new( [[2,1,1], [1,2,1], [1,1,2]] )                                                         
       endelse
    end
endcase

result = order_ptr

return, result

end