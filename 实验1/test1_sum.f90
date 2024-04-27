program test1
    implicit none
    real,dimension(400)::x,y1,y2,ysum
    integer :: i

    open(1,file='1054.dat')
    open(2,file='1055.dat')

    do i=1,400
        read(1,*) x(i),y1(i)
        read(2,*) x(i),y2(i)
        ysum(i)=y1(i)+y2(i)
    end do

    close(1)
    close(2)

    open(3,file='sum.dat')
    
    do i=1,400
        write(3,*) x(i),ysum(i)
    end do

    close(3)

    print *, 'Difference array created successfully and saved to sum.dat.'
end program test1