using Gyunbox40.Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace Gyunbox40.Model
{
    public class DaDdogram
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["GyunBox"].ConnectionString;
        CommonController cc = new CommonController();
        DBConn dbSql = new DBConn();
        Util util = new Util();

        /// <summary>
        /// 사용중인 아이디 인지 체크
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataSet ChkUserId(string userId)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();

            sb.AppendLine("select * from hope20603.DDOMEM where uid='@userID'");
            sb.Replace("@userID", userId);

            ds = dbSql.ExecuteWithDataSet(sb.ToString(), "tbl_user");

            return ds;
        }

        /// <summary>
        /// 회원가입
        /// </summary>
        /// <param name="ht"></param>
        /// <returns></returns>
        public string UserRegister(Hashtable ht)
        {
            string result = "OKK";
            StringBuilder sb = new StringBuilder();
            DBConn dbSql = new DBConn();

            try
            {
                sb.AppendLine("insert into HOPE20603.DDOMEM  values('@UID', '@PWD', '@EML'); ");
                sb.Replace("@UID", util.ChkInjection(ht["UID"]));
                sb.Replace("@PWD", util.ChkInjection(ht["PWD"]));
                sb.Replace("@EML", util.ChkInjection(ht["EML"]));

                dbSql.ExcuteNonQuery(sb.ToString());
            }
            catch
            {
                result = "FAIL";
            }
            finally
            {
                dbSql.Close();
                dbSql = null;
            }

            return result;
        }

        /// <summary>
        /// 사용자 정보 불러오기 
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="userPwd"></param>
        /// <returns></returns>
        public DataSet UserLogin(string userId, string userPwd)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();

            sb.AppendLine("select * from hope20603.DDOMEM where uid='@userID' and pwd='@userPwd' ;");
            sb.Replace("@userID", util.ChkInjection(userId));
            sb.Replace("@userPwd", util.ChkInjection(userPwd));

            ds = dbSql.ExecuteWithDataSet(sb.ToString(), "tbl_login");

            return ds;
        }
    }
}