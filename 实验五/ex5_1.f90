! experiment 5 DFT
program ex_5
    implicit none

    integer::k,n
    complex,dimension(5)::X
    real,dimension(5)::x_,ABS_X
    real::pi,im,re
    pi=acos(-1.0)

    x_=[1,1,1,1,1]

    !计算DFT
    do k=0,4
        X(k+1)=(0,0)
        do n=0,4
            re=cos(2*pi/5*n*k)
            im=-sin(2*pi/5*n*k)
            X(k+1)=X(k+1)+x_(n+1)*cmplx(re,im)
        end do
    ABS_X(k+1)=ABS(X(k+1))
    end do

    !打印输出
    open(1,file='eg_3.2_k.dat')

    do n=-1,1
        do k=1,5
            write(1,*) k+5*n-1,ABS_X(k)
        end do
    end do

    close(1)

    print*,'program has finished and data is now in eg_3.2_k.dat'

end program ex_5