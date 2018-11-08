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

Expression : AssignmentExpression
           ;

/*AssignmentExpression : Assignment
                     ;

ArrayAccess : PrimaryNoNewArray Expression_opt
            ;

PrimaryNoNewArray : Literal
                  ;

Literal : INTEGER
        ;
*/

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

Literal : INTEGER
        ;


%%

public Parser(Scanner scanner) : base(scanner)
{
}
