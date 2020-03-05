using Gyunbox40.Common;
using Microsoft.ApplicationBlocks.Data;
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
        public DataSet GetLoginInfo(string userId, string userPwd)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();

            sb.AppendLine("select * from hope20603.DDOMEM where uid='@userID' and pwd='@userPwd' ;");
            sb.Replace("@userID", util.ChkInjection(userId));
            sb.Replace("@userPwd", util.ChkInjection(userPwd));

            ds = dbSql.ExecuteWithDataSet(sb.ToString(), "tbl_login");

            return ds;
        }

        /// <summary>
        /// 로또 당첨번호 DB에 입력하기
        /// 1주일마다 실행시켜줘야함
        /// </summary>
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
            catch
            {
                //string tmp = ex.ToString();
            }
            finally
            {
                dbSql.Close();
                dbSql = null;
            }

        }

        /// <summary>
        /// 각 번호별 추첨 횟수를 조회
        /// </summary>
        public DataSet GetLuckyPoint()
        {

            DataSet ds = null;
            
            string spName = "getDDONumberCnt";
            SqlConnection oCon = new SqlConnection(connectionString);
            
            try
            {
                ds = SqlHelper.ExecuteDataset(oCon, CommandType.StoredProcedure, spName);

            }
            catch
            {
                ds = null;
            }
            finally
            {
                if(ds != null)
                {
                    ds.Dispose();
                }
                
                if (oCon.State == ConnectionState.Open)
                    oCon.Close();

                oCon.Dispose();

            }

            return ds;
        }

        /// <summary>
        /// 로또 번호를 저장
        /// </summary>
        /// <param name="ht"></param>
        /// <returns></returns>
        public string SaveNewNumber(Hashtable ht)
        {
            string result = "OKK";
            StringBuilder sb = new StringBuilder();
            DBConn dbSql = new DBConn();

            try
            {
                sb.Clear();
                sb.AppendLine(" Insert Into HOPE20603.DDOMNB  ");
                sb.AppendLine("  ( userId, createdDate, num1, num2, num3, num4, num5, num6, num7 )");
                sb.AppendLine(" Values ");
                sb.AppendLine("  ( '@userId', '@createdDate', @num1, @num2, @num3, @num4, @num5, @num6, @num7 ); ");

                sb.Replace("@userId", ht["userId"].ToString());
                sb.Replace("@createdDate", ht["createdDate"].ToString());
                sb.Replace("@num1", ht["number_1"].ToString());
                sb.Replace("@num2", ht["number_2"].ToString());
                sb.Replace("@num3", ht["number_3"].ToString());
                sb.Replace("@num4", ht["number_4"].ToString());
                sb.Replace("@num5", ht["number_5"].ToString());
                sb.Replace("@num6", ht["number_6"].ToString());
                sb.Replace("@num7", ht["number_7"].ToString());

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
        /// 내가 저장한 번호를 가져옴
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataSet GetMyNumber(string userId)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            try
            {
                sb.AppendLine(" select IDX,                                                    ");
                sb.AppendLine("        userId,                                                 ");
                sb.AppendLine("        convert(varchar(10), createdDate, 120) as createdDate,  ");
                sb.AppendLine(" 	   num1,                                                   ");
                sb.AppendLine(" 	   num2,                                                   ");
                sb.AppendLine(" 	   num3,                                                   ");
                sb.AppendLine(" 	   num4,                                                   ");
                sb.AppendLine(" 	   num5,                                                   ");
                sb.AppendLine(" 	   num6,                                                   ");
                sb.AppendLine(" 	   num7                                                    ");
                sb.AppendLine(" from hope20603.DDOMNB                                          ");
                sb.AppendLine(" where userId = '@userID'                                       ");
                sb.AppendLine(" order by idx desc;                                             ");
                sb.Replace("@userID", userId);

                ds = dbSql.ExecuteWithDataSet(sb.ToString(), "tbl_myNumber");
            }
            catch
            {
                ds = null;
            }

            return ds;
        }
    }
}