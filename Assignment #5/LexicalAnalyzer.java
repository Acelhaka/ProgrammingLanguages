/****************************************
 * Amarilda Celhaka
 * CMP SCI 4250 
 * Dr. P
 * Assignment #5
 ***************************************/





import java.util.Scanner;



public class LexicalAnalyzer {

	
	public static void main(String[] args)  {
		Scanner input = new Scanner(System.in);
		
		String expression;
		
		System.out.println("************************Assignment #5****************************");
		System.out.println("*Converting the code implementing Lexical analyser from C to java\n");
		System.out.println("Write an expression: ");
		expression = input.nextLine();
		
		Token token = new Token(expression);
		
		
		while(Token.nextToken != token.EOF) {
		
			token.lex();
			
			/*if nextToken is set to 0, it indicates that the literal/ int literal was too long*/
			if(Token.lexLen == -1)
			{
				System.out.println("ERROR --Lexeme is too long.");
				return;
			}
		}
		
		 

	
	input.close();
		
	}

	
}
