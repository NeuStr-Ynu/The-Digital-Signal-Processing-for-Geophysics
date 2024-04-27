program test2
    implicit none
    integer,dimension(2,15):: x,h,y
    integer::i,j,temp

    do i=1,15
        x(1,i)=i-8
        y(1,i)=1-8
        h(1,i)=1-8
    end do

    x(2,:)=(/0,0,0,0,0,0,0,0,1,2,3,4,6,0,0/)
    y(2,:)=(/0,0,0,0,0,2,1,5,7,0,0,0,0,0,0/)

    do i=1,7
        temp=x(2,i)
        x(2,i)=x(2,15-i+1)
        x(2,15-i+1)=temp
    end do

    open(1,file='ex2.dat')

    do i=1,15
        do j=15-i,1,-1
            x(2,j+1)=x(2,j)
        end do
        do j=1,15
            y(2,i)=x(2,j)*h(2,j)
        end do
        write(1,*) y(1,i),y(2,i)
    end do

    close(1)

    print*,'have finish the program and the data is now in ex2.dat'

end program test2