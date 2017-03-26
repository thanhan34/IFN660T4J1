%namespace GPLexTutorial
%{
int lines = 0;
%}

letter [a-zA-Z]
digit [0-9]
/* Wendy week3 */
DecimalNumeral      	[0]|[1-9][0-9_]
IntegerTypeSuffix   [lL]
/* Wendy week3 */

/* thanhan */
InputCharacter (\\.|[^\\"])
EscapeSequence1  [\u0000-\u00ff]
StringLiteral \"{InputCharacter}*|{EscapeSequence1}*\"
/* thanhan */

/* Jessica week3 */
HexNumeral1  [0][xX]([0-9_]|[a-fA-F_])*
/* Jessica week3 */

/* yunsong Bai week3 */
SingleCharacter [\u0000-\uffff]|\\(u)[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]
EscapeSequence  [\u0000-\u00ff]
BooleanLiteral false|true
/* yunsong Bai week3 */

/* Stacy week3 */
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
/* Stacy week3 */

%%

/* Charles week3 */
abstract                     { yylval.keyword = yytext; return (int)Tokens.ABSTRACT; }
assert                       { yylval.keyword = yytext; return (int)Tokens.ASSERT; }
boolean                      { yylval.keyword = yytext; return (int)Tokens.BOOLEAN; }


break                        { yylval.keyword = yytext; return (int)Tokens.BREAK; }
byte                         { yylval.keyword = yytext; return (int)Tokens.BYTE; }
case                         { yylval.keyword = yytext; return (int)Tokens.CASE; }
catch                        { yylval.keyword = yytext; return (int)Tokens.CATCH; }
char                         { yylval.keyword = yytext; return (int)Tokens.CHAR; }
class                        { yylval.keyword = yytext; return (int)Tokens.CLASS; }
const                        { yylval.keyword = yytext; return (int)Tokens.CONST; }

continue                     { yylval.keyword = yytext; return (int)Tokens.CONTINUE; }
default                      { yylval.keyword = yytext; return (int)Tokens.DEFAULT; }
do                           { yylval.keyword = yytext; return (int)Tokens.DO; }
double                       { yylval.keyword = yytext; return (int)Tokens.DOUBLE; }
else                         { yylval.keyword = yytext; return (int)Tokens.ELSE; }
enum                         { yylval.keyword = yytext; return (int)Tokens.ENUM; }
extends                      { yylval.keyword = yytext; return (int)Tokens.EXTENDS; }
final                        { yylval.keyword = yytext; return (int)Tokens.FINAL; }
finally                      { yylval.keyword = yytext; return (int)Tokens.FINALLY; }
float                        { yylval.keyword = yytext; return (int)Tokens.FLOAT; }

for                          { yylval.keyword = yytext; return (int)Tokens.FOR; }
if                           { yylval.keyword = yytext; return (int)Tokens.IF; }
goto                         { yylval.keyword = yytext; return (int)Tokens.GOTO; }
implements                   { yylval.keyword = yytext; return (int)Tokens.IMPLEMENTS; }
import                       { yylval.keyword = yytext; return (int)Tokens.IMPORT; }
instanceof                   { yylval.keyword = yytext; return (int)Tokens.INSTANCEOF; }
int                          { yylval.keyword = yytext; return (int)Tokens.INT; }
interface                    { yylval.keyword = yytext; return (int)Tokens.INTERFACE; }
long                         { yylval.keyword = yytext; return (int)Tokens.LONG; }
native                       { yylval.keyword = yytext; return (int)Tokens.NATIVE; }

new                          { yylval.keyword = yytext; return (int)Tokens.NEW; }
package                      { yylval.keyword = yytext; return (int)Tokens.PACKAGE; }
private                      { yylval.keyword = yytext; return (int)Tokens.PRIVATE; }
protected                    { yylval.keyword = yytext; return (int)Tokens.PROTECTED; }
public                       { yylval.keyword = yytext; return (int)Tokens.PUBLIC; }
return                       { yylval.keyword = yytext; return (int)Tokens.RETURN; }
short                        { yylval.keyword = yytext; return (int)Tokens.SHORT; }
static                       { yylval.keyword = yytext; return (int)Tokens.STATIC; }
strictfp                     { yylval.keyword = yytext; return (int)Tokens.STRICTFP; }
string                       { yylval.keyword = yytext; return (int)Tokens.STRING; }
super                        { yylval.keyword = yytext; return (int)Tokens.SUPER; }
switch                       { yylval.keyword = yytext; return (int)Tokens.SWITCH; }
synchronized                 { yylval.keyword = yytext; return (int)Tokens.SYNCHRONIZED; }
this                         { yylval.keyword = yytext; return (int)Tokens.THIS; }
throw                        { yylval.keyword = yytext; return (int)Tokens.THROW; }
throws                       { yylval.keyword = yytext; return (int)Tokens.THROWS; }
transient                    { yylval.keyword = yytext; return (int)Tokens.TRANSIENT; }
try                          { yylval.keyword = yytext; return (int)Tokens.TRY; }
void                         { yylval.keyword = yytext; return (int)Tokens.VOID; }
volatile                     { yylval.keyword = yytext; return (int)Tokens.VOLATILE; }
while                        { yylval.keyword = yytext; return (int)Tokens.WHILE; }
/* Charles week3 */


/* jeremy week3*/
{letter}({letter}|{digit})*  { yylval.name = yytext; return (int)Tokens.IDENT; }
/* jeremy week3*/

/* thanhan */
{StringLiteral}				 { yylval.name = yytext; return (int)Tokens.StringLiteral; }
/* thanhan */

/* Stacy week3 */
{DecimalFloatingPointLiteral}|{HexadecimalFloatingPointLiteral}  { yylval.name = yytext; return (int)Tokens.FloatingPointLiteral; }
/* Stacy week3 */

/* Wendy week3 */
{DecimalNumeral}{IntegerTypeSuffix}?    {yylval.name=yytext; return (int)Tokens.DecimalIntegerLiteral;}
/* Wendy week3 */

/* Jessica week3 */
{HexNumeral1}{IntegerTypeSuffix}? { yylval.name = yytext; return (int)Tokens.HexIntegerLiteral; }
/* Jessica week3 */

/* yunsong Bai week3 */
{BooleanLiteral}             { yylval.name = yytext; return (int)Tokens.BooleanLiteral; }                      
\'{SingleCharacter}\'        { yylval.name = yytext; return (int)Tokens.CharacterLiteral; }
\'{EscapeSequence}\'         { yylval.name = yytext; return (int)Tokens.CharacterLiteral; }
^\'\\{SingleCharacter}       { yylval.name = yytext; return (int)Tokens.SingleCharacter; }
/* yunsong Bai week3 */


/*frank week2*/
/*
"\b"                         { yylval.esfcasl = "BackSpace"; return (int)Tokens.ESFCASL; }
"\t"                         { yylval.esfcasl = "Horizontal tab"; return (int)Tokens.ESFCASL; }
"\n"                         { yylval.esfcasl = "Line feed"; return (int)Tokens.ESFCASL; }
"\f"                         { yylval.esfcasl = "Form feed"; return (int)Tokens.ESFCASL; }
"\r"                         { yylval.esfcasl = "Carriage return"; return (int)Tokens.ESFCASL; }
"\""                         { yylval.esfcasl = "Double Quote"; return (int)Tokens.ESFCASL; }
"\'"                         { return '\''; }
"\\"                         { return '\\'; }
*/
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

[\n]		{ lines++;    }
[ \t\r]      /* ignore other whitespace */


.                            { 
                                 throw new Exception(
                                     String.Format(
                                         "unexpected character '{0}'", yytext)); 
                             }




%%
public override void yyerror( string format, params object[] args )
{
    System.Console.Error.WriteLine("Error: line {0}, {1}", lines,
        String.Format(format, args));
}
