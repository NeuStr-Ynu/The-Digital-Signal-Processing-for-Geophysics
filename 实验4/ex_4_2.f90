program ex_4_2
    implicit none

    !定义相关变量与赋值
    real,dimension(2000)::x_a1,n1
    real,dimension(256)::x_a2,n2
    real,dimension(57600)::x_a3,n3
    integer::i
    real::pi,f_s,f_0

    pi=acos(-1.0)

    !打开文件
    open(1,file='ex_4_2.dat')
    open(2,file='ex_4_3.dat')
    open(3,file='ex_4_4.dat')

    !第一个
    f_0=125.0
    f_s=4*f_0

    do i=1,2000
        x_a1(i)=cos(2*pi*f_0*i/f_s)
        n1(i)=i/f_s
    end do


    do i=1,2000
        write(1,'(F10.5, 2X, F10.5)') n1(i),x_a1(i)
    end do
    
    
    !第二个

    f_0=15.916
    f_s=4*f_0

    do i=1,256
        x_a2(i)=cos(100*i/f_s)
        n2(i)=i/f_s
    end do


    do i=1,256
        write(2,'(F10.5, 2X, F10.5)') n2(i),x_a2(i)
    end do

    !第三个

    f_0=3600
    f_s=4*f_0

    do i=1,57600
        x_a3(i)=cos(2*pi*50*i/f_s)+cos(2*pi*80*i/f_s)+cos(2*pi*180*i/f_s)
        n3(i)=i/f_s
    end do


    do i=1,57600
        write(3,'(F10.5, 2X, F10.5)') n3(i),x_a3(i)
    end do

    !关闭文件
    close(1)
    close(2)
    close(3)

    print*,'have finish the program and the data is now in ex_4_2_2.dat,ex_4_2_3.dat and ex_4_2_4.dat'
end program ex_4_2