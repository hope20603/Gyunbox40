using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;

namespace Gyunbox40
{
    public partial class admin : System.Web.UI.Page
    {
        CommonController cc;
        Util util;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            cc = new CommonController();
            util = new Util();

            string st = util.NullToBlank(Request["st"]);
            string encStr = "";

            if(st != "")
            {
                encStr = cc.ComputeHash(st);

                Response.Write(encStr);
                Response.End();
            }


            
            
        }
    }
}