using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AST
{

    // week 8 Bai start
    public abstract class Statements : Node { }

    public class Statement : Statements
    {
        private Assignment ass;
        /*public override void ResolvedName()
        {
            ass.ResolvedName();
        }*/
       
        public Statement(Assignment ass)
        {
            this.ass = ass;
        }
        public override void dump(int indent)
        {
            //label(indent, "Statement\n");
            label(indent, "Statement:\n");
            ass.dump(indent+1);
        }
    }

    public class Block : Statements
    {
        private LocalVariableDeclaration localVariableDeclaration;
        private Statement stat;
        /* public override void ResolvedName()
         {
             localVariableDeclaration.ResolvedName();
             stat.ResolvedName();
         }*/
        public Block(LocalVariableDeclaration localVariableDeclaration)
        {
            this.localVariableDeclaration = localVariableDeclaration;

        }
        public Block(Statement stat)
        {

            this.stat = stat;
        }
        public override void dump(int indent)
        {
            label(indent, "Block:\n");
            if (localVariableDeclaration != null)
            {
                localVariableDeclaration.dump(indent + 1);
            }
            else if (stat != null)
            {
                stat.dump(indent + 1);
            }
        }
    }

    public class LocalVariableDeclarationstatement : Statements
    {
        private NamedType type; //int
        private string identifier; //x
        /*public override void ResolvedName()
        {
            type.ResolvedName();
        }*/
        public LocalVariableDeclarationstatement(NamedType type, string identifier)
        {
            this.type = type;
            this.identifier = identifier;
        }
        public override void dump(int indent)
        {
            label(indent, "BlockStatement:\n");
            type.dump(indent + 1);
        }
    }

    /*
    public class ExpressionStatement : Statements
    {
        /*public override void ResolvedName()
        {

        }
        public ExpressionStatement()
        {

        }
        public override void dump(int indent)
        {
            label(indent, "ExpressionStatement:\n");
        }
    }*/


    /* wendy
    public class Assignment : Statements
    {
        private LeftHandSide leftHandSide;
        private Expression expression;
        public override bool ResolvedName(Scope scope)
        {
            return leftHandSide.ResolvedName(scope) && expression.ResolvedName(scope);
        }
        public Assignment(LeftHandSide leftHandSide,  Expression expression)
        {
            this.leftHandSide = leftHandSide;
            this.expression = expression;
        }
        public override void dump(int indent)
        {
            label(indent, "Assignment:\n");
            leftHandSide.dump(indent + 1);
            expression.dump(indent + 1);
            
        }
        public override void TypeCheck()
        {
            
        }
    }

    
    public class LeftHandSide : Statements
    {
        private string ident;
        public override bool ResolvedName(Scope scope)
        {
            return true;
        }
        public LeftHandSide(string ident)
        {
            this.ident = ident;
        }
        public override void dump(int indent)
        {
            label(indent, "LeftHandSide : {0}\n", ident);
            
        }
        public override void TypeCheck()
        {
           
        }
    }
    wendy */

    //wendy & frank 
public class MethodBody : Statements
    {
        private List<Statements>  statements;

        public override void ResolvedName(Scope scope)
        {
            foreach (var stmt in statements)
                if (stmt is IDeclaration)
                {
                    IDeclaration decl = (IDeclaration)stmt;

                    scope.AddSymbol(decl.get_name(), decl); 
                }

            foreach (var stmt in statements)
                stmt.ResolvedName(scope);
        }  

        public MethodBody(List<Statements> statements)
        {         
            this.statements = statements;          
        }
        public override void dump(int indent)
        {
            label(indent,"Block");
            foreach (var a in statements)
            {
                a.dump(indent);
            }

        }
        public override void TypeCheck()
        {
            foreach (var a in statements)
            {
                a.TypeCheck(); 
            }
        }
        public override void gecode(StreamWriter st)
        {
            foreach (var a in statements)
            {
                a.gecode(st);
            }
            
        }
    }
    //wendy & frank
 
    

    
    /*
    public class AssignmentExpression : ExpressionStatement
    {
        private VariableInitializer variableinitializer;
        public AssignmentExpression(VariableInitializer variableinitializer)
        {
            this.variableinitializer = variableinitializer;
        }
        public override void dump(int indent)
        {
            label(indent, "AssignmentStatement\n");
            variableinitializer.dump(indent + 1);
        }
    }*/

    public class MethodHeader : Statements
    {
        private MethodDeclarator methodDecalrator;
        private Result result;
        /*public override void ResolvedName()
        {
            methodDecalrator.ResolvedName();
            result.ResolvedName();
        }*/
        public MethodHeader(Result result, MethodDeclarator methodDecalrator)
        {
            this.methodDecalrator = methodDecalrator;
            this.result = result;
        }
        public override void dump(int indent)
        {
            label(indent, "MethodHeader:\n");
            methodDecalrator.dump(indent+1);
            result.dump(indent+1);
        }
    }


    public class Dims : Statements
    {
        private char left;
        private char right;
       /* public override void ResolvedName()
        {

        }*/
        public Dims()
        { }
        public Dims(char left, char right)
        {
            this.left = left;
            this.right = right;
        }

        public override void dump(int indent)
        {
            label(indent, "Dims:\n");
        }
    }
   
  
}
