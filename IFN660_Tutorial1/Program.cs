using System.IO;

namespace GPLexTutorial {
    class Program {
        static void Main(string[] args) {
            Scanner scanner = new Scanner(
                new FileStream(args[0], FileMode.Open));
            Parser parser = new Parser(scanner);
            parser.Parse();
            System.Console.ReadLine();
            }
        }
    }
