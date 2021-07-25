
Module complex_class

    implicit none

    type, public     :: complex_ob  !.. 声明一个面向对象的type与对应的procedure

        private

        real         :: re

        real         :: im

    contains

        procedure    :: cons => construct_complex  !.. 此处用cons指向procedure，以便在外部调用

    end type complex_ob

    type(complex_ob) :: testcm

    public           :: construct_complex

contains

    subroutine construct_complex( this, cm )  !.. 注意此处的this

        implicit none

        class( complex_ob )    :: this  !.. this的声明

        complex, intent(inout) :: cm

        

        testcm%re = 1.0; testcm%im = 2.0

        cm = cmplx(testcm%re, testcm%im)

        

    end subroutine construct_complex

    

End module complex_class    

    

Program testOOP

    use complex_class

    implicit none

    

    complex          :: cm

    

    cm = 0.

    call testcm%cons( cm ) !.. 调用type中的procedure

    print*, cm

    

End program testOOP
