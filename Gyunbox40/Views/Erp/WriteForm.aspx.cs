using Gyunbox40.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gyunbox40.Views.Erp
{
    public partial class WriteForm : System.Web.UI.Page
    {
        protected string txtContent = string.Empty;
        private string connectionString = ConfigurationManager.ConnectionStrings["GyunBox"].ConnectionString;
        CommonController cc = new CommonController();

        protected void Page_Load(object sender, EventArgs e)
        {
            //D:\HOME\Gyunbox40\Gyunbox40\Common\CommonController.cs
            string mode = cc.NullToBlank(Request["mode"]);    

            SetDropDownList();
            GetDefaultContent(mode);


        }

        private void SetDropDownList()
        {
            DataSet ds = null;

            string sqlQuery = "Select * from hope20603.COMDOC";

            DBConn dbConn = new DBConn();


            try
            {
                ds = dbConn.ExecuteWithDataSet(sqlQuery, "COMDOC");
            }
            catch
            {

            }
            finally
            {
                dbConn.Close();
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ListItem item = new ListItem();
                    item.Text = ds.Tables[0].Rows[i]["DOCKNM"].ToString();
                    item.Value = ds.Tables[0].Rows[i]["DOCCOD"].ToString();
                    ddlDoc.Items.Add(item);
                }
            }
        }

        protected void GetDefaultContent(string mode)
        {
            DataSet ds = null;
            string sqlQuery = "Select * from hope20603.COMDOC WHERE DOCCOD='" + mode + "'";
            DBConn dbConn = new DBConn();

            ds = dbConn.ExecuteWithDataSet(sqlQuery, "DocDefault");

            if(ds.Tables[0].Rows.Count > 0)
            {
                txtContent = ds.Tables[0].Rows[0]["DOCFRM"].ToString().Replace("\"", "").Replace("''", "'"); ;
            }
            
        }
    }
}