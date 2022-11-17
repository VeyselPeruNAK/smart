using System;

namespace Ders6_Metotlar_1
{
    class Program
    {
        // Metodu tanımladık.

        static void Main(string[] args)
        {

            //// static metodu doğrudan çağırdık.
            MerhabaDunya();

            //// Nesne üzerinden metot çağırma. (static değilse)
            //// OOP derslerinden sonra anlaşılacak.
            Program p = new Program();
            p.MerhabaDunya2();




            int toplam = Topla(s1: 10, s2: 20);  // Topla metotundan döndürülen değer toplam değişkenine atandı.
            Console.WriteLine("toplam = " + toplam);
            //Console.ReadLine();
            int k = Kare(toplam);
            Console.WriteLine("Kare = " + k);


            //toplam = Topla(s2:10, s1:20);  // Topla metotundan döndürülen değer toplam değişkenine atandı.
            //Console.WriteLine($"toplam değişkenin değeri: {toplam}");

            //Fark metodu
            int f = Fark(10, 20);
            Console.WriteLine($"f değişkenin değeri: {f}"); // -10
            f = Fark(s2: 10, s1: 20);
            Console.WriteLine($"f değişkenin değeri: {f}"); // 10


            // Kendisine gönderilen string değeri 10 defa ekrana yazdıran metodu tanımlayın.

            //// Metodu çağırdık.
            string mesaj = "Merhabalar";
            Ekrana10DefaYaz(mesaj);


            Ekrana10DefaYaz("Doğrudan Mesaj");


            Console.WriteLine("10 defa yazılacak yazı: ");
            string msj = Console.ReadLine();
            Ekrana10DefaYaz(msj);



            int k2 = Kare(7);
            Console.WriteLine($"7  sayısının karesi = " + k2);

            Console.WriteLine($"7 sayısının karesi = " + Kare(7));


            double fiyat = 100.0;
            Console.WriteLine(KDVHesapla(fiyat));
            double kdvsizFiyat = 100;
            double kdvLi = 0;
            string kategori = "gıda";
            if (kategori.ToLower() == "gıda")
                kdvLi = kdvsizFiyat * 1.08;
            else if (kategori.ToLower() == "eğitim")
                kdvLi = kdvsizFiyat * 1.05;
            else
                kdvLi = kdvsizFiyat * 1.18;
            kdvsizFiyat = 100;
            kategori = "eğitim";
            if (kategori.ToLower() == "gıda")
                kdvLi = kdvsizFiyat * 1.08;
            else if (kategori.ToLower() == "eğitim")
                kdvLi = kdvsizFiyat * 1.05;
            else
                kdvLi = kdvsizFiyat * 1.18;
            kdvsizFiyat = 200;
            kategori = "spor";
            if (kategori.ToLower() == "gıda")
                kdvLi = kdvsizFiyat * 1.08;
            else if (kategori.ToLower() == "eğitim")
                kdvLi = kdvsizFiyat * 1.05;
            else
                kdvLi = kdvsizFiyat * 1.18;
            kdvsizFiyat = 300;
            kategori = "eğitim";
            if (kategori.ToLower() == "gıda")
                kdvLi = kdvsizFiyat * 1.08;
            else if (kategori.ToLower() == "eğitim")
                kdvLi = kdvsizFiyat * 1.05;
            else
                kdvLi = kdvsizFiyat * 1.18;

            Console.WriteLine("Gıda:" + KDVHesapla(fiyat, "gıda"));
            Console.WriteLine("Spor:" + KDVHesapla(fiyat, "spor"));
            Console.WriteLine("Egitim:" + KDVHesapla(fiyat, "egitim")); //
            Console.WriteLine("Eğitim:" + KDVHesapla(fiyat, "eğitim")); //

            // Aynı isimde farklı parametreler alan metotlar tanımladık.
            // METHOD OVERLOADING
            Console.ReadLine();



        }

        static void Ekrana10DefaYaz(string yazi)
        {
            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine(yazi);
            }
        }


        // PARAMETRESİZ, DEĞER DÖNDÜRMEYEN METOD.
        static void MerhabaDunya()
        {
            Console.WriteLine("Merhaba Dünya!");
            Console.ReadLine();
        }

        void MerhabaDunya2()
        {
            Console.WriteLine("Merhaba Dünya!");
            Console.ReadLine();
        }


        // PARAMETRELİ, DEĞER DÖNDÜREN METOD.

        // Kendisine gönderilen 2 sayıyı toplayıp sonucu döndüren metot.
        static int Topla(int s1, int s2)
        {
            Console.WriteLine($"s1 = {s1}");
            Console.WriteLine($"s2 = {s2}");
            int toplam = s1 + s2;
            return toplam; // return ile veri döndürebiliriz.
        }

        static int Fark(int s1, int s2)
        {

            int fark = s1 - s2;
            return fark; // return ile veri döndürebiliriz.
        }

        // Kendisine gönderilen int tipindeki sayının karesini geri döndüren metodu yazınız. Ve kullanınız.

        static int Kare(int sayi)
        {
            return sayi * sayi;
        }
        // 



        // METHOD OVERLOADING: Aynı isimde farklı parametreler alan metodlar.

        // Kendisine gönderilen fiyata %18 KDv ekleyip geri döndüren metodu yazınz.
        //return tip: double,parametre tipİdouble
        static double KDVHesapla(double kdvsizFiyat)
        {
            return kdvsizFiyat * 1.18;
        }
        // yukarıdaki metoda ek olarak.
        //ürün tipine göre KDV eklenecek urunTipi string olacak.
        // gıda: %8, eğitim:%5,diğerleri:%18
        static double KDVHesapla(double kdvsizFiyat, string kategori)
        {
            if (kategori.ToLower() == "gıda")
                return kdvsizFiyat * 1.08;
            else if (kategori.ToLower() == "eğitim")
                return kdvsizFiyat * 1.05;
            else
                return kdvsizFiyat * 1.18;
        }







    }
}
