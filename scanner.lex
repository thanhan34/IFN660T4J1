%namespace GPLexTutorial



/* Siliang Bai week2 */
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



{DecimalFloatingPointLiteral}|{HexadecimalFloatingPointLiteral}  { yylval.name = yytext; return (int)Tokens.FloatingPointLiteral; }




%%





