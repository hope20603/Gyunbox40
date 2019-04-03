using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;

namespace Gyunbox40.Views.DevHome.Board
{
    public partial class Detail : System.Web.UI.Page
    {
        string serial_no;
        CommonController cc;
        protected void Page_Load(object sender, EventArgs e)
        {
            cc = new CommonController();
            serial_no = cc.NullToBlank(Request["sn"]);
            if (!IsPostBack)
            {
                if (serial_no == "")
                {
                    Response.Write("<script>alert('잘못된 접근입니다.'); location.href='/Views/DevHome/Board/List.aspx'; </script>");
                    Response.End();
                }
                else
                {
                    GetContent();
                }
            }
        }

        protected void GetContent()
        {

        }
    }
}