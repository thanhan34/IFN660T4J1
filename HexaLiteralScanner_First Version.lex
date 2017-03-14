/*Hexa Literal By Zhiyi(Jessica) Wu*/
%namespace HexadecimalLiterals

digit [0-9_]
HexNum   [0]
HexL [X|x]
HexLetters [a-fA-F_]
Long     [L]
%%

{HexNum}{HexL}({HexLetters}|{digit})* { yylval.name = yytext; return (int)Tokens.Hexadecimal; }
{HexNum}{HexL}({HexLetters}|{digit}|{Long})* { yylval.name = yytext; return (int)Tokens.Hexadecimal; }

[ \r\n\t]                    /* skip whitespace */

.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }

%%
