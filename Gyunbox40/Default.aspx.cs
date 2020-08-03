using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gyunbox40
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string host = Request.Url.Host.ToUpper();
            if(host.IndexOf("DDOGRAM") > -1)
            {
                Response.Redirect("/Vue/Index.aspx");
                Response.End();
            }

        }
    }
}
