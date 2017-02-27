/*
 *------------------------------------------------------------------------
 * vim: ts=8 sw=8
 *------------------------------------------------------------------------
 * Author:   tf135c (James Reynolds)
 * Filename: likes-of-you.c
 * Created:  2007-02-26 10:21:56
 *------------------------------------------------------------------------
 */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#include <gcc-compat.h>

#if	FN==1
int
f1(
	int		x
)
{
	if( unlikely( x ) )	{
		x = 5;
		x = x * x;
	} else	{
		x = 6;
	}
	return( x );
}
#endif	/* FN==1 */

#if	FN==2
int
f2(
	int		x
)
{
	if( likely( x ) )	{
		x = 5;
		x = x * x;
	} else	{
		x = 6;
	}
	return( x );
}
#endif	/* FN==2 */

#if	FN==3
int
f3(
	int		x
)
{
	if( likely( x ) )	{
		x = 5;
		x = x * x;
	}
	return( x );
}
#endif	/* FN==3 */

#if	FN==4
int
f4(
	int		x
)
{
	if( unlikely( x ) )	{
		x = 5;
		x = x * x;
	}
	return( x );
}
#endif	/* FN==4 */
