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
%token <keyword>  NATIVE NEW PACKAGE PRIVATE PROTECTED PUBLIC RETURN SHORT STATIC STRICTFP SUPER SWITCH SYNCHRONIZED STRING
%token <keyword> THIS THROW THROWS TRANSIENT TRY VOID VOLATILE WHILE
%token <comment>  COMMENT
//Charles week3

%left '='
%nonassoc '<'
%left '+'

%%
CompilationUnit 
	: PackageDeclaration_opt ImportDeclarations TypeDeclarations
	;

PackageDeclaration_opt 
	: PackageModifiers package Identifier {. Identifier} ; // fix this later
	;

ImportDeclarations 
	: ImportDeclaration ImportDeclarations 
	| /* empty */
	;
ImportDeclaration
	: SingleTypeImportDeclaration
	| TypeImportOnDemandDeclaration 
	| SingleStaticImportDeclaration 
	| StaticImportOnDemandDeclaration
	;
	
TypeDeclarations 
	: TypeDeclaration TypeDeclarations 
	| /* empty */
	;

TypeDeclaration 
	: ClassDeclaration
	| InterfaceDeclaration
	;

ClassDeclaration
	: NormalClassDeclaration
	| EnumDeclaraiton
	;

NormalClassDeclaration
	: ClassModifiers class Identifier TypeParameters_opt Superclass_opt Superinterfaces_opt ClassBody
	;

ClassModifiers 
	: public
	| protected
	| private
	| abstract
	| static
	| final
	| strictfp
	;



Program : ComplitionUnit
		;

ComplitionUnit : PackageDeclaration_Opt ImportDeclaration TypeDeclaration
			   ;

PackageDeclaration_Opt :;

ImportDeclaration :;

TypeDeclaration : ClassDeclaration
			    ;

ClassDeclaration : NormalClassDeclaration
				 ;

NormalClassDeclaration : ClassModifier CLASS Identifier TypreParameters_Opt Super_Opt SuperInterfaces_Opt ClassBody
					   ;

ClassModifier : PUBLIC 
			  ;

TypreParameters_Opt :;

Super_Opt :;

SuperInterfaces_Opt :;


ClassBody : '{' ClassBodyDeclarations '}'		  
		  ;

ClassBodyDeclarations : ClassBodyDeclaration
					  ;

ClassBodyDeclaration : ClassMemberDeclaration
					 ;

ClassMemberDeclaration : MethodDeclaration
					   ;

MethodDeclaration : MethodModifier MethodHeader '{' MethodBody '}'
				  ;

MethodModifier : MethodModifier
			   | MethodModifier MethodModifier 	
			   | PUBLIC | STATIC
				;

MethodHeader : Result MethodDeclarator
			 ;

Result : VOID | INT 
	   | 
	   ;

MethodDeclarator : Identifier '(' FormalParameterList ')' Dims
				 ;

FormalParameterList : LastFormalParameterList
				    ;

LastFormalParameterList : VariableModifier UnannType Annotation VariableDeclaratorId 
						;

Annotation:;

Dims : '(' ')'
	 | '[' ']'
	 | '{' '}'
	 |
	 ;
				 
MethodBody :  Block 
		   ;

Block: Blockstatements
	 ;

Blockstatements : Blockstatement
				;

Blockstatement : LocalVariableDeclarationStatement Statement
			   ;
 
LocalVariableDeclarationStatement : LocalVariableDeclaration ';'
								  ;       
							  
LocalVariableDeclaration : VariableModifier UnannType VariableDeclarationList
						 ;

VariableModifier : /* empty */
				 ;

UnannType : UnannPrimitiveType
		  | UnannReferenceType
		  ; 

UnannPrimitiveType : NumericType
             | BOOLEAN
             ;

UnannReferenceType : UnannArrayType
				   ;

UnannArrayType : UnClassOrInterfaceType Dims UnannTypeVariable Dims
			   ;

UnClassOrInterfaceType : UnClassType
					   ;

UnClassType : STRING
			;

UnannTypeVariable : Identifier
				  ;

NumericType : IntegralType
             | FloatingPointType
             ;

IntegralType
            : BYTE
            | SHORT
            | INT
            | LONG
            | CHAR
            ;

FloatingPointType
            : FLOAT
			| DOUBLE
            ;

VariableDeclarationList : VariableDeclarator
						;

VariableDeclarator : VariableDeclaratorId 
				   ;

VariableDeclaratorId : Identifier | Dim_opt
					 ;

Identifier : IdentifierChars
		   ;

IdentifierChars : JavaLetter 
			    | JavaLetterOrDigits 
			    ;

JavaLetter : IDENT
		   ;

JavaLetterOrDigits : ;

Dim_opt : 
		;


//jeremy week4
Statement : StatementWithoutTrailingSubstatement
          ;

StatementWithoutTrailingSubstatement : ExpressionStatement
                                     ;

ExpressionStatement : StatementExpression ';'
                    ;

StatementExpression : Assignment
                    ;

Assignment : LeftHandSide AssignmentOperator Expression
           | /*empty*/
           ;

LeftHandSide : ExpressionName            
             ;

ExpressionName : IDENT
               ;

AssignmentOperator : '='
                   ;

Expression : AssignmentExpression
           ;

AssignmentExpression : ConditionalExpression
                     ;

ConditionalExpression : ConditionalOrExpression
                      ;

ConditionalOrExpression : ConditionalAndExpression
                        ;

ConditionalAndExpression : InclusiveOrExpression
                         ;

InclusiveOrExpression : ExclusiveOrExpression
                      ;

ExclusiveOrExpression : AndExpression
                      ;

AndExpression : EqualityExpression
              ;

EqualityExpression : RelationalExpression
                   ;

RelationalExpression : ShiftExpression
                     ;

ShiftExpression : AddictiveExpression
                ;

AddictiveExpression : MultiplicativeExpression
                    ;

MultiplicativeExpression : UnaryExpression
                         ;

UnaryExpression : UnaryExpressionNotPlusMinus
                ;

UnaryExpressionNotPlusMinus : PostfixExpression
                            ;

PostfixExpression : Primary
                  ;

Primary : PrimaryNoNewArray
        ;

PrimaryNoNewArray : Literal
                  ;

Literal : DecimalIntegerLiteral | HexIntegerLiteral
        ;

//jeremy week4


%%

public Parser(Scanner scanner) : base(scanner)
{
}
