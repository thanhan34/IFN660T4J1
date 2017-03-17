/*DecimalIntegerLiteral by Wai Wing Chan*/

%namespace DecimalLiteral

zeroDigit [0]
DecDigit [1-9][0-9_]
Long	[L]

%%

{zeroDigit}|{DecDigit}* 		{yylval.name=yytext; return (int)Tokens.DECIMAL;}			
{zeroDigit}|({DecDigit}|{Long})*	{yylval.name=yytext; return (int)Tokens.DECIMAL;}

%%