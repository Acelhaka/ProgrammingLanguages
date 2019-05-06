/*
 ============================================================================
 Name        : PLAssignment7.c
 Author      : Amarilda Celhaka
 Description : Writing a program in C that examines activation records in
 	 	 	 : the runtime stack.
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#define SIZE 1000

//function prototypes
void f1();
void f2();
void f3();


int main() {


	//printf("\nCalling function f1():");
	//f1();

	//printf("\nCalling function f2():");
	//f2();

	printf("\nCalling function f3():");
	f3();

	return 0;
}



/*Function f1() should meet the following requirements:

-	It must define a local array of char values. The size must be adjustable via define macro.
 	 The default size could be 1000.
-	It must also define a static int n that increments the number of activation records.
-	It must also define a static long int addr that stores the starting address of the array.
-	Then it must print the current activation record number, the memory address of the current array,
	followed by the estimated size of the current activation record as a distance (difference)
	between the current array address and the array address from the previous activation record.
-	Finally, it must recursively call itself, if the activation record count has not exceeded 10.
 *
 */

void f1(){

	char array[SIZE] ;

	//n- activation records number
	static int n = 0;

	static long int addr;

	n++;

	printf("\nCall #%d \t at %p",n , (void *)array);

	long int arSize = addr - (long int)array;

	printf("\nAR SIZE \t #%d  is %ld \n", n, arSize);

	addr = (long int)array;
	if(n < 10)
		 f1();

	else
		exit(0);

}




/*Function f2() should meet the following requirements:
-	It must do everything f1() does, except this time the recursion never ends until segmentation fault.
-	In addition, in each call, it must print the estimated size of the runtime stack as a product of the
 	 size of current activation record and the total count of activation records so far.
 */

void f2(){

	    char array[SIZE] ;

		//n- activation records number
		static int n = 0;

		static long int addr;

		n++;

		printf("\nCall #%d \t at \t%p",n , (void *)array);

		printf("\nAR SIZE \t #%d  is %ld ", n, ( addr - (long int) array));

		long int stackSize = ( addr - (long int) array) * n;

		printf("\nStack Size \t #%d  is %ld\n", n, stackSize);

		addr = (long int) array;

		//Call f2() again
		f2();
}






/*
 * Function f3() should meet the following requirements:
-	It must do everything f1() does, except this time use malloc to dynamically
 	allocate the array in the heap instead of stack.
-	Also, introduce another local variable, say, char c, to measure the size of the
 	current activation record.
-	Make sure to free the array from the heap before recursive call to yourself.
-	As with f1(), make sure the recursion ends after 10 calls.
 *
 */

void f3(){


		char *array ;

		array = malloc(sizeof(char) * SIZE);

		//n- activation records number
		static int n = 0;


		static long int addr;

		n++;
		char c;
		printf("\nCall #%d \t at %p",n , &c);

		printf("\nAR SIZE \t #%d  is %ld \n", n, (addr - (long int)&c));

		addr = (long int)&c;


		free(array);

		if(n < 10)
			 f3();

		else
			exit(0);

}

