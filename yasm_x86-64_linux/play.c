#define MAY_IN_MEM
int main ()
{
#ifdef NOT_IN_MEM
	register int a = 1;
	register int b = 2;
	register int c = a + b;
#endif

#ifdef IN_MEM
	int a = 1;
	int b = 2;
	int c = a+b;
#endif

#ifdef MAY_IN_MEM
	// ?? 
	register int a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13 =1;
	register int b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13  =2;
	register int c = a1+b1;
#endif

	return 0;
}