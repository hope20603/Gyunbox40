using System;
using System.Collections.Generic;
using System.Data;
using Gyunbox40.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gyunbox40.Views.Erp
{
    public partial class ManageDepart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetDepartList();
        }

        /// <summary>
        /// 최상위 부서코드 가져오기
        /// </summary>
        private void SetDepartList()
        {
            DataSet ds = null;

            string sqlQuery = "Select * from hope20603.COMDEP WHERE DEPDEP=1";

            DBConn dbConn = new DBConn();
            

            try
            {
                ds = dbConn.ExecuteWithDataSet(sqlQuery, "COMDEP");
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
                    item.Text = ds.Tables[0].Rows[i]["DEPKNM"].ToString();
                    DropDownList1.Items.Add(item);
                }
            }

            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();




        }
    }
}