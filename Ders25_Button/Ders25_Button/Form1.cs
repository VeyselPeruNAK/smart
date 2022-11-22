using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ders25_Button
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }



        private void btn1_Click(object sender, System.EventArgs e)
        {
            txt1.Text = "Buton Klik";
        }



        private void txt1_TextChanged(object sender, System.EventArgs e)
        {
            if (txt1.Text.ToUpper().Equals("SON"))
                btn1.Visible = false;
            else
                btn1.Visible = true;
            //btn1.Visible = !txt1.Text.Equals ("end");
        }
    }
}
