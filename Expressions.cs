using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AST
{
    // week 8 Bai
    public abstract class Expressions: Node
    {
        public Type type;
      
    }

   /* public class Expression : Expressions
    {
        private AssignmentExpression assignmentExpression;
        public override bool ResolvedName(Scope scope)
        {
            return assignmentExpression.ResolvedName(scope);
        }
        public Expression(AssignmentExpression assignmentExpression)
        {
            this.assignmentExpression = assignmentExpression;
        }
        public override void dump(int indent)
        {
            label(indent, "Expression:\n");
            assignmentExpression.dump(indent+1);
           
        }

        public override void TypeCheck()
        {
            throw new NotImplementedException();
        }
    }*/
   
    public class AssignmentExpression : Expressions
    {
       // private Literal literal;
        private Expressions lhs, rhs;
        public override bool ResolvedName(Scope scope)
        {
            return lhs.ResolvedName(scope)&&rhs.ResolvedName(scope);
        }
        public AssignmentExpression( Expressions lhs, Expressions rhs)
        {
            this.lhs = lhs;
            this.rhs = rhs;


        }
        public override void dump(int indent)
        {
            label(indent, "AssignmentExpression:\n");
            //literal.dump(indent+1);
            type.dump(indent + 1, "type");
            lhs.dump(indent + 1, "lhs");
            rhs.dump(indent + 1, "rhs");
           
        }

        public override void TypeCheck()
        {
            lhs.TypeCheck();
            rhs.TypeCheck();
            if (!rhs.type.Compatible(lhs.type))
            {
                Console.WriteLine("type error in assignment\n");
                throw new Exception("TypeCheck error");
            }
            type = rhs.type;
        }
    }

    public class Literal : Expressions
    {
        private string name;
        private Declaration declaration;

      
        public Literal(string name)
        {
            this.name = name;
            this.declaration = null;
        }
        public override bool ResolvedName(Scope scope)
        {
            if (scope != null)
            {
                declaration = scope.Resolve(name);
            }
            if (declaration == null)
            {
                Console.WriteLine("Error: Undeclared identifier.", name);
            }
            return declaration != null;

        }
        public override void dump(int indent)
        {
            if (declaration != null)
                label(indent, "Literal : {0}\n", name, declaration);
            else
                label(indent, "Literal: {0}\n", name);
            type.dump(indent + 1, "type");

           
        }

        public override void TypeCheck()
        {
            declaration.GetType();
        }
    }


    public class BinaryLiteral : Expressions
    {
        private Expressions lhs, rhs;
        private string op;

        public BinaryLiteral(Expressions lhs, string op,Expressions rhs)
        {
            this.lhs = lhs;
            this.op = op;
            this.rhs = rhs;
      
        }
        public override bool ResolvedName(Scope scope)
        {
            return lhs.ResolvedName(scope)&&rhs.ResolvedName(scope);
        }
        public override void dump(int indent)
        {
            label(indent, "DecimalIntegerLiteral:\n");
            type.dump(indent + 1, "type");
            lhs.dump(indent + 1, "type");
            rhs.dump(indent + 1, "type");
        }

        public override void TypeCheck()
        {
            lhs.TypeCheck();
            rhs.TypeCheck();
            
            switch (op)
            {
                case "<":
                    if(!lhs.type.Equals(new IntType())||!rhs.type.Equals(new IntType()))
                    {
                        System.Console.WriteLine("invalid arguments for less than expression\n");
                        throw new Exception("TypeCheck error");
                    } 
                    type = new NamedType("boolean");
                    break;
                case "+":
                    if (!lhs.type.Equals(new IntType()) || !rhs.type.Equals(new IntType()))
                    {
                        System.Console.WriteLine("invalid arguments for less than expression\n");
                        throw new Exception("TypeCheck error");
                    }
                    type = new NamedType("IntType");
                    break;
                default:
                    {
                        System.Console.WriteLine("Unexpected binary operator\n"+op);
                    }
                    break;
            }

        }
    }
    public class NumberLiteral : Expressions
    {
        private int value;
        public NumberLiteral(int value)
        {
            this.value = value;
        }
        public override bool ResolvedName(Scope scope)
        {
            return true;
        }
        public override void dump(int indent)
        {
            label(indent, "NumberExpression:\n");
            type.dump(indent + 1, "type");
        }

        public override void TypeCheck()
        {
            type = new IntType();
        }
    }

  

}
