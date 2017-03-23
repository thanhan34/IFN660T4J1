%namespace GPLexTutorial


digit [0-9]
letter [a-zA-Z]

Digits [0-9]
ExponentIndicator [eE]
Sign [+-]
SignedInteger {Sign}?{Digits}*
ExponentPart {ExponentIndicator}{SignedInteger}
FloatTypeSuffix [fFdD]
DecimalFloatingPointLiteral  {Digits}*\.{Digits}*{ExponentPart}?{FloatTypeSuffix}?|\.{Digits}*{ExponentPart}?{FloatTypeSuffix}?|{Digits}*{ExponentPart}{FloatTypeSuffix}?|{Digits}*{ExponentPart}?{FloatTypeSuffix}

HexDigits [0-9a-fA-F]
HexNumeral 0x{HexDigits}*|0X{HexDigits}*
HexSignificand  {HexNumeral}(\.)?|0x{HexDigits}?\.{HexDigits}*|0X{HexDigits}?\.{HexDigits}*
BinaryExponentIndicator [pP]
BinaryExponent  {BinaryExponentIndicator}SignedInteger
HexadecimalFloatingPointLiteral {HexSignificand}{BinaryExponent}{FloatTypeSuffix}?


%%

if                           { return (int)Tokens.IF; }
else                         { return (int)Tokens.ELSE; }
int                          { return (int)Tokens.INT; }
bool                         { return (int)Tokens.BOOL; }

{letter}({letter}|{digit})* { yylval.name = yytext; return (int)Tokens.IDENT; }

{digit}+	    { yylval.num = int.Parse(yytext); return (int)Tokens.NUMBER; }

{DecimalFloatingPointLiteral}|{HexadecimalFloatingPointLiteral}  { yylval.name = yytext; return (int)Tokens.FloatingPointLiteral; }

"="                          { return '='; }
"+"                          { return '+'; }
"<"                          { return '<'; }
"("                          { return '('; }
")"                          { return ')'; }
"{"                          { return '{'; }
"}"                          { return '}'; }
";"                          { return ';'; }


[ \n\t\r]      /* ignore other whitespace */




.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }


%%





