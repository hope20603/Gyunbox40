using Gyunbox40.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gyunbox40.Vue
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CommonController cc = new CommonController();
            cc.g_USER_ID = "";
            Response.Redirect("index.aspx");
            Response.End();
        }
    }
}