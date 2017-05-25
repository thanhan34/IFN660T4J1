﻿%namespace GPLexTutorial

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
%token <num>  NUMBER

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
// Charles Yang week4
MethodHeader 
           : Result MethodDeclartor
           ;
Result
           : void
		   | UnannType
	       ;
MethodDeclartor 
           : Identifier '(' FormalParentList ')' Dims
		   ;
Identifier
           : IdentifierChars
		   ;
IdentifierChars
           : JavaLetter JavaLetterOrDigits
		   ;
Javaletter
           : main
		   ;
FormalParentList
           : ReceiverParameter
		   | FormalParameters 
		   | LastForamlParameter                    // not in deviration tree 
		   ;

FormalParameters
           : FormalParameter //'{' FormalParameter '}'  fix here
		   | ReceiverParameter //'{', FormalParameter '}'  fix here
		   ;
FormalParameter
           : VariableModifier_opt UnannType VariableDeclaratorId
		   ;
VariableModifier
           : final
		   ;
LastFormalParameter
           : VarialbeModifier_opt UnannType VariableDeclaratrId 
		   | FormalParameter // not int tree
		   ; 

ReceiverParameter
           : Annotaion_opt UnannType Identifier_opt this //[Identifier.]
		   ;
UnannType 
           : UnannReferenceType
		   | UnannPrimitiveType                    // not in tree
		   ;
UnannPrimitiveType                                 // not in tree
           : numericType
		   | boolean
		   ;
Unannreferencetype
           : UnannArryType
		   | UnannClassOrInterfaceType
		   | UnannTypeVariable
		   ;


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
