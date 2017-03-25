/*Zhiyi Wu, week3*/


%%

ClassBody : '{' ClassBodyDeclarations '}'
	  ;

ClassBodyDeclarations : ClassBodyDeclaration
		      ;

ClassBodyDeclaration : ClassMemeberDeclaration
		     ;

ClassMemberDeclaration : MethodDeclaration
		       ;

MethodDecalration : MethodModifier MethodHeader Method Body
		  ;

MethodModifier : Public 
	       | static
	       ;

%%