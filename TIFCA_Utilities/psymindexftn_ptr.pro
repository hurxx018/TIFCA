function psymindexftn_ptr, nch, split=split

psym_ptr = ptrarr(5, /allocate_heap)

case nch of
    2: begin
       psym_ptr[1] = ptr_new( [5, 6])
       psym_ptr[2] = ptr_new( [5, 6, 9] )
       psym_ptr[3] = ptr_new( [5, 6, 5, 6] )
       psym_ptr[4] = ptr_new( [5, 6, 5, 6, 9] )
    end
    
    3: begin
       if ~keyword_set(split) then begin
       psym_ptr[1] = ptr_new( [5, 6, 9] )
       psym_ptr[2] = ptr_new( [5, 6, 9, 25, 27, 4] )
       psym_ptr[3] = ptr_new( [5, 6, 9, 5, 17, 6, 15, 9, 16, 45] )
       psym_ptr[4] = ptr_new( [5, 6, 9, 5, 17, 6, 15, 9, 16, 25, 27, 4, 5, 6, 9] )
       endif else begin
       psym_ptr = ptrarr(10, /allocate_heap)
       psym_ptr[1] = ptr_new( [5, 6, 9] )
       psym_ptr[2] = ptr_new( [5, 6, 9] )
       psym_ptr[3] = ptr_new( [25, 27, 4] )
       psym_ptr[4] = ptr_new( [5, 6, 9, 45] )
       psym_ptr[5] = ptr_new( [5, 17, 6, 15, 9, 16] )
       psym_ptr[6] = ptr_new( [5, 6, 9] )
       psym_ptr[7] = ptr_new( [5, 17, 6, 15, 9, 16] )
       psym_ptr[8] = ptr_new( [25, 27, 4] )
       psym_ptr[9] = ptr_new( [5, 6, 9] )       
       endelse
    end
endcase

result = psym_ptr

return, result

end