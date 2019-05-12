using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;

namespace Gyunbox40.Views.Home
{
    public partial class SaveContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SaveContact();
        }


        public string SaveContact()
        {
           
            string reval = "";
            Common.CommonController cc = new Common.CommonController();
            Hashtable ht = new Hashtable();
            string name = cc.NullToBlank(Request["name"]);   //이름
            string phone = cc.NullToBlank(Request["phone"]); //전화번호
            string email = cc.NullToBlank(Request["email"]); //이메일
            string msg = cc.NullToBlank(Request["msg"]);     //문의내용
            string gub = cc.NullToBlank(Request["gub"]);     //구분

            string result = "";

            ht.Add("name", name);
            ht.Add("phone", phone);
            ht.Add("email", email);
            ht.Add("msg", cc.ChkParam(msg));

            result = insertContact(ht);

            if(result == "0")
            {
                Response.Write("<script>alert('정상적으로 등록되었습니다.');location.href='/';</script>");
                Response.End();
            }
            else
            {
                Response.Write("<script>alert('등록중 문제가 생겼습니다..');location.href='/';</script>");
                Response.End();
            }
           
            return reval;
        }

        private string insertContact(Hashtable ht)
        {
            string reval = "";
            StringBuilder sb = new StringBuilder();
            DBConn db = new DBConn();


            string result = "";

            try
            {
                sb.AppendLine(" INSERT into hope20603.CONTACT (   ");
                sb.AppendLine("     seq               ");
                sb.AppendLine("     , seq2            ");
                sb.AppendLine("     , name            ");
                sb.AppendLine("     , phone           ");
                sb.AppendLine("     , email           ");
                sb.AppendLine("     , msg             ");
                sb.AppendLine("     , time            ");
                sb.AppendLine("     , date )          ");
                sb.AppendLine(" VALUES                ");
                sb.AppendLine(" (                     ");
                sb.AppendLine("     (select coalesce(max(seq),1)+1 from hope20603.contact )      ");
                sb.AppendLine("     , 1               ");
                sb.AppendLine("     , '@name'         ");
                sb.AppendLine("     , '@phone'        ");
                sb.AppendLine("     , '@email'        ");
                sb.AppendLine("     , '@msg'          ");
                sb.AppendLine("     , '@time'         ");
                sb.AppendLine("     , '@date'         ");
                sb.AppendLine(" )                     ");


                sb.Replace("@name", ht["name"].ToString());
                sb.Replace("@phone", ht["phone"].ToString());
                sb.Replace("@email", ht["email"].ToString());
                sb.Replace("@msg", ht["msg"].ToString());
                sb.Replace("@time", DateTime.Now.ToString("HHmm"));
                sb.Replace("@date", DateTime.Now.ToString("yyyyMMdd"));


                db.ExcuteNonQuery(sb.ToString());
                db.Close();

                reval = "0";
            }
            catch
            {
                reval = "-1";
            }
            finally
            {
                if (db != null)
                {
                    db.Close();
                    db = null;
                }
            }

            return reval;
        }
    }
}