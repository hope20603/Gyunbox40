using Gyunbox40.Common;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gyunbox40.Views.Erp
{
    public partial class AddMember : System.Web.UI.Page
    {
        //string newidx = "";
        //string txt_num = "";
        //string txt_name = "";
        //string txt_age = "";
        //string txt_email = "";
        //string txt_level = "";
        //string txt_idt = "";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string strQuery = "";
            strQuery = @"insert into commem ( comidx, comnum, comknm, comage, comeml, comlvl, comjin, comidt, comtel, comphn ) values ( 
                                ( select COALESCE(MAX(COMIDX),0)+1 from COMMEM ), '@comnum', '@comknm', @comage, '@comeml', '@comlvl', '@comjin', '@comidt','@comtel','@comphn' ) ;";

            strQuery = strQuery.Replace("@comnum", "G2190001");
            strQuery = strQuery.Replace("@comknm", txt_name.Value);
            strQuery = strQuery.Replace("@comage", txt_age.Value);
            strQuery = strQuery.Replace("@comeml", txt_email.Value);
            strQuery = strQuery.Replace("@comlvl", txt_level.Value);
            strQuery = strQuery.Replace("@comjin", txt_jin.Value);
            strQuery = strQuery.Replace("@comtel", txt_tel.Value);
            strQuery = strQuery.Replace("@comphn", txt_phn.Value);
            strQuery = strQuery.Replace("@comidt", DateTime.Now.ToShortDateString().Replace("-",""));

            DBConn conn = new DBConn();
            SqlCommand cmd = new SqlCommand(strQuery, conn.GetConn());

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

        }
    }
}