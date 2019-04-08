import java.util.Scanner;



public class LexicalAnalyzer {

	
	public static void main(String[] args)  {
		Scanner input = new Scanner(System.in);
		
		String expression;
		
		
		System.out.println("Add an expression: ");
		expression = input.nextLine();
		
		Token token = new Token(expression);
		
		
		while(Token.nextToken != token.EOF) {
		
			token.lex();
			if(Token.nextToken == 0)
			{
				System.out.println("Main function exited with Error Code");
				return;
			}
		}
		
		 

		
		
	
		
		
		
		
		
		
		input.close();
		
		}

	
}
