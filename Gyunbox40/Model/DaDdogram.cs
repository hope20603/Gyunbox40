using Gyunbox40.Common;
using Newtonsoft.Json.Linq;
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

        public void InsertLottoNumber()
        {
            DBConn dbSql = new DBConn();
            StringBuilder sb = new StringBuilder();

            try
            {

                for (int i = 1; i < 900; i++)
                {
                    string URL = "https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + i;
                    using (var webClient = new System.Net.WebClient())
                    {
                        var myJsonString = webClient.DownloadString(URL);

                        var jo = JObject.Parse(myJsonString);

                        string drwNo = jo.GetValue("drwNo").ToString();
                        string totSellamnt = jo.GetValue("totSellamnt").ToString();
                        string returnValue = jo.GetValue("returnValue").ToString();
                        string drwNoDate = jo.GetValue("drwNoDate").ToString();
                        string firstWinamnt = jo.GetValue("firstWinamnt").ToString();
                        string firstPrzwnerCo = jo.GetValue("firstPrzwnerCo").ToString();
                        string drwtNo1 = jo.GetValue("drwtNo1").ToString();
                        string drwtNo2 = jo.GetValue("drwtNo2").ToString();
                        string drwtNo3 = jo.GetValue("drwtNo3").ToString();
                        string drwtNo4 = jo.GetValue("drwtNo4").ToString();
                        string drwtNo5 = jo.GetValue("drwtNo5").ToString();
                        string drwtNo6 = jo.GetValue("drwtNo6").ToString();
                        string bnusNo = jo.GetValue("bnusNo").ToString();


                        sb.Clear();
                        sb.AppendLine("insert into hope20603.DDONUM  ");
                        sb.AppendLine("values( ");
                        sb.AppendLine(drwNo + ",");
                        sb.AppendLine(totSellamnt + ",");
                        sb.AppendLine("'" + returnValue + "',");
                        sb.AppendLine("'" + drwNoDate + "',");
                        sb.AppendLine(firstWinamnt + ",");
                        sb.AppendLine(firstPrzwnerCo + ",");
                        sb.AppendLine(drwtNo1 + ",");
                        sb.AppendLine(drwtNo2 + ",");
                        sb.AppendLine(drwtNo3 + ",");
                        sb.AppendLine(drwtNo4 + ",");
                        sb.AppendLine(drwtNo5 + ",");
                        sb.AppendLine(drwtNo6 + ",");
                        sb.AppendLine(bnusNo);
                        sb.AppendLine(")");

                        dbSql.ExcuteNonQuery(sb.ToString());

                        //{ "Arithmetic overflow error converting expression to data type int.
                        //\r\nThe statement has been terminated."}
                    }
                }

            }
            catch (Exception ex)
            {
                string tmp = ex.ToString();
            }
            finally
            {
                dbSql.Close();
                dbSql = null;
            }

        }
    }
}