using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;

namespace Gyunbox40.Views.DevHome.Board
{
    public partial class Modify : System.Web.UI.Page
    {
        string serial_no;
        CommonController cc;
        protected string txtContent = string.Empty;
        protected string txtTitle = string.Empty;
        protected string txtCategory = string.Empty;

        private string connectionString = ConfigurationManager.ConnectionStrings["GyunBox"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            cc = new CommonController();
            serial_no = cc.NullToBlank(Request["sn"]);
            txtContent = cc.NullToBlank(Request["ir1"]);
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
            else
            {
                //수정요청인 경우
                UpdateContent();
            }
        }

        protected void GetContent()
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();

            sb.AppendLine(" SELECT * FROM board A left join BRDMNU B on a.board_num = b.BRDSEQ  WHERE serial_no = " + serial_no);

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
                txtContent = ds.Tables[0].Rows[0]["message"].ToString().Replace("\"", "").Replace("''", "'");
                //ir1.Value = ds.Tables[0].Rows[0]["message"].ToString();
                title.Value = ds.Tables[0].Rows[0]["title"].ToString();
                //ltl_category.Text = ds.Tables[0].Rows[0]["BRDNME"].ToString();
                //ltl_writer.Text = ds.Tables[0].Rows[0]["writer"].ToString();
                //ltl_regDate.Text = ds.Tables[0].Rows[0]["reg_date"].ToString();

            }
            else
            {
                Response.Write("<script>alert('조회중 문제가 발생했습니다.'); location.href='/Views/DevHome/Board/List.aspx'; </script>");
                Response.End();
            }


        }

        public void UpdateContent()
        {
            StringBuilder sb = new StringBuilder(); //insert Query
            StringBuilder sbUpdate = new StringBuilder(); //update Query

            sb.Append("update hope20603.board set title=@title, message=@message where serial_no= @serial_no;");


            DBConn conn = new DBConn();
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn.GetConn());
            cmd.Parameters.AddWithValue("@title", title.Value);
            cmd.Parameters.AddWithValue("@message", txtContent);
            cmd.Parameters.AddWithValue("@serial_no", serial_no);

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception error)
            {
                Response.Write(error.ToString());
            }
            finally
            {
                conn.Close();
            }

            Response.Redirect("/Views/DevHome/Board/List.aspx");
            Response.End();
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Response.Redirect("/Views/DevHome/Board/List.aspx");
            UpdateContent();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Views/DevHome/Board/Detail.aspx?sn=" + serial_no);
        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Views/DevHome/Board/List.aspx");
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Views/DevHome/Board/Modify.aspx?sn=" + serial_no);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(" update hope20603.board set del_flag='Y' WHERE serial_no = " + serial_no);

            DBConn dbCon = new DBConn();

            try
            {
                dbCon.ExcuteNonQuery(sb.ToString());
            }
            catch
            {

            }
            finally
            {
                dbCon.Close();
            }

            Response.Redirect("/Views/DevHome/Board/List.aspx");
        }
    }
}