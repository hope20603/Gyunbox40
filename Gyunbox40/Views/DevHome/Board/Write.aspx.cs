using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;
using System.Data.SqlClient;


namespace Gyunbox40.Views.DevHome.Board
{
    public partial class Write : System.Web.UI.Page
    {
        protected string txtContent = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            CommonController cc = new CommonController();
            if (!IsPostBack)
            {
                //초기화
            }
            else
            {
                txtContent = cc.ChkParam(Request["ir1"]);
                saveContent();
            }
        }

        public void saveContent()
        {
            StringBuilder sb = new StringBuilder(); //insert Query
            StringBuilder sbUpdate = new StringBuilder(); //update Query

            sb.Append(" INSERT INTO hope20603.board (writer, password, title, message, ref_id, inner_id, depth, read_count, del_flag, reg_date) ");
            sb.Append(" VALUES(@writer, @password, @title, @message, 0, 0, 0, 0, 'N', GETDATE()) ");

            DBConn conn = new DBConn();
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn.GetConn());
            cmd.Parameters.AddWithValue("@writer", "hope20603");
            cmd.Parameters.AddWithValue("@password", "1025");
            cmd.Parameters.AddWithValue("@title", "테스트입니다.");
            cmd.Parameters.AddWithValue("@message", txtContent);

            sbUpdate.Append("UPDATE hope20603.board SET ref_id = serial_no WHERE ref_id = 0");

            try
            {
                cmd.ExecuteNonQuery();
                conn.ExcuteNonQuery(sbUpdate.ToString());
            }catch(Exception error)
            {
                Response.Write(error.ToString());
            }
            finally
            {
                conn.Close();
            }

            Response.Redirect("/");
        }
    }
}