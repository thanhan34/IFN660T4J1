using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
namespace GPLexTutorial
{
   
    class Program
    {
        static void Main(string[] args)
        {
            Scanner scanner = new Scanner(
                new FileStream(args[0], FileMode.Open));
            Parser parser = new Parser(scanner);
            parser.Parse();
            Console.Read();
        }
    }


   
}
