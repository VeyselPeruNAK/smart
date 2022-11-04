using System;

namespace ConsoleApp3
{
    class Program
    {
        static void Main(string[] args)
        {
            int i;
            string str_i;
        giris:
            Console.WriteLine("Bir sayı giriniz");

            str_i = Console.ReadLine();
            bool b = int.TryParse(str_i, out i);
            if (!b || i == 0)
                goto giris;
            if (i % 2 == 0)
                Console.WriteLine("Bu sayı 2 ye tam bölünür.");
            if (i % 3 == 0)
                Console.WriteLine("Bu sayı 3 e tam bölünür.");
            if (i % 5 == 0)
                Console.WriteLine("Bu sayı 5 e tam bölünür.");
            Console.ReadLine();
        }
    }
}
