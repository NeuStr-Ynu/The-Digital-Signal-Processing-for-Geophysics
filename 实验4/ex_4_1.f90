program ex_4_1
    implicit none

    real,dimension(100)::x_a,n
    integer::i,f_0,f_s
    real::pi

    pi=acos(-1.0)
    f_0=50
    f_s=200

    do i=1,100
        x_a(i)=sin(2*pi*f_0*i/f_s+pi/8)
        n(i)=i/200.0
    end do

    open(1,file='ex_4_1.dat')
    do i=1,100
        write(1,'(F10.5, 2X, F10.5)') n(i),x_a(i)
    end do
    close(1)
    
    print*,'have finish the program and the data is now in ex_4_1.dat'
end program ex_4_1