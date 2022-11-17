using System;

namespace Ders8_MathMethods
{
    class Program
    {
        static void Main(string[] args)
        {
            int mutlak7 = Math.Abs(-7);
            Console.WriteLine(mutlak7);
            double cos45 = Math.Round(Math.Cos(45), 2);
            Console.WriteLine(cos45);
            Console.WriteLine(Math.Sin(45));
            Console.WriteLine(Math.Round(Math.Sin(45), 2));
            Console.WriteLine(Math.Round(Math.Tan(45), 2));
            Console.WriteLine(Math.Max(45,55));
            Console.WriteLine(Math.Min(12,21));
            Console.WriteLine(Math.Pow(2,10));
            Console.WriteLine(Math.Sqrt(25));
            Console.WriteLine(Math.Log(100));
            Console.WriteLine(Math.Exp(4));
            Console.WriteLine(Math.Log10(5));

            double[] numbers = {-1, 0, 0.105, 0.5, 0.789, 1,4,6.9,
                                 10, 50, 100, 500, 1000,
                                Double.MaxValue};
            foreach (double number in numbers)
            {
                Console.WriteLine("10 tabanına göre " + number +
                    " sayısının log değeri:" + Math.Log10(number)
                    );
            }









            Console.ReadLine();
        }
    }
}
