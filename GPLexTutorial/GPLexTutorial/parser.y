%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
	public string keyword;
	public string comment;
	public string whiteSpace;
}

%token <num> NUMBER
%token <name> IDENT

/* Charles Yang*/
%token <keyword>  ABSTRACT ASSERT BOOLEAN BREAK BYTE CASE CATCH CHAR CLASS CONST CONTINUE DEFAULT DO DOUBLE
%token <keyword>  ENUM ELSE EXTENDS FINAL FINALLY FLOAT FOR  GOTO  IF INT IMPLEMENTS IMPORT INSTANCEOF  INTERFACE LONG
%token <keyword>  NATIVE NEW PACKAGE PRIVATE PROTECTED PUBLIC RETURN SHORT STATIC STRICTFP SUPER SWITCH SYNCHRONIZED
%token <keyword> THIS THROW THROWS TRANSIENT TRY VOID VOLATILE WHILE
%token <comment>  COMMENT
%token <whiteSpace>  WHITESPACE



%%

Program : Statement
        ;

Statement : IF '(' Expression ')' Statement ELSE Statement
          | '{' StatementList '}'
          | Expression ';'
          | Type IDENT ';'
          ;

Type : INT
     | BOOL
     ;

StatementList : StatementList Statement
              | /* empty */
              ;
			
Expression : NUMBER
           | IDENT
           | Expression '=' Expression
           | Expression '+' Expression
           | Expression '<' Expression
		   | ABSTRACT
           ;


%%

public Parser(Scanner scanner) : base(scanner)
{
}
