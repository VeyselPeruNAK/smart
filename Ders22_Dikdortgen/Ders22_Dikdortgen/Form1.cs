using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ders22_Dikdortgen
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnHesapla_Click(object sender, EventArgs e)
        {
            if (txtGenislik.Text == "" || txtUzunluk.Text == "")
                return;

            double genislik = Convert.ToDouble(txtGenislik.Text);
            double uzunluk = Convert.ToDouble(txtUzunluk.Text);
            double alan = genislik * uzunluk;
            double cevre = 2 * (genislik + uzunluk);
            lblCevre.Text = "Çevre:" + cevre.ToString("###.###,##");
            lblAlan.Text = "Alan:" + alan.ToString("###.###,##");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            txtGenislik.Text = "0";
            txtUzunluk.Text = "0";
        }

        private void Hesapla(object sender, EventArgs e)
        {
            if (txtGenislik.Text == "" || txtUzunluk.Text == "")
                return;

            double genislik = Convert.ToDouble(txtGenislik.Text);
            double uzunluk = Convert.ToDouble(txtUzunluk.Text);
            double alan = genislik * uzunluk;
            double cevre = 2 * (genislik + uzunluk);
            lblCevre.Text = "Çevre:" + cevre.ToString("###.###,##");
            lblAlan.Text = "Alan:" + alan.ToString("###.###,##");
        }
    }
}
