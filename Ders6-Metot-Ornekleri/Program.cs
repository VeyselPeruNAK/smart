using System;
using System.Collections.Generic;
using System.Linq;
namespace Ders6_Metot_Ornekleri
{
    class Program
    {
        static void Main(string[] args)
        {
            int sayi = sayiGir();
            //Console.WriteLine("Girilen sayı : "+sayi);

            //int besFaktoriyeli = Faktoriyel(5);
            //Console.WriteLine($"5 sayısının faktöriyeli {besFaktoriyeli}");


            //double dFktryl = Faktoriyel(5.5);
            //Console.WriteLine($"5.5 sayısının faktöriyeli {dFktryl}");

            Console.WriteLine($"7 asal mı : {isPrime(7)}");
            Console.WriteLine($"15 asal mı : {isPrime(15)}");



            //int[] rastgele10 = Random10();

            //foreach (var item in rastgele10)
            //{
            //    Console.WriteLine(item);
            //}


            int[] sayilar = { 10, 20, 30, 40, 50, 11, 22, 33, 44, 55 };
            diziYaz(sayilar);

            int[] tekSayilar = diziTekleri(sayilar);
            diziYaz(tekSayilar, false); // sıfırları göstermeyen metoda gönderdik.

            //Console.WriteLine(buyuk2li(99,127));
            //Console.WriteLine(buyuk3lu(124,144,256));

            ////liste sorusu
            List<int> sayilarim = new List<int>() { 2, 3, 4, 5 };
            List<int> karelerim = listeKare(sayilarim);

            //int boyut = sayilarim.Count();
            //for (int i = 0; i < boyut; i++)
            //{
            //    Console.WriteLine($"{sayilarim[i]} sayısının karesi = {karelerim[i]} ");
            //}



            //foreach (var item in sayiGetir10())
            //{
            //    Console.Write(item + " ");
            //}


            //List<int> sayiListesi = sayiUret(5, 25, 7); // 5-25 arasında 7 sayı üret
            //foreach (var item in sayiListesi)
            //{
            //    Console.Write($"{item}  ");
            //}

            List<string> kelimelerim = new List<string>() { "araba", "hızla", "yanımdan", "geçti" };
            string cumlem = listToString(kelimelerim);
            Console.WriteLine(cumlem);

        }
        // sayı girişini otomatikleştiren metodu yazınız.
        // Kullanıcıdan alınan int tipindeki sayıyı döndürecek.
        // int sayi = sayiGir();

        // ÇÖZÜM
        static int sayiGir()
        {
            Console.Write("sayı : ");
            int sayi = Convert.ToInt32(Console.ReadLine());
            return sayi;

        }

        // Parametre olarak aldığı sayının faktöriyelini döndüren metodu yazınız.
        // int,double tiplerinde veri alabilsin.(method overloading)

        // ÇÖZÜM
        static int Faktoriyel(int s)
        {
            // 5 => 1*2*3*4*5
            int carpim = 1;
            for (int i = 1; i <= s; i++)
            {
                carpim *= i;
            }
            return carpim;
        }
        // double overload 
        static double Faktoriyel(double s)
        {
            // 5 => 1*2*3*4*5
            double carpim = 1.0;
            for (double i = 1.0; i <= s; i++)
            {
                carpim *= i;
            }
            return carpim;
        }

        // Parametre olarak aldığı sayının asal olup olmadığını döndüren metod. Asal ise true değil ise false döndürsün.
        // ÇÖZÜM
        // AsalMi
        static bool isPrime(int sayi)
        {
            // 5 asalMi? 2,3,4 tam bölünmüyorsa asaldir.
            // 7 asalMi? 2,3,4,5,6 tam bölünmüyorsa asaldir.

            for (int i = 2; i < sayi; i++)
            {
                if (sayi % i == 0)
                {
                    return false;
                }
            }
            return true;
        }

        // 0-100 aralığında rastgele ürettiği 10 sayıyı int tipinde dizi olarak döndüren metodu tanımlayınız.

        static int[] Random10()
        {
            int[] sayiDizisi = new int[10]; // boş dizi tanımladık.
            Random r = new Random();
            for (int i = 0; i < 10; i++)
            {
                sayiDizisi[i] = r.Next(0, 100); // üretilen sayıları diziye dolduracak.
            }
            return sayiDizisi;
        }


        // Kendisine parametre olarak gönderilen int dizinin elemanlarını ekrana yazdıran
        // metodu tanımlayın.
        static void diziYaz(int[] dizi)
        {
            foreach (int eleman in dizi)
            {
                Console.Write(eleman + "  ");
            }
            Console.WriteLine();
        }

        // diziYaz OVERLOAD' metodu.
        static void diziYaz(int[] dizi, bool sifirGoster)
        {
            foreach (int eleman in dizi)
            {
                if (sifirGoster == false)
                {
                    if (eleman != 0)
                    {
                        Console.Write(eleman + "  ");
                    }
                }
                else
                {
                    Console.Write(eleman + "  ");
                }

            }
            Console.WriteLine();
        }

        // Kendisine gönderilen dizideki tekSayiları yine dizi ile döndüren metodu yazınız.(limit 20 : eleman sayısı)

        static int[] diziTekleri(int[] sayiDizisi)
        {
            int[] teklerDizisi = new int[20];
            for (int i = 0; i < sayiDizisi.Length; i++)
            {
                if (sayiDizisi[i] % 2 == 1)
                    teklerDizisi[i] = sayiDizisi[i];
            }
            return teklerDizisi;
        }

        // parametre olarak aldığı 2 adet sayıdan büyük olanı döndüren metodu yazınız.
        static int buyuk2li(int s1, int s2)
        {
            if (s1 > s2)
            {
                return s1;
            }
            else
            {
                return s2;
            }
        }

        // parametre olarak aldığı 3 adet sayıdan en büyük olanı döndüren metodu yazınız.

        static int buyuk3lu(int s1, int s2, int s3)
        {
            return buyuk2li((buyuk2li(s1, s2)), s3);
        }

        // List tipinde aldığı 10 adet sayının karelerini List tipinde döndüren
        // metodu yazınız.(2 tane List olacak)

        static List<int> listeKare(List<int> sayilar)
        {
            List<int> kareler = new List<int>();
            int boyut = sayilar.Count();
            for (int i = 0; i < boyut; i++)
            {
                kareler.Add(sayilar[i] * sayilar[i]);
            }
            return kareler;
        }

        // Liste sorusu : Kullanıcıdan 10 sayı alıp liste ile döndüren metodu yazınız.
        static List<int> sayiGetir10()
        {
            List<int> sayilar = new List<int>();
            for (int i = 0; i < 10; i++)
            {
                Console.Write($"{i}. sayı = ");
                int sayi = int.Parse(Console.ReadLine());
                sayilar.Add(sayi);
            }
            return sayilar;
        }

        // (enKucuk,enBuyuk,sayiAdedi)
        // enKucuk ile enBuyuk arasında sayi adedince rastgele sayı üretsin.
        // Bir listeye atıp döndürsün.

        //static dönusTipi metotAdı(tip parametre,tip parametre,...)
        //{

        //}
        //  static dönenVeritipi  metotAdı
        static List<int> sayiUret(int enKucuk, int enBuyuk, int sayiAdedi)
        {
            List<int> sayilar = new List<int>();
            Random randomNesnesi = new Random();
            for (int i = 0; i < sayiAdedi; i++)
            {
                int sayi = randomNesnesi.Next(enKucuk, enBuyuk);
                sayilar.Add(sayi);
            }
            return sayilar;
        }

        // Kendisine liste olarak gönderilen stringleri tek bir string olarak birleştirip döndüren metodu yazınız.
        //List<string> => Metotda parametre olarak gönder.
        // string olarak al.
        //List<string> kelimelerim = new List<string>() { "araba", "hızla", "yanımdan", "geçti" };

        static string listToString(List<string> yazilar)
        {
            string birlesim = "";
            for (int i = 0; i < yazilar.Count(); i++)
            {
                birlesim += yazilar[i] + "\t";
            }
            return birlesim;
        }

    }
}
