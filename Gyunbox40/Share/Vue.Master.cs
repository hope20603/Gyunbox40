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
        Util util = new Util();
        protected string loginState = "로그인";
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = util.NullToBlank(Session["userID"]);

            if (id != "")
            {
                loginState = "<a href = 'Logout.aspx' >로그아웃</a>";
            }
            else
            {
                loginState = "<a href = 'Login.aspx' >로그인</a>";
            }
        }
    }
}