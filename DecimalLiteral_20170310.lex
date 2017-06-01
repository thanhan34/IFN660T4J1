/*DecimalIntegerLiteral by Wai Wing Chan*/

%namespace DecimalLiteral

DecimalNumeral      [0][1-9][0-9_]
IntegerTypeSuffix   [lL]

%%

{DecimalNumeral}|{IntegerTypeSuffix}*    {yylval.name=yytext; return (int)Tokens.DecimalIntegerLiteral;}

%%
