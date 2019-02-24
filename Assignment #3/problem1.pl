/************************************
 * Amarilda Celhaka					*
 * CS 4250							*
 * Problem #1						*
 * Using logical language Prolog	*
 * **********************************/
 
/*Facts*/
male(pete).
male(mark).
male(tom).
male(john).
male(frank).
male(matt).
male(henry).
male(todd).

female(anne).
female(lilly).
female(kate).
female(alice).
female(jenny).

parent(pete, mark).
parent(pete, tom).
parent(pete, anne).
parent(mark, lilly).
parent(mark, john).
parent(mark, frank).
parent(tom, kate).
parent(anne, alice).
 
parent(anne, matt).
parent(alice, henry).
parent(matt, jenny).
parent(matt, todd).




/*Rules*/


/*X is a father of Y if X is a parent of Y and X is male*/

father(X, Y) :- parent(X,Y), male(X).



/*X is a mother of Y if X is a parent of Y and X is female*/

mother(X, Y) :- parent(X,Y), female(X).



/*X is a sibling of Y if Z is a parent of X and a prent of Y*/

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X\=Y.



/*X is a sister of Y if Z is a parent of X and a parent of Y, and 
X if a female*/

sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X=not(Y).



/*X is a sister of Y if Z is a parent of X and a parent of Y, and 
X if a female*/

brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X\=Y.



/*X is a grandparent of Y if X is a parent of Z and Z is a parent of Y*/

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).