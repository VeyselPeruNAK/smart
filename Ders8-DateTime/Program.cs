using System;

namespace Ders8_DateTime
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(DateTime.MinValue);
            Console.WriteLine(DateTime.MaxValue);
            Console.WriteLine("\n" + DateTime.Now);
            Console.WriteLine("\n" + DateTime.Today);

            DateTime tarihsaat = new DateTime();
            tarihsaat = DateTime.Now;
            Console.WriteLine("Ay : " + tarihsaat.Month);
            Console.WriteLine("Yıl : " + tarihsaat.Year);
            Console.WriteLine("Tarih : " + tarihsaat.ToShortDateString());
            Console.WriteLine("Gün : " + tarihsaat.Day);

            Console.WriteLine("Haftanın Kaçıncı Günü : " + tarihsaat.DayOfWeek);
            Console.WriteLine("Yılın Kaçıncı Günü : " + tarihsaat.DayOfYear);
            Console.WriteLine("Günün Kaçıncı Saati : " + tarihsaat.TimeOfDay);
            Console.WriteLine();
            Console.WriteLine("Saat : " + tarihsaat.Hour);
            Console.WriteLine("Dakika : " + tarihsaat.Minute);
            Console.WriteLine("Saniye : " + tarihsaat.Second);
            Console.WriteLine("Milisaniye : " + tarihsaat.Millisecond);
            Console.WriteLine("Başlangıç tarihinden tutulan tarihe kadarki periyod sayısı : " + tarihsaat.Ticks);

            //     /*
            //      * TimeSpan: İki tarih arasıdaki süreyi tutan tiptir.
            //      */

            //DateTime mddg = new DateTime(1988, 5, 5);
            //DateTime bugun = DateTime.Now;

            //TimeSpan gecenZaman = bugun - mddg;

            //Console.WriteLine(gecenZaman.Days + " Gün");
            //Console.WriteLine(mddg.DayOfWeek + " Doğduğunuz Gün");

            DateTime gun = new DateTime(2021, 12, 31);
            Console.WriteLine(gun.DayOfWeek);
            Console.WriteLine(gun.DayOfYear);

            long zaman_ticks = getTime();
            Console.WriteLine("zaman_ticks:" + zaman_ticks);


            // To convert the current datetime to file name to save files you can use
            Console.WriteLine("DateTime.Now.ToFileTime" + DateTime.Now.ToFileTime());
            Console.WriteLine();


        }
        private static DateTime JanFirst1970 = new DateTime(1970, 1, 1);
        public static long getTime()
        {
            return (long)((DateTime.Now.ToUniversalTime() - JanFirst1970).TotalMilliseconds + 0.5);
        }
    }
}
