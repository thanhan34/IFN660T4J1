%namespace GPLexTutorial

digit [0-9]
letter [a-zA-Z]
InputCharacter (\\.|[^\\"])
EscapeSequence [\\b\\t\\n\\f\\r\\"\\'\\]
StringLiteral \"{InputCharacter}*|{EscapeSequence}*\"
ddhfjguthdgghnytrsrfhf

%%

if                           { return (int)Tokens.IF; }
else                         { return (int)Tokens.ELSE; }
int                          { return (int)Tokens.INT; }
bool                         { return (int)Tokens.BOOL; }

{StringLiteral}				 { yylval.name = yytext; return (int)Tokens.StringLiteral; }

{digit}+                     { yylval.num = int.Parse(yytext); return (int)Tokens.NUMBER; }

"="                          { return '='; }
"+"                          { return '+'; }
"<"                          { return '<'; }
"("                          { return '('; }
")"                          { return ')'; }
"{"                          { return '{'; }
"}"                          { return '}'; }
";"                          { return ';'; }

[ \r\n\t]                    /* skip whitespace */

.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }

%%
