program test1    
    implicit none    
    real, dimension(401) :: y,x    
    real, dimension(400) :: p    
    integer :: i    
    
    y(401) = 0  
    
    open(1, file='1055.dat')    
    do i = 1, 400    
        read(1, *) x(i),y(i)  
    end do    
    close(1)
    

    p(1) = y(2) - y(1)  
    do i = 1, 399  
        p(i) = y(i+1) - y(i)  
    end do    
    
    
    open(2, file='1055_.dat', status='replace', action='write')  
    do i = 1, 400    
        write(2, *) p(i),x(i) 
    end do    
    close(2) 
    
    print *, 'Difference array created successfully and saved to 1054_.dat.'   
end program test1