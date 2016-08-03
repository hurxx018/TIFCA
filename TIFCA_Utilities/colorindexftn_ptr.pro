function colorindexftn_ptr, nch, split=split

color_ptr = ptrarr(5, /allocate_heap)

case nch of
    2: begin
       color_ptr[1] = ptr_new( ["Black", "Black"])
       color_ptr[2] = ptr_new( ["Black", "Black", "Maroon"] )
       color_ptr[3] = ptr_new( ["Black", "Black", "Blue", "Blue"] )
       color_ptr[4] = ptr_new( ["Black", "Black", "Blue", "Blue", "Maroon"] )
    end
    
    3: begin
       if ~keyword_set(split) then begin
       color_ptr[1] = ptr_new( ["Black", "Black", "Black"] )
       color_ptr[2] = ptr_new( ["Black", "Black", "Black", $
                                "Maroon", "Maroon", "Maroon"] )
       color_ptr[3] = ptr_new( ["Black", "Black", "Black", $
                                "Blue", "Blue", "Blue", $
                                "Blue", "Blue", "Blue", $
                                "Green"] )
       color_ptr[4] = ptr_new( ["Black", "Black", "Black", $
                                "Blue", "Blue", "Blue", $
                                "Blue", "Blue", "Blue", $
                                "Maroon", "Maroon", "Maroon", $
                                "Green", "Green", "Green"] )
       endif else begin
       color_ptr = ptrarr(10, /allocate_heap)
       color_ptr[1] = ptr_new( ["Black", "Black", "Black"] )
       color_ptr[2] = ptr_new( ["Black", "Black", "Black"] )
       color_ptr[3] = ptr_new( ["Maroon", "Maroon", "Maroon"] )
       color_ptr[4] = ptr_new( ["Black", "Black", "Black", "Green"] )
       color_ptr[5] = ptr_new( ["Black", "Blue", "Black", "Blue", "Black", "Blue"] )
       color_ptr[6] = ptr_new( ["Black", "Black", "Black"])
       color_ptr[7] = ptr_new( ["Black", "Blue", "Black", $
                                "Blue", "Black", "Blue"] )
       color_ptr[8] = ptr_new( ["Black", "Black", "Black"] )
       color_ptr[9] = ptr_new( ["Black", "Black", "Black"] )
       
       endelse
    end
endcase

result = color_ptr

return, result

end