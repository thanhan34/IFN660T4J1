%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
	//frank week3
    public string nil;
    public string esfcasl;
    public string separators;
    public string operators;
    //frank week3

	//Charles week3
	public string keyword;
	public string comment;
	//Charles week3
}


%token <name> IDENT

//Jessica week3
%token HexIntegerLiteral
//Jessica week3

//thanhan
%token StringLiteral
//thanhan

//Wendy week3
%token DecimalIntegerLiteral
//Wendy week3

//frank week3  
%token <nil> NIL
//%token <esfcasl> ESFCASL 
%token <separators> SEPARATOR
%token <operators> OPERATOR
//frank week3

//bai week3
%token CharacterLiteral
%token SingleCharacter
%token BooleanLiteral 
//bai week3

//Stacy week3
%token FloatingPointLiteral
//Stacy week3

//Charles week3
%token <keyword>  ABSTRACT ASSERT BOOLEAN BREAK BYTE CASE CATCH CHAR CLASS CONST CONTINUE DEFAULT DO DOUBLE
%token <keyword>  ENUM ELSE EXTENDS FINAL FINALLY FLOAT FOR  GOTO  IF INT IMPLEMENTS IMPORT INSTANCEOF  INTERFACE LONG
%token <keyword>  NATIVE NEW PACKAGE PRIVATE PROTECTED PUBLIC RETURN SHORT STATIC STRICTFP SUPER SWITCH SYNCHRONIZED
%token <keyword> THIS THROW THROWS TRANSIENT TRY VOID VOLATILE WHILE
%token <comment>  COMMENT
//Charles week3

%left '='
%nonassoc '<'
%left '+'

%%

Program : Statement
        ;

Statement : IF '(' Expression ')' Statement ELSE Statement
          | '{' StatementList '}'
          | Expression ';'
          | Type IDENT ';'
          ;

Type : INT
     | BooleanLiteral
     ;

StatementList : StatementList Statement
              | /* empty */
              ;

Expression : 
           | IDENT
		   | HexIntegerLiteral
		   | DecimalIntegerLiteral
		   | FloatingPointLiteral
		   | StringLiteral
		   | CharacterLiteral
           | Expression '=' Expression
           | Expression '+' Expression
           | Expression '<' Expression
		   | Expression '>' Expression
		   | Expression OPERATOR Expression
           ;

%%

public Parser(Scanner scanner) : base(scanner)
{
}
