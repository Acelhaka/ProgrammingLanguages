
public class Token {

	/* Character classes, defined as constants */

	public final int LETTER = 0;
	final int DIGIT = 1;
	final int UNKNOWN = 99;
	final int SPACE = 3;
	public final int EOF = -1;

	/* Token codes **/

	final int INT_LIT = 10;
	final int IDENT = 11;
	final int ASSIGN_OP = 20;
	final int ADD_OP = 21;
	final int SUB_OP = 22;
	final int MULT_OP = 23;
	final int DIV_OP = 24;
	final int LEFT_PAREN = 25;
	final int RIGHT_PAREN = 26;
	final int OTHER = -2;

	/* Global declarations */

	static int charClass;
	static char lex[] = new char[1000];
	static char nextChar;
	static int lexLen = 0;
	static int token;
	static int nextToken;
	public String expression;
	String lexeme = "";
	int j = 0;

	public Token(String expression) {
		this.expression = expression;
		
		for (int i = 0; i < expression.length(); i++) {
			lex[i] = expression.charAt(i);
		}
		
		lex[expression.length() + 1] = '\0';
		
	}

	void getChar() {

		nextChar = lex[j++];
		getNonBlank();
		
		//System.out.println("next Char " + nextChar);

		if (nextChar == '\0') {
			charClass = EOF;
			//System.out.println("EOF");	
		} 
		
		else if (Character.isDigit(nextChar)) {
			charClass = DIGIT;
			//System.out.println("DIGIT");
		}

		else if (Character.isLetter(nextChar)) {
			charClass = LETTER;
			//System.out.println("LETTER");
		}

		else {
			charClass = UNKNOWN;
			//System.out.println("UNKNOWN");
		}

	}

	
	/*function to skip whitespaces*/
	public void getNonBlank() {

		while (Character.isWhitespace(nextChar)) {
			nextChar = lex[j++];
		}
	}

	
	
	
	void addChar() {
		lexLen++;
		//System.out.println("lexLen = " + lexLen);
		
		if(lexLen > 98) {
			//System.out.println("ERROR - lexeme is too long");	
			lexLen = -1;
		}
	}
	
	public int lex() {
		
		lexLen = 0;
		lexeme = "";
		
		getChar();
		
		lexeme += nextChar;
		switch (charClass) {

		/* parse identifiers */
		case LETTER:
			
			while (charClass == LETTER ) {
				getChar();
				addChar();
				if ( charClass == LETTER ) {
					lexeme += nextChar;	
				}
				if(lexLen == -1)
				{
					return 0;
				}
			}
			
			j--;
			
			nextToken = IDENT;
			break;

		/* parse integer literals */

		case DIGIT:
			
			while (charClass == DIGIT) {
				getChar();
				addChar();
				if (charClass == DIGIT) {
					lexeme += nextChar;
				}
				if(lexLen == -1)
				{
					return 0;
				}
			}
			
			j--;
			
			nextToken = INT_LIT;
			break;

		case EOF:
			
			nextToken = EOF;
			lexeme = "";
			lexeme = "EOF";
			addChar();
			break;
			
	
		case UNKNOWN:
			lookup(nextChar);
			addChar();
			break;
		}

		System.out.println("Next token is: " + nextToken + " Next lexeme is " + lexeme);

		return nextToken;

	} /* End of switch case */

	
	int lookup(char ch) {
		
		switch (ch) {
		
		case '(':
			nextToken = LEFT_PAREN;
			break;

		case ')':
			nextToken = RIGHT_PAREN;
			break;

		case '+':
			nextToken = ADD_OP;
			break;

		case '-':
			nextToken = SUB_OP;
			break;

		case '*':
			nextToken = MULT_OP;
			break;

		case '/':
			nextToken = DIV_OP;
			break;
			
		case '=':
			nextToken = ASSIGN_OP;
			break;
		
		default:
			nextToken =  OTHER;
			break;
			
		}

		return nextToken;
	}

}
