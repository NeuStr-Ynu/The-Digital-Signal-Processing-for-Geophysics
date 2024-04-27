program convolution
    implicit none
    integer,dimension(15):: x,h,y,e1
    integer::i,j,temp

    do i=1,15
        e1(i)=i-8
    end do
!       _ _ _ _ _ _ _ 0 1 2 3 4 5 6 7 
    y=0
    x=(/0,0,0,0,0,0,0,1,2,3,4,6,0,0,0/)
    h=(/0,0,0,0,0,2,1,5,7,0,0,0,0,0,0/)

!————画表————
    open(2,file='graph.dat')
    write(2,*) '_________initial_________'
    write(2,*) '        横坐标','       x(n)','        h(n)'
    do i=1,15
        write(2,*) e1(i),x(i),h(i)
    end do
    write(2,*) '_________________________','          y(n)'

!————翻折————
    do i=1,7
        temp=h(i)
        h(i)=h(15-i+1)
        h(15-i+1)=temp
    end do

!————向后移位————
    do i=1,2
        do j=1,14
            h(j)=h(j+1)
        end do
    end do

!————开始移位与求和————
    do j=1,15
        y(6)=y(6)+x(j)*h(j)
    end do


    do i=1,15
        write(2,*) e1(i),x(i),h(i)
    end do
    write(2,*) '__________________________',y(6)

    do i=7,15
        y(i)=0
        do j=15,2,-1
            h(j)=h(j-1)
        end do

        do j=1,15
            y(i)=y(i)+x(j)*h(j)
        end do

        do j=1,15
            write(2,*) e1(j),x(j),h(j)
        end do
        write(2,*) '_________________________',y(i)

    end do

!————输出y(n)————
    open(1,file='convolution_sum.dat')

    do i=1,15
        write(1,*) e1(i),y(i)
    end do

    close(1)
    close(2)
    print*,'the program finished and the data is now in convolution_sum.dat'

end program convolution

