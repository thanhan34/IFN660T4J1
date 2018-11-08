/*Ziyi Liu, week3*/
%union
{
    public int num;
    public string name;
}

%token <num> INTEGER
%token <name> IDENT

%left '='


%%

Assignment : LeftHandSide AssignmentOperator Expression
           | /*empty*/
           ;

LeftHandSide : ExpressionName
             | ArrayAccess
             ;

AssignmentOperatpr : '='
                   ;

ExpressionName : IDENT
               ;

/* the follow part of Expression can be replaced by:
Expression : INTEGER
           ;
*/
___________________________________________________
Expression : AssignmentExpression
           ;

AssignmentExpression : Assignment
                     ;

ArrayAccess : PrimaryNoNewArray Expression_opt
            ;

PrimaryNoNewArray : Literal
                  ;

Literal : INTEGER
        ;

%%

public Parser(Scanner scanner) : base(scanner)
{
}
