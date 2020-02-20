using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;

namespace Gyunbox40.Share
{
    public partial class Vue : System.Web.UI.MasterPage
    {
        CommonController cc = new CommonController();
        protected string loginState = "로그인";
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = cc.NullToBlank(Request["id"]);
            
            if(id != "")
            {
                loginState = "로그아웃";
            }
        }
    }
}