using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;


namespace Gyunbox40.Vue
{
    public partial class Join : System.Web.UI.Page
    {
        protected string hostString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            CommonController cc = new CommonController();
            hostString = cc.hostString;
        }
    }
}