using System;
using System.Collections.Generic;

namespace Ders7_Metotlar_Devam
{
    class Program
    {
        static void Main(string[] args)
        {
            //DikdortgenAlanCevre(30, 60);
            //Console.ReadLine();

            int cevre, alan;
            DikdortgenCevreAlan(30, 60, out cevre, out alan);
            Console.WriteLine(30 + " " + 60 + " dikdörtgen cevresi=" + cevre + " alanı=" + alan);
            Console.ReadLine();

            //int sayi = sayiGir();
            //Console.WriteLine("Girilen sayı=" + sayi);


            //2 Parametre alsın, girilen 2 sayının bölümünü döndüren
            //metot yazınız. 
            //  int ve double tiplerinde
            //  veri alabilsin. (method overloading)
            //int bol = Bolum(600, 13);
            //double bol2 = Bolum(600D, 13D);
            //Console.WriteLine("integer bölüm=" + bol);
            //Console.WriteLine("double bölüm=" + bol2);

            ////1 int Parametre alsın, sayının faktöriyelini döndüren
            ////metot yazınız. 
            //int faktoriyel = Faktoriyel(6);
            //Console.WriteLine("Faktöriyel = " + faktoriyel);
            //Console.ReadLine();

            //Parametre olarak aldığı sayının asal olup
            //olmadığını döndüren prog.
            //Asal ise true, değilse false döndürsün. 

            //for (int j = 0; j < 10; j++)
            //{


            //    Console.Write("Bir sayı giriniz:");
            //     int k = Convert.ToInt32(Console.ReadLine());
            //    if (asalMi(k))
            //        Console.WriteLine(k + " Asalmış.");
            //    else
            //        Console.WriteLine(k + " Asal değilmiş.");
            //}

            //0-100 aralığında rastgele ürettiği 10 sayıyı
            //int tipinde dizi olarakdöndüren metodu tanımlayınız.

            //int[] gelen = new int[10];
            //gelen = Random10(gelen);
            //int sira = 1;
            //foreach (var item in gelen)
            //{
            //    Console.WriteLine(sira + ") " + item);
            //    sira++;
            //}

            //Kendisine gönderilen int dizinin elemanlarını
            //ekrana yazdıran, altına da toplamlarını ekrana
            //yazdıran prog. 
            //int[] dizi = { 1, 2, 0, 4, 5, 6, 0, 0, 9, 10 };
            //DiziYaz(dizi);
            //DiziYaz(dizi, false);

            // Kendisine gönderilen dizideki tek sayıları
            // yine dizi ile döndüren metodu yazınız.
            // limit = 20 dizideki eleman sayısı.
            //int[] sayilar = { 10, 20, 30, 40, 50, 11, 22, 33, 44, 55 };
            //int[] tekSayilar = diziTekleri(sayilar);
            //DiziYaz(tekSayilar, false);

            // Parametre olarak aldığı 2 adet sayıdan büyük olanı
            // döndüren metodu yazınız.
            //Console.WriteLine("Birinci sayıyı giriniz");
            //int i = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("İkinci sayıyı giriniz");
            //int j = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Üçüncü sayıyı giriniz");
            //int k = Convert.ToInt32(Console.ReadLine());

            //int buyuk3 = Buyuk3lu(i, j, k);
            //Console.WriteLine("Üç sayıdan büyük olan : " + buyuk3);
            ////int buyuk = Buyuk2li(i, j);                  
            //Console.ReadLine();

            //List tipinde aldığı 10 adet sayının karelerini 
            //List tipinde döndüren metodu yazınız.
            //(2 tane list olacak.)
            List<int> l = new List<int>();
            for (int t = 0; t < 10; t++)
            {
                Console.WriteLine("Sayı gir:");
                l.Add(Convert.ToInt32(Console.ReadLine()));

            }
            List<int> l2 = listeKare(l);
            foreach (var item in l2)
            {
                Console.WriteLine(item);
            }
        }
        private static List<int> listeKare(List<int> l3)
        {
            List<int> kareler = new List<int>();
            foreach (var item in l3)
            {
                kareler.Add(item * item);
            }
            return kareler;
        }

        private static int Buyuk3lu(int i, int j, int k)
        {
            return Buyuk2li(Buyuk2li(i, j), k);
        }

        private static int Buyuk2li(int v1, int v2)
        {
            if (v1 > v2)
                return v1;
            else
                return v2;
        }

        private static int[] diziTekleri(int[] sayilar)
        {
            int[] teklerDizisi = new int[20];
            for (int i = 0; i < sayilar.Length; i++)
            {
                if (sayilar[i] % 2 == 1)
                    teklerDizisi[i] = sayilar[i];
            }
            return teklerDizisi;
        }

        private static void DiziYaz(int[] dizi, bool SifirlariGoster)
        {
            foreach (var item in dizi)
            {
                if (SifirlariGoster)
                {
                    Console.Write(item + " ");
                }
                else
                {
                    if (item != 0)
                        Console.Write(item + " ");
                }
            }

        }

        private static void DiziYaz(int[] dz)
        {
            int toplam = 0;
            foreach (int item in dz)
            {

                Console.WriteLine(item);
                toplam += item;
                //Console.WriteLine(" toplam=" + toplam);
            }
            Console.WriteLine("Toplam:" + toplam);
        }

        private static int[] Random10(int[] sayiDizisi)
        {
            //int[] sayiDizisi = new int[10];  //boş diziyi tanımladık.
            Random r = new Random();
            for (int i = 0; i < 10; i++)
            {
                sayiDizisi[i] = r.Next(0, 100);
            }
            return sayiDizisi;
        }

        private static bool asalMi(int sayi)
        {
            if (sayi == 1)
                return false;
            for (int i = 2; i < sayi; i++)
            {
                if (sayi % i == 0)
                    return false;
            }
            return true;
        }

        private static int Faktoriyel(int sayi)
        {
            int carpim = 1;
            for (int i = 2; i <= sayi; i++)
            {
                carpim *= i;
            }
            return carpim;
        }

        private static int Bolum(int sayi1, int sayi2)
        {
            return sayi1 / sayi2;
        }
        private static double Bolum(double sayi1, double sayi2)
        {
            return Math.Round((sayi1 / sayi2), 2);
        }

        private static int sayiGir()
        {
            Console.WriteLine("Bir sayı giriniz:");
            int sayi = Convert.ToInt32(Console.ReadLine());
            return sayi;
        }

        private static void DikdortgenAlanCevre(int kK, int uK)
        {
            int cevre = 2 * (kK + uK);
            int alan = kK * uK;
            Console.WriteLine("Dikdörgen alanı:" + alan
                              + " çevresi:" + cevre);


        }
        private static void DikdortgenCevreAlan(int kK, int uK, out int cevre, out int alan)
        {
            cevre = 2 * (kK + uK);
            alan = kK * uK;
            //Console.WriteLine("Dikdörgen alanı:" + alan
            //                  + " çevresi:" + cevre);


        }
    }
}
