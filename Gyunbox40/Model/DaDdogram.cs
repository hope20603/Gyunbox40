using Dapper;
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

        //Repository 역할
        private string connectionString = ConfigurationManager.ConnectionStrings["GyunBox"].ConnectionString;
        //Dapper도 사용해 보자
        private IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["GyunBox"].ConnectionString);

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
        /// 회차별 1등 당첨 가게 목록을 가져온다.
        /// </summary>
        /// <param name="lot_seq"></param>
        /// <returns></returns>
        public DataSet GetStores(string lot_seq)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();

            try
            {
                sb.AppendLine("select * from hope20603.lot_store where seq=@seq;");
                sb.Replace("@seq", util.ChkInjection(lot_seq));

                ds = dbSql.ExecuteWithDataSet(sb.ToString(), "tbl_stores");
            }
            catch
            {
                ds = null;
            }
            finally
            {
                if (dbSql != null)
                {
                    dbSql.Close();
                    //dbSql = null;
                }
            }

            return ds;
        }

        /// <summary>
        /// 가게 정보 불러오기
        /// </summary>
        /// <param name="locNumber"></param>
        /// <returns></returns>
        public LotStore GetStoreDetail(string locNumber)
        {
            string sqlQuery = string.Empty;

            try
            {
                sqlQuery = @" select store_name, store_add, store_loc,(select count(seq) from hope20603.lot_store where store_loc=@store_loc) as wincnt from (
                            	select top 1 *  from hope20603.lot_store where store_loc=@store_loc order by seq desc
                              ) as a";
                return this.db.QueryFirstOrDefault<LotStore>(sqlQuery, new { store_loc=locNumber });
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 제일 최신 추첨일 seq를 가져 온다.
        /// </summary>
        /// <returns></returns>
        public int GetRecentLotSeq()
        {
            string sqlQuery = string.Empty;
            int result = -1;
            
            try
            {
                sqlQuery = @"Select max(seq) from hope20603.lot_num;";
                var data = dbSql.ExecuteScalar(sqlQuery);
                if (data != null) result = Convert.ToInt32(data);
            }
            catch
            {
                result = -1;
            }
            finally
            {
                if (dbSql != null)
                {
                    dbSql.Close();
                }
            }

            return result;
        }

        /// <summary>
        /// 제일 최신 추첨일 seq를 가져 온다.-dapper사용해봄..
        /// </summary>
        /// <returns></returns>
        public LotnumModel GetRecentLotNum()
        {
            string sqlQuery = string.Empty;
            
            try
            {
                sqlQuery = @"Select top 1 [seq],[num1],[num2],[num3],[num4],[num5],[num6],[num7]
                            ,convert(char(10), [win_date], 23) as win_date
                            ,[total_sel] from hope20603.lot_num order by seq desc";
                return this.db.QueryFirstOrDefault<LotnumModel>(sqlQuery);
            }
            catch
            {
                return null;    
            }
            
            
        }

        /// <summary>
        /// 특정 회차의 당첨번호 정보를 가져옴. -dapper사용해봄..
        /// </summary>
        /// <returns></returns>
        public LotnumModel GetLotNumBySeq(string seq)
        {
            string sqlQuery = string.Empty;

            try
            {
                sqlQuery = @"Select [seq],[num1],[num2],[num3],[num4],[num5],[num6],[num7]
                            ,convert(char(10), [win_date], 23) as win_date
                            ,[total_sel] from hope20603.lot_num Where seq=@seq";
                return this.db.QueryFirstOrDefault<LotnumModel>(sqlQuery,new { seq = int.Parse(seq) });
            }
            catch(Exception e)
            {
                return null;
            }
        }

        /// <summary>
        /// 모든 당첨번호 정보를 가져옴. -dapper 짱나서 안씀..
        /// </summary>
        /// <returns></returns>
        public DataSet GetLotNumAll()
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();

            try
            {
                sb.AppendLine("select [seq],[num1],[num2],[num3],[num4],[num5],[num6],[num7] ");
                sb.AppendLine(" , convert(char(10), [win_date], 23) as win_date ");
                sb.AppendLine(" ,[total_sel] from hope20603.lot_num order by seq desc;");
                
                ds = dbSql.ExecuteWithDataSet(sb.ToString(), "tbl_lot");
            }
            finally
            {
                if (dbSql != null)
                {
                    dbSql.Close();
                    dbSql = null;
                }
            }

            return ds;
        }

        /// <summary>
        /// 모든 당첨번호 정보를 가져옴. -Dapper
        /// </summary>
        /// <returns></returns>
        public List<LotnumModel> GetLotNumAllModel()
        {
            StringBuilder sb = new StringBuilder();
            
            try
            {
                sb.AppendLine("select [seq],[num1],[num2],[num3],[num4],[num5],[num6],[num7] ");
                sb.AppendLine(" , convert(char(10), [win_date], 23) as win_date ");
                sb.AppendLine(" ,[total_sel] from hope20603.lot_num order by seq desc;");

                return db.Query<LotnumModel>(sb.ToString()).ToList();
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 등수별 당첨정보
        /// </summary>
        /// <param name="seq"></param>
        /// <returns></returns>
        public List<LotWinner> GetWinnerInfo(string seq)
        {
            string sql = string.Empty;
            try
            {
                sql = @"  SELECT ORD, PRIZE_1_CNT AS CNT, MNY_1 AS MNY FROM (
                            SELECT 1 as ord, prize_1_cnt, mny_1 FROM lot_win WHERE seq=@seq
                            UNION 
                            SELECT 2 as ord, prize_2_cnt, mny_2 FROM lot_win WHERE seq=@seq
                            UNION 
                            SELECT 3 as ord, prize_3_cnt, mny_3 FROM lot_win WHERE seq=@seq
                            UNION 
                            SELECT 4 as ord, prize_4_cnt, mny_4 FROM lot_win WHERE seq=@seq
                            UNION 
                            SELECT 5 as ord, prize_5_cnt, mny_5 FROM lot_win WHERE seq=@seq
                          ) AS winner";
                return db.Query<LotWinner>(sql, new { seq=seq }).ToList();
            }
            catch
            {
                return null;
            }
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

            try
            {
                sb.AppendLine("select * from hope20603.DDOMEM where uid='@userID' and pwd='@userPwd' ;");
                sb.Replace("@userID", util.ChkInjection(userId));
                sb.Replace("@userPwd", util.ChkInjection(userPwd));

                ds = dbSql.ExecuteWithDataSet(sb.ToString(), "tbl_login");
            }
            finally
            {
                if(dbSql != null)
                {
                    dbSql.Close();
                    dbSql = null;
                }
            }

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

                for (int i = 902; i < 922; i++)
                {
                    //string URL = "https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + i;
                    string URL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=" + i;
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
        /// 특정 회차의 정보를 DB에 insert 해준다.
        /// </summary>
        /// <param name="targetNumber"></param>
        public void InsertLottoNumber(string targetNumber)
        {
            DBConn dbSql = new DBConn();
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            Util util = new Util();

            try
            {
                sb.Append(" select * from hope20603.ddonum where drwNo=@drwNo ");
                sb.Replace("@drwNo", targetNumber);
                ds = dbSql.ExecuteWithDataSet(sb.ToString());

                if (util.ChkDsIsNull(ds))
                {
                    //string URL = "https://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + targetNumber;
                    string URL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=" + targetNumber;

                    using (var webClient = new System.Net.WebClient())
                    {
                        var myJsonString = webClient.DownloadString(URL);

                        var jo = JObject.Parse(myJsonString);

                        if(jo.GetValue("returnValue").ToString() != "fail")
                        {
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

                            sb.Clear();
                            sb.AppendLine(" insert into hope20603.lot_num   ");
                            sb.AppendLine(" values(                         ");
                            sb.AppendLine(drwNo + ",");
                            sb.AppendLine(drwtNo1 + ",");
                            sb.AppendLine(drwtNo2 + ",");
                            sb.AppendLine(drwtNo3 + ",");
                            sb.AppendLine(drwtNo4 + ",");
                            sb.AppendLine(drwtNo5 + ",");
                            sb.AppendLine(drwtNo6 + ",");
                            sb.AppendLine(bnusNo + ",");
                            sb.AppendLine(drwNoDate + ",");
                            sb.AppendLine(totSellamnt);
                            sb.AppendLine(" ); ");

                            dbSql.ExcuteNonQuery(sb.ToString());
                        }

                        

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
        /// 메인페이지에서 사용할 데이터를 가지고 온다
        /// 번호별 당첨횟수, max값 기준 percent
        /// num, cnt, per
        /// </summary>
        /// <returns></returns>
        public DataSet GetWainChartData()
        {
            DataSet ds = new DataSet();
            DataSet ds2= new DataSet();

            string spName = "sp_GetMainChart";
            SqlConnection oCon = new SqlConnection(connectionString);

            try
            {
                //ds.Merge(dbSql.ExecuteWithDataSet(oCon, CommandType.StoredProcedure, spName, new SqlParameter("@INCLUDE_BONUS", 1)));
                ds = SqlHelper.ExecuteDataset(oCon, CommandType.StoredProcedure, spName, new SqlParameter("@INCLUDE_BONUS", 0));
                ds.Tables[0].TableName = "tbl_0";
                ds2 = SqlHelper.ExecuteDataset(oCon, CommandType.StoredProcedure, spName, new SqlParameter("@INCLUDE_BONUS", 1));
                ds2.Tables[0].TableName = "tbl_1";
                ds.Merge(ds2);

            }
            catch(Exception e)
            {
                ds = null;
            }
            finally
            {
                if (ds != null)
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
                if(dbSql != null)
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
        public DataSet GetMyNumber(string userId , int start, int end)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            try
            {
                sb.AppendLine(" select * from (                                                    ");
                sb.AppendLine("     select IDX,                                                    ");
                sb.AppendLine("            Row_Number() over(order by idx desc) as rowNum,         ");
                sb.AppendLine("     	   userId,                                                 ");
                sb.AppendLine("     	   convert(varchar(10), createdDate, 120) as createdDate,  ");
                sb.AppendLine("     	   num1,                 ");
                sb.AppendLine("     	   num2,                 ");
                sb.AppendLine("     	   num3,                 ");
                sb.AppendLine("     	   num4,                 ");
                sb.AppendLine("     	   num5,                 ");
                sb.AppendLine("     	   num6,                 ");
                sb.AppendLine("     	   num7                  ");
                sb.AppendLine("     from hope20603.DDOMNB        ");
                sb.AppendLine("     where userId = '@userID'      ");
                sb.AppendLine(" ) as a where rowNum >= @start and rowNum < @end   ;");

                sb.Replace("@userID", userId);
                sb.Replace("@start", start.ToString());
                sb.Replace("@end", end.ToString());

                ds = dbSql.ExecuteWithDataSet(sb.ToString(), "tbl_myNumber");
            }
            catch
            {
                ds = null;
            }
            finally
            {
                if (dbSql != null)
                {
                    dbSql.Close();
                    dbSql = null;
                }
            }

            return ds;
        }

        /// <summary>
        /// 내가 저장한 번호를 가져옴
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataSet GetMyNumberCount(string userId)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            
            try
            {
                
                sb.AppendLine("     select count(IDX) as cnt     ");
                sb.AppendLine("     from hope20603.DDOMNB        ");
                sb.AppendLine("     where userId = '@userID'     ");
                sb.Replace("@userID", userId);
                
                ds = dbSql.ExecuteWithDataSet(sb.ToString(), "tbl_myNumberCount");
            }
            catch
            {
                ds = null;
            }
            finally
            {
                if(dbSql != null)
                {
                    dbSql.Close();
                    dbSql = null;
                }
            }

            return ds;
        }

        /// <summary>
        /// idx로 특정 번호 삭제
        /// </summary>
        /// <param name="idx"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public int DeleteMyNumber(string idx, string userId)
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            SqlConnection oCon = new SqlConnection(connectionString);

            int result = 0;

            try
            {
                sb.Clear();
                sb.AppendLine("     delete                       ");
                sb.AppendLine("     from hope20603.DDOMNB        ");
                sb.AppendLine("     where userId = '@userID' and idx=@idx ");
                sb.Replace("@userID", userId);
                sb.Replace("@idx", idx);

                result = SqlHelper.ExecuteNonQuery(oCon, CommandType.Text, sb.ToString()); 

            }
            catch
            {
                result = -1;
            }
            finally
            {
                oCon = null;
            }

            return result;
            
        }

        /// <summary>
        /// 로또 번호별 비중을 가지고 온다.
        /// </summary>
        /// <returns></returns>
        public DataSet GetLuckyNumber()
        {
            DataSet ds = null;

            string spName = "setAndGetDDONumber";
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
                if (ds != null)
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
        /// 방문자 더하기
        /// </summary>
        public static void AddVisitor()
        {
            StringBuilder sb = new StringBuilder();
            DBConn dbSql = new DBConn();

            try
            {
                sb.AppendLine(" Select Count(*) from hope20603.lot_visit Where Today='@today';");
                sb.Replace("@today", DateTime.Now.ToString("yyyyMMdd"));
                var data = dbSql.ExecuteScalar(sb.ToString());

                sb.Clear();
                if (Convert.ToInt32(data) == 0)
                {
                    //오늘 첫 방문자
                    sb.Append(" INSERT INTO hope20603.LOT_VISIT VALUES ( '@today', 1); ");
                    sb.Replace("@today", DateTime.Now.ToString("yyyyMMdd"));
                }
                else
                {
                    sb.Append(" UPDATE hope20603.LOT_VISIT SET VISITOR_COUNT=VISITOR_COUNT+1 WHERE TODAY='@today'; ");
                    sb.Replace("@today", DateTime.Now.ToString("yyyyMMdd"));
                }

                dbSql.MSDBExcute(sb.ToString());

            }
            catch
            {
            }
            finally
            {
                if (dbSql != null)
                    dbSql.Close();
                dbSql = null;
            }

        }

        /// <summary>
        /// 전체 방문자 수 
        /// </summary>
        public static int GetTotalVisitor()
        {
            StringBuilder sb = new StringBuilder();
            DBConn dbSql = new DBConn();
            int visitors = 0;

            try
            {
                sb.AppendLine(" Select Sum(Visitor_Count) from hope20603.lot_visit;");
                visitors = Convert.ToInt32(dbSql.ExecuteScalar(sb.ToString()));
            }
            catch
            {
                return 0;
            }
            finally
            {
                if (dbSql != null)
                    dbSql.Close();
                dbSql = null;
            }

            return Convert.ToInt32(visitors);

        }

        /// <summary>
        /// 오늘 방문자 수 
        /// </summary>
        public static int GetTodayVisitor()
        {
            StringBuilder sb = new StringBuilder();
            DBConn dbSql = new DBConn();
            int visitors = 0;

            try
            {
                sb.AppendLine(" Select Sum(Visitor_Count) from hope20603.lot_visit where today='@today';");
                sb.Replace("@today", DateTime.Now.ToString("yyyyMMdd"));
                visitors = Convert.ToInt32(dbSql.ExecuteScalar(sb.ToString()));
            }
            catch
            {
                return 0;
            }
            finally
            {
                if (dbSql != null)
                    dbSql.Close();
                dbSql = null;
            }

            return Convert.ToInt32(visitors);

        }

        public bool CheckExistDrwNo(string nowTime)
        {
            string sql = "select count(drwno) from hope20603.ddonum where drwno=@drwno";
            int count = Convert.ToInt32(db.ExecuteScalar(sql, new { drwno = nowTime }));
            if (count == 0) return false;
            else return true;
        }

        /// <summary>
        /// 아이디 , 이메일로 패스워드 찾기
        /// </summary>
        /// <param name="uid"></param>
        /// <param name="eml"></param>
        /// <returns></returns>
        public LotUser GetUserPwd(string uid, string eml)
        {
            string sql = "select * from hope20603.ddomem where uid=@uid and eml=@eml";
            //db.Query<LotUser>(sql, new { id = uid, eml = eml }).SingleOrDefault();
            return db.QuerySingleOrDefault<LotUser>(sql, new { uid = uid, eml = eml });
        }

        /// <summary>
        /// 로그인 할때마다 로그를 남겨보자
        /// </summary>
        /// <param name="refUrl"></param>
        /// <param name="uid"></param>
        public void SetLoginLog(string refUrl, string uid)
        {
            string sql = "insert into hope20603.ddolog values ( @uid, @ref_url, getdate());";
            try
            {
                db.Execute(sql, new { uid = uid, ref_url = refUrl });
            }
            catch
            {
                //에러만 안나게 처리..
            }
        }
    }
}