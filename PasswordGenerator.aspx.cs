using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RajLab
{
    public partial class PasswordGenerator : System.Web.UI.Page
    {
        readonly char[] _chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            int numberOfPasswords = 1;
            int.TryParse(txtNoOfPasswords.Text, out numberOfPasswords);
            int passwordLength = 1;
            int.TryParse(txtBoxPasswordLength.Text, out passwordLength);
            for (int i = 0; i < numberOfPasswords; i++)
            {
                string password = GetRandomPassword(i,passwordLength);
                passwordsPlaceHolder.Controls.Add(new LiteralControl(password));
                passwordsPlaceHolder.Controls.Add(new LiteralControl("<br />"));
            }

        }
        private string GetRandomPassword(int seed,int length)
        {
            string password = string.Empty;
            var random = new Random(seed + DateTime.Now.Millisecond);
            for (int i = 0; i < length; i++)
            {
                int len = _chars.Length;
                if (i == 0) len = len - 10;
                var x = random.Next(1, len);
                if (!password.Contains(_chars.GetValue(x).ToString()))
                    password += _chars.GetValue(x);
                else
                    i--;
            }
            return password;
        } 
    }
}