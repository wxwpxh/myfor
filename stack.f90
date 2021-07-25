module class_stack
    type, abstract :: stack_structure
    contains
        procedure(copy), deferred :: copy
    end type stack_structure

    abstract interface
        subroutine copy(self, object)
            import :: stack_structure
            class(stack_structure), intent(in) :: self
            class(stack_structure), intent(out) :: object
        end subroutine copy
    end interface

    type :: stack_class
        private
        class(stack_structure), pointer :: object => null()
        type(stack_class), pointer :: next => null()
    contains
        procedure :: push => stack_push
        procedure :: pop => stack_pop
        final :: stack_cleanup
    end type stack_class
contains
    subroutine stack_push(self, object)
        class(stack_class), intent(inout), target :: self
        class(stack_structure), intent(in) :: object
        class(stack_class), pointer :: next

        if (associated(self%object)) then
            next => self%next
            allocate(self%next)
            self%next%object => self%object
            self%next%next => next
        end if

        allocate(self%object, source=object)
    end subroutine stack_push

    function stack_pop(self, object) result(success)
        class(stack_class), intent(inout), target :: self
        class(stack_structure), intent(out) :: object
        logical :: success
        class(stack_class), pointer :: next

        if (.not. associated(self%object)) then
            success = .false.
        else
            success = .true.
            call self%object%copy(object)
            deallocate(self%object)
        end if

        if (associated(self%next)) then
            next => self%next

            self%object => next%object
            self%next => next%next

            next%object => null()
            next%next => null()
            deallocate(next)
        end if
    end function stack_pop

    elemental subroutine stack_cleanup(self)
        type(stack_class), intent(inout) :: self

        if (associated(self%object)) then
            deallocate(self%object)
        end if

        if (associated(self%next)) then
            deallocate(self%next)
        end if
    end subroutine stack_cleanup
end module class_stack

module class_token
    use class_stack
    type, extends(stack_structure) :: token_structure
        character(len=:), allocatable :: key
    contains
        procedure :: copy => token_copy
    end type token_structure

    interface token_structure
        procedure :: token_create_object
    end interface token_structure
contains
    elemental function token_create_object(key) result(token)
        character(len=*), intent(in) :: key
        type(token_structure) :: token

        token%key = trim(adjustl(key))
    end function token_create_object

    subroutine token_copy(self, object)
        class(token_structure), intent(in) :: self
        class(stack_structure), intent(out) :: object

        select type(object)
        class is(token_structure)
            object%key = self%key
        end select
    end subroutine token_copy
end module class_token

program main
    use class_stack
    use class_token

    type(stack_class) :: stack
    type(token_structure) :: token

    call stack%push(token_structure("world"))
    call stack%push(token_structure("hello"))

    do while(stack%pop(token))
        write(*,*) token%key
    end do
end program main