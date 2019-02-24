/************************************
 * Amarilda Celhaka					*
 * CS 4250							*
 * Problem #3						*
 * Using logical language Prolog	*
 * Finding the union of two lists	*
 * no repetitive elements included	*
 * **********************************/

/*Check if the Element is part of the List, return true if it is*/
/*mem function from in class examples							*/
mem(Element, [Element | _]).
mem(Element, [_ | List]) :- mem(Element, List). 


/*If first List is empty, let List = List2*/
union([], List, List).

/*Checking If one Element from List1 is on List2  */
union([Element|List1], List2, List3) :- mem(Element, List2), union(List1, List2, List3).

/*Return the concatenated List with elements not repeting */
union([Element|List1], List2, [Element|List3]) :- union(List1, List2, List3).



/*Run the query to check for the result*/
/*?-union([1,2,3],[2,4,5], List).      */