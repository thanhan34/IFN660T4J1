%namespace T4J1

InputCharacter 					  (\\.|[^\\"])
EscapeSequence 					  [\\b\\t\\n\\f\\r\\"\\'\\]
StringLiteral 					  \"{InputCharacter}*|{EscapeSequence}\"
JavaLetter                                        [$_a-zA-Z]
JavaLetterOrDigit                                 [a-zA-Z0-9$_]
IdentifierChars                                   {JavaLetter}({JavaLetterOrDigit})*
DecimalNumeral     				  [0]|[1-9][0-9_]
OctalNumeral       				  [0][0-7_]
HexNumeral         				  [0][xX]([0-9_]|[a-fA-F_])*
BinaryDigit                                       [01]
BinnaryDigitOrUnderscore                          {BinaryDigit}|_
BinaryDigitsAndUnderscores                        {BinaryDigitOrUnderscore}({BinaryDigitorUnderscore})* 
BinaryDigits                                      {BinaryDigit}|{BinaryDigit}({BinaryDigitsAndUnderscores})?{BinaryDight}
BinaryNumeral                                     0b{BinaryDigits}|0B{BinaryDigits}
IntegerTypeSuffix  				  [lL]
SingleCharacter 				  [\u0000-\uffff]|\\(u)[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]
EscapeSequence  				  [\u0000-\u00ff]
BooleanLiteral 					  false|true
Digits 						  [0-9]
ExponentIndicator 				  [eE]
Sign 						  [+-]
SignedInteger 					  {Sign}?{Digits}*
ExponentPart 					  {ExponentIndicator}{SignedInteger}
FloatTypeSuffix 				  [fFdD]
DecimalFloatingPointLiteral  			  {Digits}*\.{Digits}*{ExponentPart}?{FloatTypeSuffix}?|\.{Digits}*{ExponentPart}?{FloatTypeSuffix}?|{Digits}*{ExponentPart}{FloatTypeSuffix}?|{Digits}*{ExponentPart}?{FloatTypeSuffix}
HexDigits 					  [0-9a-fA-F]
HexNumeral 					  0x{HexDigits}*|0X{HexDigits}*
HexSignificand  				  {HexNumeral}(\.)?|0x{HexDigits}?\.{HexDigits}*|0X{HexDigits}?\.{HexDigits}*
BinaryExponentIndicator 			  [pP]
BinaryExponent  				  {BinaryExponentIndicator}SignedInteger
HexadecimalFloatingPointLiteral 		  {HexSignificand}{BinaryExponent}{FloatTypeSuffix}?

%%
/*An Doan Than-Strings Literals*/
{StringLiteral}	     { yylval.name = yytext; return (int)Tokens.StringLiteral; }

/*Guang Yang-Keywords*/
abstract                     { return (int)Tokens.abstract; }

/*Qianli Li-Separator*/
"("           { return (int)Tokens.'('; }

/*Siliang Bai-Floating-Point Literals*/
{DecimalFloatingPointLiteral}|{HexadecimalFloatingPointLiteral}  { yylval.name = yytext; return (int)Tokens.FloatingPointLiteral; }

/*Waiwing Chan-Decimal Literals*/
{DecimalNumeral}{IntegerTypeSuffix}?    {yylval.name=yytext; return (int)Tokens.DecimalIntegerLiteral;}
{OctalNumeral}{IntegerTypeSuffix}?    {yylval.name=yytext; return (int)Tokens.OctalIntegerLiteral;}

/*Yunsong Bai-Character Literals*/
{BooleanLiteral}               { yylval.name = yytext; return (int)Tokens.BooleanLiteral; }
\'{SingleCharacter}\'   { yylval.name = yytext; return (int)Tokens.CharacterLiteral; }
\'{EscapeSequence}\'    { yylval.name = yytext; return (int)Tokens.CharacterLiteral; }
^\'\\{SingleCharacter}       { yylval.name = yytext; return (int)Tokens.SingleCharacter; }


/*Zhiyi Wu-Hexadecimal Literals*/
{HexNumeral}{IntegerTypeSuffix}? { yylval.name = yytext; return (int)Tokens.HexIntegerLiteral; }


/*Ziyi Liu-Identifiers*/
IdentifierChars                                   {yylval.name=yytext; return (int)Token.Identifier;}
{BinaryNumberal}({IntegerTypeSuffix})?            {yylval.name=yytext; return (int)Token.BinaryIntegerLiteral}

[ \r\n\t]                    /* skip whitespace */

.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }

%%