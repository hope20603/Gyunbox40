using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace Gyunbox40.Common
{
    /// <summary>
    /// database 관련 함수
    /// </summary>
    public class DBConn
    {
        //1. 구성 파일로부터 데이터베이스 연결 문자열 얻기
        private string connectionString = ConfigurationManager.ConnectionStrings["GyunBox"].ConnectionString;
        public SqlConnection dbConn;

        #region asp.net 4.0 프로그래밍 참고
        //2. 생성자를 이용하여 생성과 동시에 데이터 접속
        public DBConn()
        {
            dbConn = new SqlConnection(connectionString);
            dbConn.Open();
        }

        //3.연결닫기
        public void Close()
        {
            dbConn.Close();
        }

        //4. 연결객체 반환 메서드
        public SqlConnection GetConn()
        {
            return dbConn;
        }

        //5. ExcuteNonQuery  실행
        //매개변수를 이용하지 않는 UPDATE, DELETE, INSERT문에서 사용
        public void ExcuteNonQuery(string queryString)
        {
            SqlCommand cmd = new SqlCommand(queryString, dbConn);
            cmd.ExecuteNonQuery();
        }

        //6. ExcuteReader 실행
        //매개변수를 이용하지 않는 SELECT문에서 사용
        public SqlDataReader ExcuteReader(string queryString)
        {
            SqlCommand cmd = new SqlCommand(queryString, dbConn);
            return cmd.ExecuteReader();
        }

        //7. ExcuteScalar 실행
        //첫 행의 첫 열을 객체로 반환
        public object ExecuteScalar(string queryString)
        {
            SqlCommand cmd = new SqlCommand(queryString, dbConn);
            return cmd.ExecuteScalar();
        }

        //8. 매개변수를 이용하지 않는 SELECT문에서 사용되며 결과를 dataSet으로 반환
        public DataSet ExecuteWithDataSet(string queryString)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(queryString, dbConn);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds;
        }

        //9. 매개변수를 이용하지 않는 SELECT문에서 사용되며 결과를 dataSet으로 반환 ( 테이블 명 지정 )
        public DataSet ExecuteWithDataSet(string queryString , string tblName)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(queryString, dbConn);
            DataSet ds = new DataSet();
            adapter.Fill(ds, tblName);
            return ds;
        }
        #endregion

        public string MSDBExcute(string sqlQuery)
        {
            SqlConnection scon = new SqlConnection(connectionString);
            SqlCommand scom = new SqlCommand();
            scom.Connection = scon;
            scom.CommandText = sqlQuery;
            scom.CommandTimeout = 8;
            scon.Open();

            SqlDataReader reader = scom.ExecuteReader();
            string resultStr = "";
            while (reader.Read())
            {
                resultStr += "email :: " + reader["email"] + " " + "pass :: " + reader["name"] + "</br>\n";
            } // 실사용시 패스워드는 꼭 암호화 하여 사용하자 '제발' //
            return resultStr;
        }

        public void MSDBExcute2(string sqlQuery)
        {
            SqlConnection scon = new SqlConnection(connectionString);
            SqlCommand scom = new SqlCommand();

            try
            {
                scom.Connection = scon;
                scom.CommandText = sqlQuery;
                scon.Open();
                scom.ExecuteNonQuery();
            }
            catch
            {
                scon.Close();
                scom.Dispose();
            }
            finally
            {
                if (scon != null)
                {
                    scon.Close();
                    scon = null;
                    scom.Dispose();
                }
            }

        }

        /// <summary>
        /// 쿼리 실행결과 데이터 셋으로 반환
        /// </summary>
        /// <param name="queryString"></param>
        /// <param name="tblName"></param>
        /// <returns></returns>
        public DataSet MsdbExcuteWithDataSet(string queryString, string tblName)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);
            DataSet ds = new DataSet();

            adapter.Fill(ds, tblName);

            return ds;
        }

    }
}