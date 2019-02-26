/********************************************
 * Amarilda Celhaka							*
 * CS 4250									*
 * Problem #2								*
 * Using logical language Prolog			*
 * Finding the maximum element of a list	*
 * ******************************************/
 


/*max returns true if X >= Y and false otherwise 
 * and stores the maximum in X*/
maxelementx(X, X, Y) :- X >=Y.

/*max returns true if X < Y and false otherwise
 * and the Max variable is Y*/
maxelementy(Y, X, Y) :- Y > X.


/*If the list has only one element, that element will be the max */
maximum(Max, [Max]).

/*We take the first two welements X and Y, Max = to the biggest element X and Z, where Z is the max
 * from the recursive call of the rest of the list*/
maximum(Max, [X, Y | Tail] ):-(    maximum(Z, [Y | Tail])), ( maxelementx(Max, X, Z) ; maxelementy(Max,X,Z)).