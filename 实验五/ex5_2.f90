! experiment 5 DFT
program ex_5
    implicit none

    integer::k,n
    complex,dimension(10)::X
    real,dimension(10)::x_,ABS_X,arg_X
    real::pi,im,re
    pi=acos(-1.0)

    x_=[1,1,1,1,1,0,0,0,0,0]

    !计算DFT
    do k=0,9
        X(k+1)=(0,0)
        do n=0,9
            re=cos(2*pi/10*n*k)
            im=-sin(2*pi/10*n*k)
            X(k+1)=X(k+1)+x_(n+1)*cmplx(re,im)
        end do
        ABS_X(k+1)=ABS(X(k+1))
        arg_X(k+1)=atan2(X(k+1)%im,X(k+1)%re)
    end do

    !打印输出
    open(1,file='eg_3.3_k.dat')
    open(2,file='eg_3.3_arg.dat')

    do n=-1,1
        do k=1,10
            write(1,*) k+10*n-1,ABS_X(k)
            write(2,*) k+10*n-1,arg_X(k)
        end do
    end do

    close(1)
    close(2)

    print*,'program has finished and data is now in eg_3.3_k.dat and eg_3.3_arg.dat'

end program ex_5