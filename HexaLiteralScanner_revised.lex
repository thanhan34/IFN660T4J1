/*Hexa Literal By Zhiyi(Jessica) Wu-Week3*/
%namespace HexadecimalLiterals

HexNumeral  [0][xX]([0-9_]|[a-fA-F_])*
IntegerTypeSuffix  [lL]
%%

{HexNumeral}{IntegerTypeSuffix}? { yylval.name = yytext; return (int)Tokens.HexIntegerLiteral; }

[ \r\n\t]                    /* skip whitespace */

.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }

%%
