%namespace GPLexTutorial


SingleCharacter [\u0000-\uffff]|\\(u)[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]
EscapeSequence  [\u0000-\u00ff]
BooleanLiteral false|true

%%


{BooleanLiteral}               { yylval.name = yytext; return (int)Tokens.BooleanLiteral; }
                       

\'{SingleCharacter}\'   { yylval.name = yytext; return (int)Tokens.CharacterLiteral; }

\'{EscapeSequence}\'    { yylval.name = yytext; return (int)Tokens.CharacterLiteral; }

^\'\\{SingleCharacter}       { yylval.name = yytext; return (int)Tokens.SingleCharacter; }


