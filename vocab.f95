PROGRAM vocabulary_word_count
!-----------------------------------------------------------------------------!
! Counts the number of "words" contained in a file. The words are assumed to  ! 
! be terminated by any one of:                                                ! 
! space,comma,period,!,?, or the EoR                                          ! 
! The file may have records of any length and the file may contain any number ! 
! of records.                                                                 ! 
! The program prompts for the name of the file to be subject to a word count  ! 
! and the result is written to the default output unit                        ! 
! Also builds a list of the vocabulary found and the frequency of occurence   !
! of each different word.                                                     !
!-----------------------------------------------------------------------------! 
USE ISO_VARYING_STRING 
IMPLICIT NONE
type(VARYING_STRING) :: line,word,fname 
INTEGER              :: ierr,nd,wcount=0 
!-----------------------------------------------------------------------------!
! Vocabulary list and frequency count arrays. The size of these arrays will   !
! be extended dynamically in steps of 100 as the used vocabulary grows        !
!-----------------------------------------------------------------------------!
type(VARYING_STRING),ALLOCATABLE,DIMENSION(:) :: vocab
INTEGER,ALLOCATABLE,DIMENSION(:)              :: freq
INTEGER                                       :: list_size=200,list_top=0
INTEGER :: i   ! loop index
!-----------------------------------------------------------------------------!
! Initialise the lists and determine the file to be processed                 !
!-----------------------------------------------------------------------------!
ALLOCATE(vocab(1:list_size),freq(1:list_size))
WRITE(*,ADVANCE='NO',FMT='(A)') " Input name of file?" 
CALL GET(STRING=fname)  ! read the required filename from the default 
                  ! input unit assumed to be the whole of the record read
OPEN(UNIT=1,FILE=CHAR(fname))  ! CHAR(fname) converts to the type 
                               ! required by FILE= specifier 
file_read: DO ! until EoF reached 
  CALL GET(1,line,IOSTAT=ierr)  ! read next line of file 
  IF(ierr == -1 .OR. ierr > 0)EXIT file_read
  word_scan: DO ! until end of line 
    nd=SCAN(line," ,.!?")  ! scan to find end of word 
    IF(nd == 0)THEN  ! EoR is end of word 
      nd = LEN(line)+1
      EXIT word_scan 
    ENDIF 
    IF(nd > 1)THEN  ! at least one non-terminator character in the word
       wcount=wcount+1
       word = EXTRACT(line,1,nd-1)
       CALL update_vocab_lists
    ENDIF
    line = REMOVE(line,1,nd)  ! strips the counted word and its terminator 
                              ! from the line reducing its length before
                              ! rescanning for the next word
  ENDDO word_scan 
  IF(nd > 1)THEN  ! at least one character in the word
     wcount=wcount+1
     word = EXTRACT(line,1,nd-1)
     CALL update_vocab_lists
   ENDIF
ENDDO file_read 
IF(ierr < 0)THEN 
  WRITE(*,*) "No. of words in file =",wcount 
  WRITE(*,*) "There are ",list_top,"  distinct words"
  WRITE(*,*) "with the following frequencies of occurence"
  print_loop: DO i=1,list_top
    WRITE(*,FMT='(1X,I6,2X)',ADVANCE='NO') freq(i)
    CALL PUT_LINE(STRING=vocab(i))
  ENDDO print_loop
ELSEIF(ierr > 0)THEN 
  WRITE(*,*) "Error in GET in vocabulary_word_count, No.",ierr
ENDIF 

CONTAINS

SUBROUTINE extend_lists
!-----------------------------------------------------------------------------!
! Accesses the host variables:                                                !
!  type(VARYING_STRING),ALLOCATABLE,DIMENSION(:) :: vocab                     !
!  INTEGER,ALLOCATABLE,DIMENSION(:)              :: freq                      !
!  INTEGER                                       :: list_size                 !
! so as to extend the size of the lists preserving the existing vocabulary    !
! and frequency information in the new extended lists                         !
!-----------------------------------------------------------------------------!
type(VARYING_STRING),DIMENSION(list_size) :: vocab_swap
INTEGER,DIMENSION(list_size)              :: freq_swap
INTEGER,PARAMETER :: list_increment=100
INTEGER           :: new_list_size,alerr
vocab_swap = vocab  ! copy old list into temporary space
freq_swap =freq
new_list_size = list_size + list_increment
DEALLOCATE(vocab,freq)
ALLOCATE(vocab(1:new_list_size),freq(1:new_list_size),STAT=alerr)
IF(alerr /= 0)THEN
  WRITE(*,*) "Unable to extend vocabulary list"
  STOP
ENDIF
vocab(1:list_size) = vocab_swap   ! copy old list back into bottom
freq(1:list_size) = freq_swap     ! of new extended list
list_size = new_list_size
ENDSUBROUTINE extend_lists

SUBROUTINE update_vocab_lists
!-----------------------------------------------------------------------------!
! Accesses the host variables:                                                !
!  type(VARYING_STRING),ALLOCATABLE,DIMENSION(:) :: vocab                     !
!  INTEGER,ALLOCATABLE,DIMENSION(:)              :: freq                      !
!  INTEGER                                       :: list_size,list_top        !
!  type(VARYING_STRING)                          :: word                      !
! searches the existing words in vocab to find a match for word               !
! if found increments the freq if not found adds word to                      !
! list_top + 1  vocab list and sets corresponding freq to 1                   !
! if list_size exceeded extend the list size before updating                  !
!-----------------------------------------------------------------------------!
INTEGER :: i   ! loop index 
list_search: DO i=1,list_top
  IF(word == vocab(i))THEN
    freq(i) = freq(i) + 1
    RETURN
  ENDIF
ENDDO list_search
IF(list_top == list_size)THEN
  CALL extend_lists
ENDIF
list_top = list_top + 1
vocab(list_top) = word
freq(list_top) = 1
ENDSUBROUTINE update_vocab_lists

ENDPROGRAM vocabulary_word_count
