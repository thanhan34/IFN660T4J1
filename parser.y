%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
}

%token <num> NUMBER
%token <name> IDENT
%token IF ELSE INT BOOL
%token CharacterLiteral
%token SingleCharacter
%token BooleanLiteral 


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
           ;


%%

public Parser(Scanner scanner) : base(scanner)
{
}
