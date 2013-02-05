using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RajLab
{
    public partial class ColorConverter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRGBToHex_Click(object sender, EventArgs e)
        {
            lblStatus.Visible = false;
            string rtn = "#" + int.Parse(txtR.Text).ToString("X2") + int.Parse(txtG.Text).ToString("X2") +
                         int.Parse(txtB.Text).ToString("X2");
            lblHex.Text = rtn;
            spanHexBox.Style.Add("background-color", rtn);
        }

        protected void btnHexToRGB_Click(object sender, EventArgs e)
        {
            lblStatus.Visible = false;
            try
            {
                string hex = txtHex.Text;
                if (!hex.StartsWith("#")) hex = "#" + hex;
                var color = System.Drawing.ColorTranslator.FromHtml(hex);
                lblR.Text = color.R.ToString();
                lblG.Text = color.G.ToString();
                lblB.Text = color.B.ToString();
                spanRGBBox.Style.Add("background-color", hex);
            }
            catch (Exception)
            {
                lblStatus.Visible = true;
                lblStatus.Text = "Hex is not valid.";
            }
        }
    }
}