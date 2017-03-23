%namespace GPLexTutorial

digit [0-9]
letter [a-zA-Z]
SingleCharacter [\u0000-\uffff]|\\(u)[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]
EscapeSequence  [\u0000-\u00ff]
BooleanLiteral false|true

%%

if                           { return (int)Tokens.IF; }
else                         { return (int)Tokens.ELSE; }
int                          { return (int)Tokens.INT; }
bool                         { return (int)Tokens.BOOL; }
{BooleanLiteral}               { yylval.name = yytext; return (int)Tokens.BooleanLiteral; }
                       

\'{SingleCharacter}\'   { yylval.name = yytext; return (int)Tokens.CharacterLiteral; }

\'{EscapeSequence}\'    { yylval.name = yytext; return (int)Tokens.CharacterLiteral; }

^\'\\{SingleCharacter}       { yylval.name = yytext; return (int)Tokens.SingleCharacter; }


{letter}({letter}|{digit})* { yylval.name = yytext; return (int)Tokens.IDENT; }

{digit}+	    { yylval.num = int.Parse(yytext); return (int)Tokens.NUMBER; }

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
