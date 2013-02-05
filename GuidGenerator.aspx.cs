using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RajLab
{
    public partial class GuidGenerator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            int numberOfPasswords = 1;
            int.TryParse(txtNoOfGuids.Text, out numberOfPasswords);
            for (int i = 0; i < numberOfPasswords; i++)
            {
                string guid = Guid.NewGuid().ToString().ToUpper();
                placeHolder.Controls.Add(new LiteralControl(guid));
                placeHolder.Controls.Add(new LiteralControl("<br />"));
            }
        }  
    }
}