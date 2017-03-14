%namespace T4J1

digit [0-9_]
letter [a-zA-Z]
zeroDigit [0]
DecDigit [1-9][0-9_]
Slash [\\]
CharU [u]
quote [']
HexNum   [0]
HexMark [X|x]
HexLetters [a-fA-F_]

%%
/*An Doan Than-Strings Literals*/
\"(\.|[^\\"])*\"            { yylval.name = yytext; return (int)Tokens.STRING; }

/*Guang Yang-Keywords*/
abstract                     { yylval.keyword = yytext; return (int)Tokens.ABSTRACT; }

/*Qianli Li-Separator*/
"("           { yylval.separators = yytext; return (int)Tokens.SEPARATOR; }

/*Siliang Bai-Floating-Point Literals*/
[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?   { yylval.name = yytext; return (int)Tokens.FLOATPOINT; }

/*Waiwing Chan-Decimal Literals*/
{zeroDigit}|{DecDigit}* {yylval.name=yytext; return (int)Tokens.DECIMAL;}

/*Yunsong Bai-Character Literals*/
{quote}{Slash}{CharU}({digit}|{HexLetters})({digit}|{HexLetters})({digit}|{HexLetters})({digit}|{HexLetters}){quote} { yylval.name = yytext; return (int)Tokens.CHARACTERLITERAL; }

/*Zhiyi Wu-Hexadecimal Literals*/
{HexNum}{HexMark}({HexLetters}|{digit})* { yylval.name = yytext; return (int)Tokens.HEXADECIMAL; }

/*Ziyi Liu-Identifiers*/
({letter}|[_])({letter}|{digit}|[_])*   {yylval.name=yytext; return (int)Token.IDENTIFIER;}

[ \r\n\t]                    /* skip whitespace */

.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }

%%