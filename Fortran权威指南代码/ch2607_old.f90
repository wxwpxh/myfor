MODULE Node_Type_Def
IMPLICIT NONE
  TYPE Tree_Node
  INTEGER :: Number
  TYPE (Tree_Node) , POINTER :: Left,Right
  END TYPE Tree_Node
END MODULE Node_Type_Def

PROGRAM ch2607
! Construction of a perfectly balanced tree
USE Node_Type_Def
IMPLICIT NONE
TYPE (Tree_Node) , POINTER :: Root
INTEGER :: N_of_Items

INTERFACE

  RECURSIVE FUNCTION Tree(N) RESULT(Answer)
    USE Node_Type_Def
    IMPLICIT NONE
    INTEGER , INTENT(IN) :: N
    TYPE (Tree_Node) , POINTER :: Answer
  END FUNCTION Tree

  SUBROUTINE Print_Tree(Trees,H)
    USE Node_Type_Def
    IMPLICIT NONE
    TYPE (Tree_Node) , POINTER :: Trees
    INTEGER :: H
  END SUBROUTINE Print_Tree

END INTERFACE

  PRINT *,' Enter number of items'
  READ *,N_Of_Items
  Root=>Tree(N_Of_Items)
  CALL Print_Tree(Root,0)

END PROGRAM ch2607

RECURSIVE FUNCTION Tree(N) RESULT (Answer)
USE Node_Type_Def
IMPLICIT NONE
INTEGER , INTENT(IN) :: N
TYPE (Tree_Node) , POINTER :: Answer
TYPE (Tree_Node) , POINTER :: New_Node

INTEGER :: L,R,X
  IF (N == 0) THEN
    print *,' terminate tree'
    NULLIFY(Answer)
  ELSE
    L=N/2
    R=N-L-1
    PRINT *,L,R,N
    PRINT *,' Next item'
    READ *,X
    ALLOCATE(New_Node)
    New_Node%Number=X
    print *, ' left branch'
    New_Node%Left => Tree(L)
    print *, ' right branch'
    New_Node%Right => Tree(R)
    Answer => New_Node
  ENDIF
  PRINT *, ' Function tree ends'
END FUNCTION Tree

RECURSIVE SUBROUTINE Print_Tree(T,H)
USE Node_Type_Def
IMPLICIT NONE
TYPE (Tree_Node) , POINTER :: T
INTEGER :: I
INTEGER :: H
  IF (ASSOCIATED(T)) THEN
    CALL Print_Tree(T%Left,H+1)
    DO I=1,H
      WRITE(UNIT=*,FMT=10,ADVANCE='NO')
      10 FORMAT('   ')
    ENDDO
    PRINT *,T%Number
    CALL Print_Tree(T%Right,H+1)
  ENDIF
END SUBROUTINE Print_Tree


