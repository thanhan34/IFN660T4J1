/* Jessica Wu week3 */
HexNumeral  [0][xX]([0-9_]|[a-fA-F_])*
IntegerTypeSuffix  [lL]
/* Jessica Wu week3 */


/* Jessica Wu week3 */
{HexNumeral}{IntegerTypeSuffix}? { yylval.name = yytext; return (int)Tokens.HexIntegerLiteral; }
/* Jessica Wu week3 */
/*frank week2*/

"\b"                         { yylval.esfcasl = "BackSpace"; return (int)Tokens.ESFCASL; }
"\t"                         { yylval.esfcasl = "Horizontal tab"; return (int)Tokens.ESFCASL; }
"\n"                         { yylval.esfcasl = "Line feed"; return (int)Tokens.ESFCASL; }
"\f"                         { yylval.esfcasl = "Form feed"; return (int)Tokens.ESFCASL; }
"\r"                         { yylval.esfcasl = "Carriage return"; return (int)Tokens.ESFCASL; }
"\""                         { yylval.esfcasl = "Double Quote"; return (int)Tokens.ESFCASL; }
"\'"                         { return '\''; }
"\\"                         { return '\\'; }

""							 { yylval.nil = "nill"; return (int)Tokens.NIL; }
/*separator*/
"("                          { return '('; }
")"                          { return ')'; }
"{"                          { return '{'; }
"}"                          { return '}'; }
"["							 { return '['; }
"]"                          { return ']'; }
";"                          { return ';'; }
","                          { return ','; }
"."                          { return '.'; }
"@"                          { return '@'; }
"..."						 { yylval.separators = yytext; return (int)Tokens.SEPARATOR; }
"::"						 { yylval.separators = yytext; return (int)Tokens.SEPARATOR; }

/*operator*/
"="                          { return '='; }
">"                          { return '>'; }
"<"                          { return '<'; }
"!"                          { return '!'; }
"~"                          { return '~'; }
"?"                          { return '?'; }
":"                          { return ':'; }
"->"                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"=="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
">="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"<="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"!="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"&&"                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"||"                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"++"                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"--"                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"+"                          { return '+'; }
"-"                          { return '-';}
"*"                          { return '*'; }
"/"                          { return '/'; }
"&"                          { return '&'; }
"|"                          { return '|'; }
"^"                          { return '^'; }
"%"                          { return '%'; }
"<<"                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
">>"                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
">>>"                        { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"+="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"-="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"*="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"/="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"&="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"|="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"^="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"%="                         { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
"<<="                        { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
">>="                        { yylval.operators = yytext; return (int)Tokens.OPERATOR; }
">>>="                       { yylval.operators = yytext; return (int)Tokens.OPERATOR; }

/*frank week2*/


