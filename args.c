/* args.f -- translated by f2c (version 20100827).
   You must link the resulting object file with libf2c:
	on Microsoft Windows system, link with libf2c.lib;
	on Linux or Unix systems, link with .../path/to/libf2c.a -lm
	or, if you install libf2c.a in a standard place, with -lf2c -lm
	-- in that order, at the end of the command line, as in
		cc *.o -lf2c -lm
	Source for libf2c is in /netlib/f2c/libf2c.zip, e.g.,

		http://www.netlib.org/f2c/libf2c.zip
*/

#include "f2c.h"

/* Table of constant values */

static integer c__1 = 1;

/* Main program */ int MAIN__(void)
{
    /* System generated locals */
    integer i__1;

    /* Builtin functions */
    integer s_wsfe(cilist *), do_fio(integer *, char *, ftnlen), e_wsfe(void);
    /* Subroutine */ int s_stop(char *, ftnlen);

    /* Local variables */
    static integer i__;
    extern /* Subroutine */ int timestamp_(void);
    static char arg[80];
    extern integer iargc_(void);
    extern /* Subroutine */ int getarg_(integer *, char *, ftnlen);
    static integer numarg;

    /* Fortran I/O blocks */
    static cilist io___1 = { 0, 6, 0, "(a)", 0 };
    static cilist io___2 = { 0, 6, 0, "(a)", 0 };
    static cilist io___3 = { 0, 6, 0, "(a)", 0 };
    static cilist io___4 = { 0, 6, 0, "(a)", 0 };
    static cilist io___5 = { 0, 6, 0, "(a)", 0 };
    static cilist io___7 = { 0, 6, 0, "(a)", 0 };
    static cilist io___8 = { 0, 6, 0, "(a,i8,a)", 0 };
    static cilist io___9 = { 0, 6, 0, "(a)", 0 };
    static cilist io___10 = { 0, 6, 0, "(a)", 0 };
    static cilist io___11 = { 0, 6, 0, "(a)", 0 };
    static cilist io___12 = { 0, 6, 0, "(a)", 0 };
    static cilist io___13 = { 0, 6, 0, "(a)", 0 };
    static cilist io___16 = { 0, 6, 0, "(2x,i3,2x,a)", 0 };
    static cilist io___17 = { 0, 6, 0, "(a)", 0 };
    static cilist io___18 = { 0, 6, 0, "(a)", 0 };
    static cilist io___19 = { 0, 6, 0, "(a)", 0 };
    static cilist io___20 = { 0, 6, 0, "(a)", 0 };


/* *********************************************************************72 */
/* gfortran args.f -o args */
/* *********************************************************************72 */

/* c MAIN is the main program for ARGS. */

/*  Discussion: */

/*    ARGS demonstrates the use of the (semi-standard) GETARGS utility. */

/*  Licensing: */

/*    This code is distributed under the GNU LGPL license. */

/*  Modified: */

/*    24 January 2009 */

/*  Author: */

/*    John Burkardt */

/*  Modified: */

/*    26 April 2007 */

/*  Author: */

/*    John Burkardt */

/*  Usage: */

/*    args arg1 arg2 arg3 ... */

    timestamp_();
    s_wsfe(&io___1);
    do_fio(&c__1, " ", (ftnlen)1);
    e_wsfe();
    s_wsfe(&io___2);
    do_fio(&c__1, "ARGS", (ftnlen)4);
    e_wsfe();
    s_wsfe(&io___3);
    do_fio(&c__1, "  FORTRAN77 version", (ftnlen)19);
    e_wsfe();
    s_wsfe(&io___4);
    do_fio(&c__1, "  Demonstrate the use of the command line", (ftnlen)41);
    e_wsfe();
    s_wsfe(&io___5);
    do_fio(&c__1, "  argument routines GETARG and IARGC.", (ftnlen)37);
    e_wsfe();
    numarg = iargc_();
    s_wsfe(&io___7);
    do_fio(&c__1, " ", (ftnlen)1);
    e_wsfe();
    s_wsfe(&io___8);
    do_fio(&c__1, "  ARGS was called with IARGC() = ", (ftnlen)33);
    do_fio(&c__1, (char *)&numarg, (ftnlen)sizeof(integer));
    do_fio(&c__1, " arguments.", (ftnlen)11);
    e_wsfe();
    s_wsfe(&io___9);
    do_fio(&c__1, " ", (ftnlen)1);
    e_wsfe();
    s_wsfe(&io___10);
    do_fio(&c__1, "  CALL GETARG(I,ARG) returns the arguments:", (ftnlen)43);
    e_wsfe();
    s_wsfe(&io___11);
    do_fio(&c__1, " ", (ftnlen)1);
    e_wsfe();
    s_wsfe(&io___12);
    do_fio(&c__1, "  I     ARG ", (ftnlen)12);
    e_wsfe();
    s_wsfe(&io___13);
    do_fio(&c__1, " ", (ftnlen)1);
    e_wsfe();
    i__1 = numarg;
    for (i__ = 0; i__ <= i__1; ++i__) {
	getarg_(&i__, arg, (ftnlen)80);
	s_wsfe(&io___16);
	do_fio(&c__1, (char *)&i__, (ftnlen)sizeof(integer));
	do_fio(&c__1, arg, (ftnlen)80);
	e_wsfe();
    }
    s_wsfe(&io___17);
    do_fio(&c__1, " ", (ftnlen)1);
    e_wsfe();
    s_wsfe(&io___18);
    do_fio(&c__1, "ARGS:", (ftnlen)5);
    e_wsfe();
    s_wsfe(&io___19);
    do_fio(&c__1, "  Normal end of execution.", (ftnlen)26);
    e_wsfe();
    s_wsfe(&io___20);
    do_fio(&c__1, " ", (ftnlen)1);
    e_wsfe();
    timestamp_();
    s_stop("", (ftnlen)0);
    return 0;
} /* MAIN__ */

/* Subroutine */ int timestamp_(void)
{
    /* Initialized data */

    static char month[9*12] = "January  " "February " "March    " "April    " 
	    "May      " "June     " "July     " "August   " "September" "Oct"
	    "ober  " "November " "December ";

    /* Builtin functions */
    integer s_rsfi(icilist *), do_fio(integer *, char *, ftnlen), e_rsfi(void)
	    ;
    /* Subroutine */ int s_copy(char *, char *, ftnlen, ftnlen);
    integer s_wsfe(cilist *), e_wsfe(void);

    /* Local variables */
    static integer d__, h__, m, n, s, y, mm;
    static char date[8], ampm[8], time[10];
    extern /* Subroutine */ int date_and_time__(char *, char *, ftnlen, 
	    ftnlen);

    /* Fortran I/O blocks */
    static icilist io___24 = { 0, date, 0, "(i4,i2,i2)", 8, 1 };
    static icilist io___28 = { 0, time, 0, "(i2,i2,i2,1x,i3)", 10, 1 };
    static cilist io___34 = { 0, 6, 0, "(i2,1x,a,1x,i4,2x,i2,a1,i2.2,a1,i2.2"
	    ",a1,i3.3,1x,a)", 0 };


/* *********************************************************************72 */

/* c TIMESTAMP prints out the current YMDHMS date as a timestamp. */

/*  Discussion: */

/*    This FORTRAN77 version is made available for cases where the */
/*    FORTRAN90 version cannot be used. */

/*  Licensing: */

/*    This code is distributed under the GNU LGPL license. */

/*  Modified: */

/*    24 January 2009 */

/*  Author: */

/*    John Burkardt */

/*  Modified: */

/*    12 January 2007 */

/*  Author: */

/*    John Burkardt */

/*  Parameters: */

/*    None */

    date_and_time__(date, time, (ftnlen)8, (ftnlen)10);
    s_rsfi(&io___24);
    do_fio(&c__1, (char *)&y, (ftnlen)sizeof(integer));
    do_fio(&c__1, (char *)&m, (ftnlen)sizeof(integer));
    do_fio(&c__1, (char *)&d__, (ftnlen)sizeof(integer));
    e_rsfi();
    s_rsfi(&io___28);
    do_fio(&c__1, (char *)&h__, (ftnlen)sizeof(integer));
    do_fio(&c__1, (char *)&n, (ftnlen)sizeof(integer));
    do_fio(&c__1, (char *)&s, (ftnlen)sizeof(integer));
    do_fio(&c__1, (char *)&mm, (ftnlen)sizeof(integer));
    e_rsfi();
    if (h__ < 12) {
	s_copy(ampm, "AM", (ftnlen)8, (ftnlen)2);
    } else if (h__ == 12) {
	if (n == 0 && s == 0) {
	    s_copy(ampm, "Noon", (ftnlen)8, (ftnlen)4);
	} else {
	    s_copy(ampm, "PM", (ftnlen)8, (ftnlen)2);
	}
    } else {
	h__ += -12;
	if (h__ < 12) {
	    s_copy(ampm, "PM", (ftnlen)8, (ftnlen)2);
	} else if (h__ == 12) {
	    if (n == 0 && s == 0) {
		s_copy(ampm, "Midnight", (ftnlen)8, (ftnlen)8);
	    } else {
		s_copy(ampm, "AM", (ftnlen)8, (ftnlen)2);
	    }
	}
    }
    s_wsfe(&io___34);
    do_fio(&c__1, (char *)&d__, (ftnlen)sizeof(integer));
    do_fio(&c__1, month + (m - 1) * 9, (ftnlen)9);
    do_fio(&c__1, (char *)&y, (ftnlen)sizeof(integer));
    do_fio(&c__1, (char *)&h__, (ftnlen)sizeof(integer));
    do_fio(&c__1, ":", (ftnlen)1);
    do_fio(&c__1, (char *)&n, (ftnlen)sizeof(integer));
    do_fio(&c__1, ":", (ftnlen)1);
    do_fio(&c__1, (char *)&s, (ftnlen)sizeof(integer));
    do_fio(&c__1, ".", (ftnlen)1);
    do_fio(&c__1, (char *)&mm, (ftnlen)sizeof(integer));
    do_fio(&c__1, ampm, (ftnlen)8);
    e_wsfe();
    return 0;
} /* timestamp_ */

/* Main program alias */ int main_ () { MAIN__ (); return 0; }
