using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;


namespace Gyunbox40.Views.DevHome.Board
{
    public partial class Write : System.Web.UI.Page
    {
        protected string txtContent = string.Empty;
        protected string txtTitle = string.Empty;
        protected string txtCategory= string.Empty;

        private string connectionString = ConfigurationManager.ConnectionStrings["GyunBox"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            CommonController cc = new CommonController();
            if (!IsPostBack)
            {
                InitCategory();
            }
            else
            {
                txtContent = cc.ChkParam(Request["ir1"]);
                txtTitle = cc.ChkParam(Request["title"]);
                txtCategory = cc.ChkParam(Request["category"]);
                SaveContent();
            }
        }

        /// <summary>
        /// 카테고리 초기화
        /// </summary>
        public void InitCategory()
        {

            DataSet ds = null;
            //ope20603.sp_selectBRDMNU 
            //초기화
            //ListItem item1 = new ListItem("카테고리", "0");
            //this.ddl_category.Items.Add(item1);

            string spName = "sp_getBRDMNU";
            SqlConnection oCon = new SqlConnection(connectionString);
            //SqlParameter[] _sqlParam = null;

            try
            {
                ds = SqlHelper.ExecuteDataset(oCon, CommandType.StoredProcedure, spName);

                if(ds.Tables[0].Rows.Count > 0)
                {
                    this.ltl_test.Text += "<select name='category'><option value='0'>카테고리</option>";
                    for(int i=0; i<ds.Tables[0].Rows.Count; i++)
                    {
                        //ListItem tmpItem = new ListItem(ds.Tables[0].Rows[i]["BRDNME"].ToString(), ds.Tables[0].Rows[i]["BRDSEQ"].ToString());
                        //this.ddl_category.Items.Add(tmpItem);
                        this.ltl_test.Text += "<option  value='" + ds.Tables[0].Rows[i]["BRDSEQ"].ToString() + "'>"+ ds.Tables[0].Rows[i]["BRDNME"].ToString() + "</option>";
                    }
                    this.ltl_test.Text += "</select>";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
                Response.Flush();
                Response.End();
            }
            finally
            {
                ds.Dispose();
                if (oCon.State == ConnectionState.Open)
                    oCon.Close();

                oCon.Dispose();

            }
        }

        public void SaveContent()
        {
            StringBuilder sb = new StringBuilder(); //insert Query
            StringBuilder sbUpdate = new StringBuilder(); //update Query

            sb.Append(" INSERT INTO hope20603.board (writer, password, title, message, ref_id, inner_id, depth, read_count, del_flag, reg_date , board_num) ");
            sb.Append(" VALUES(@writer, @password, @title, @message, 0, 0, 0, 0, 'N', GETDATE() , @category) ");

            DBConn conn = new DBConn();
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn.GetConn());
            cmd.Parameters.AddWithValue("@writer", "hope20603");
            cmd.Parameters.AddWithValue("@password", "1025");
            cmd.Parameters.AddWithValue("@title", this.txtTitle);
            cmd.Parameters.AddWithValue("@message", this.txtContent);
            cmd.Parameters.AddWithValue("@category", this.txtCategory);

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

            Response.Redirect("/Views/DevHome/Board/List.aspx");
            Response.End();
        }
    }
}