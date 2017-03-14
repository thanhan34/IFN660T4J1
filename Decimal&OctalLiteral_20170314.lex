%

DecimalNumeral      	[0]|[1-9][0-9_]
OctalNumeral  		[0][0-7_]
IntegerTypeSuffix   	[lL]

%%


/*Wai Wing Chan - Deciaml & Octal Integer Literal*/

{DecimalNumeral}{IntegerTypeSuffix}?    {yylval.name=yytext; return (int)Tokens.DecimalIntegerLiteral;}
{OctalNumeral}{IntegerTypeSuffix}?    {yylval.name=yytext; return (int)Tokens.OctalIntegerLiteral;}			

%%