program convolution
    implicit none
    integer,dimension(19):: x,h,y,e1
    integer::i,j,temp

    do i=1,19
        e1(i)=i-10
    end do
!       _ _ _ _ _ _ _ _ _ 0 1 2 3 4 5 6 7 8 9
    y=0
    x=(/0,0,0,0,0,0,0,0,0,5,4,3,2,1,0,0,0,0,0/)
    h=(/0,0,0,0,0,0,0,0,0,2,4,6,0,0,0,0,0,0,0/)

!————画表————
    open(2,file='graph1.dat')
    write(2,*) '_________initial_________'
    write(2,*) '        横坐标','       x(n)','        h(n)'
    do i=1,19
        write(2,*) e1(i),x(i),h(i)
    end do
    write(2,*) '_________________________','          y(n)'

!————翻折————(互相关函数没有这一步)
    !do i=1,9
    !    temp=h(i)
    !    h(i)=h(19-i+1)
    !    h(19-i+1)=temp
    !end do

!————向后移位————
    do i=1,2
        do j=1,18
            h(j)=h(j+1)
        end do
    end do

!————开始移位与求和————
    do j=1,19
        y(10)=y(10)+x(j)*h(j)
    end do


    do i=1,19
        write(2,*) e1(i),x(i),h(i)
    end do
    write(2,*) '__________________________',y(6)

    do i=11,19
        y(i)=0
        do j=19,2,-1
            h(j)=h(j-1)
        end do

        do j=1,19
            y(i)=y(i)+x(j)*h(j)
        end do

        do j=1,19
            write(2,*) e1(j),x(j),h(j)
        end do
        write(2,*) '_________________________',y(i)

    end do

!————输出y(n)————
    open(1,file='cross_correlation.dat')

    do i=1,19
        write(1,*) e1(i),y(i)
    end do

    close(1)
    close(2)
    print*,'the program finished and the data is now in convolution_sum.dat'

end program convolution

