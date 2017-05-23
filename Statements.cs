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
        public override void ResolvedName(Scope scope)
        {
            type.ResolvedName(scope);
        }
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
        public override void TypeCheck()
        {
            type.TypeCheck();
        }
    }

    /*
    public class ExpressionStatement : Statements
    {
        public override void ResolvedName()
        {

        }
        public ExpressionStatement()
        {

        }
        public override void dump(int indent)
        {
            label(indent, "ExpressionStatement:\n");
        }
    }
    */

    public class Assignment : Statements
    {
        private LeftHandSide leftHandSide;

        private Expression expression;
      
        public override void ResolvedName(Scope scope)
        {
            leftHandSide.ResolvedName(scope);
            if (expression != null)
            {
                expression.ResolvedName(scope);
            }
            
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
            leftHandSide.TypeCheck();
            if (expression != null)
            {
                expression.TypeCheck();
            }
        }
    }


    public class LeftHandSide : Statements
    {
        private string ident;
       /* public override void ResolvedName()
        {

        }*/
        public LeftHandSide(string ident)
        { this.ident = ident; }
        public override void dump(int indent)
        {
            label(indent, "LeftHandSide : {0}\n", ident);
            
        }
    }

    //week 8 Bai end

    public class MethodBody : Statements
    {
        private Block block1;
        private Block block2;
       /* public override void ResolvedName() {
            block1.ResolvedName();
            block2.ResolvedName();
        }  */

        public MethodBody(Block block1)
        {
            this.block1 = block1;
            
        }
        public MethodBody(Block block1, Block block2)
        {
            this.block1 = block1;
            this.block2 = block2;
        }
        public override void dump(int indent)
        {
            label(indent, "MethodBody:\n");
            if (block1 != null && block2 != null)
            {
                block1.dump(indent + 1 );
                block2.dump(indent + 1);
            }
            else if(block1 != null && block2 == null)
            {
                block1.dump(indent + 1);
            }
            else if (block1 == null && block2 != null)
            {
                block2.dump(indent + 1);
            }
        }
    }
 
    
 
    

    
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
