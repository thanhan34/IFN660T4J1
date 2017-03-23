%namespace GPLexTutorial

%union
{
    public int num;
    public string name;
}

%token <num> NUMBER
%token <name> IDENT
%token IF ELSE INT BOOL

%left '='
%nonassoc '<'
%left '+'


%%
CompilationUnit 
	: PackageDeclaration_opt ImportDeclarations TypeDeclarations
	;

PackageDeclaration_opt 
	: PackageModifiers package Identifier {. Identifier} ; // fix this later
	;

ImportDeclarations 
	: ImportDeclaration ImportDeclarations 
	| /* empty */
	;
ImportDeclaration
	: SingleTypeImportDeclaration
	| TypeImportOnDemandDeclaration 
	| SingleStaticImportDeclaration 
	| StaticImportOnDemandDeclaration
	;
	
TypeDeclarations 
	: TypeDeclaration TypeDeclarations 
	| /* empty */
	;

TypeDeclaration 
	: ClassDeclaration
	| InterfaceDeclaration
	;

ClassDeclaration
	: NormalClassDeclaration
	| EnumDeclaraiton
	;

NormalClassDeclaration
	: ClassModifiers class Identifier TypeParameters_opt Superclass_opt Superinterfaces_opt ClassBody
	;

ClassModifiers 
	: public
	| protected
	| private
	| abstract
	| static
	| final
	| strictfp
	;


%%

public Parser(Scanner scanner) : base(scanner)
{
}

