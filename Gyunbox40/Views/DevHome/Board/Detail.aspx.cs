using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
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
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();

            sb.AppendLine(" SELECT * FROM  board WHERE serial_no = "+ serial_no);

            DBConn dbCon = new DBConn();

            try
            {
                ds = dbCon.ExecuteWithDataSet(sb.ToString(), "board");
            }
            catch
            {

            }
            finally
            {
                dbCon.Close();
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                ltl_Content.Text = ds.Tables[0].Rows[0]["message"].ToString();
            }
            else
            {
                Response.Write("<script>alert('조회중 문제가 발생했습니다.'); location.href='/Views/DevHome/Board/List.aspx'; </script>");
                Response.End();
            }


        }
    }
}