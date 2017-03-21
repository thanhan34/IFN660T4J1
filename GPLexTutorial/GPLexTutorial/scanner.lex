%namespace GPLexTutorial
%{
int lines = 0;
%}


digit [0-9]
letter [a-zA-Z]

%%

/* KEYWORDS created by Charles 03082017 */
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


/* COMMMENT created by Charles 03082017 */



"/*"                         { yylval.comment = yytext; return (int)Tokens.COMMENT; }
"*/"                         { yylval.comment = yytext; return (int)Tokens.COMMENT; }
"//"                         { yylval.comment = yytext; return (int)Tokens.COMMENT; }



/* WHITESPACE created by Charles 03082017 

" "                          { yylval.whiteSpace = "space"; return (int)Tokens.WHITESPACE; }
"\t"                         { yylval.whiteSpace = "horizontal tab"; return (int)Tokens.WHITESPACE; }
"\f"                         { yylval.whiteSpace = "form feed"; return (int)Tokens.WHITESPACE; }

 created by Charles 03082017 */

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

