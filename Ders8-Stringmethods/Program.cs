using System;

namespace Ders8_StringMethods
{
    class Program
    {
        static void Main(string[] args)
        {
            //string birlesim = String.Concat("Smart", "Pro ", " 405Sabah ", 2022);
            //Console.WriteLine(birlesim);

            //int[] dizi = { 3, 4, 5, 6 };             
            //Console.WriteLine(String.Concat(dizi));


            //string str1 = "KADIKÖY";
            //string str2 = "kadıköy";

            //Console.WriteLine(String.Compare(str1, str2));
            //Console.WriteLine(String.Compare(str1, 0, str2, 0, 3));
            //Console.WriteLine(String.Compare(str1, 0, str2, 0, 3, true));
            //string metin = "BEŞİKTAŞ";
            //Console.WriteLine(metin.IndexOf("Ş"));// İlk Ş değerinin indexi
            //Console.WriteLine(metin.LastIndexOf("Ş"));//Son Ş değerinin indexi
            //Console.WriteLine(metin.StartsWith("BEŞ"));//BEŞ ile başlıyor mu?
            //Console.WriteLine(metin.EndsWith("KTAŞ"));// KTAŞ ile bitiyor mu?

            //string yazi = "            BFENER BAHÇEB      ";
            //yazi = yazi.Trim(' ');
            //Console.WriteLine("yazi=" + yazi);
            //yazi = yazi.Trim('B');
            //Console.WriteLine("yazi=" + yazi);
            //char[] dizi = { 'F', 'Ç', 'E', 'A', 'O' };
            ////yazıdan listedeki karakterleri metnin kenarlarından siler.
            //yazi = yazi.Trim(dizi);
            //Console.WriteLine(yazi);

            //string str3 = "Merhaba Dünya";
            //Console.WriteLine(str3.PadRight(15, 'E'));
            //Console.WriteLine(str3.PadLeft(20, '*'));
            ////string ss =  "=" ;
            //string youtubeStr= "Https://www.youtube.com/watch?v=tbCiWKLLjBY";
            //string[] adres = youtubeStr.Split(':');

            //foreach (var item in adres)
            //{
            //    Console.WriteLine(item);
            //}
            ////Console.WriteLine(youtubeStr.Substring(12, 5));
            //string cumle =  "Merhaba arkadaşlar. Bugün sınav var." ;
            //string[] kelimeler = cumle.Split(' ');
            //string cumle2 = String.Join(" ", kelimeler);
            //Console.WriteLine("Cumle2=" + cumle2);

            //foreach (var item in kelimeler)
            //{
            //    if(item !="" && item!=" ")
            //    Console.WriteLine(item);
            //}

            //int kelimeSayisi = kelimeSay(cumle);
            //Console.WriteLine("Kelime sayısı=" + kelimeSayisi);

            string buyuk = "SMARTPRO";
            string kucuk = "smartpro";

            Console.WriteLine(buyuk.ToLower());
            Console.WriteLine(kucuk.ToUpper());
            // 0. indisten itibaren 5 karakter sil.
            //Console.WriteLine("buyuk removed="+buyuk.Remove(0,5));
            buyuk = buyuk.Insert(5, "_BRO_");
            //Console.WriteLine("buyuk inserted="+buyuk.Insert(5, "_BRO_"));
            buyuk = buyuk.Replace('A', 'E');
             
            
            

            buyuk = buyuk.Replace("PRO", "OKUL");
            buyuk = buyuk.Replace('O', 'U');

            Console.WriteLine("buyuk replace=" + buyuk); // SMERT_BRU_UKUL

            Console.WriteLine("Buyuk(0)=" + buyuk[0]);
            Console.WriteLine("   buyuk.Length= " + buyuk.Length);


            // Metot kullanarak string'i tersten sıralayıp döndüren  prog.
            buyuk = "Korkma sönmez bu şafaklarda";
            string sss = TersYaz(buyuk);
            Console.WriteLine("Tersi=" + sss);
            Console.ReadLine();
            

        }
        //  
        // SMERT_BRU_UKUL
        private static string TersYaz(string buyuk)
        {
            string ters = "";
            for (int i = buyuk.Length - 1; i>=0; i--)
            {
                ters = ters + buyuk[i] ;
                Console.WriteLine(i + " " + ters);
            }            
            return ters;
        }

        private static int kelimeSay(string cumle)
        {
            int toplamKelime = 0;
            string[] dizi = cumle.Split(' ');
            //return dizi.Length;
            foreach (var item in dizi)
            {
                if (item!=" " && item!="")
                    toplamKelime++;
            }
            return toplamKelime;
        }
    }
}
