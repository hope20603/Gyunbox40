using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace Gyunbox40.Common
{
    public class Util
    {
        /// <summary>
        /// Null 또는 Blank인지 여부 체크
        /// </summary>
        /// <param name="checkVal">오브젝트 값</param>
        /// <returns></returns>
        public bool IsNullBlank(object checkVal)
        {
            if (checkVal == null)
            {
                return true;
            }
            else if (checkVal == DBNull.Value)
            {
                return true;
            }
            else if (checkVal.ToString().Trim().Equals(""))
            {
                return true;
            }
            else if (checkVal.ToString().Trim().Equals("&nbsp;"))
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// 널값 체크 후 스트링으로 반환
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public string NullToBlank(object obj)
        {
            if (obj == null)
            {
                return "";
            }
            else if (obj == DBNull.Value)
            {
                return "";
            }
            else if (obj.ToString().Trim().Equals(""))
            {
                return "";
            }
            else if (obj.ToString().Equals("&nbsp;"))
            {
                return "";
            }
            return obj.ToString().Trim();
        }

        /// <summary>
        /// 널값 체크 후 int형으로 변환
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public int NullToZero(object obj)
        {
            if (obj == null)
            {
                return 0;
            }
            else if (obj == DBNull.Value)
            {
                return 0;
            }
            else if (obj.ToString().Trim().Equals(""))
            {
                return 0;
            }
            else if (obj.ToString().Equals("&nbsp;"))
            {
                return 0;
            }
            return Convert.ToInt32(obj);
        }


        public static bool IsNullOrBlank(object obj)
        {
            if(obj == null || obj.ToString() == "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// sql injection 체크
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public string ChkInjection(object obj)
        {
            string reVal = "";

            if (obj != null)
                reVal = obj.ToString();

            if (reVal == "")
            {
                reVal = reVal.Replace("'", "");
                reVal = reVal.Replace("--", "");
                reVal = reVal.Replace("--, #", " ");
                reVal = reVal.Replace("/* */", " ");
                reVal = reVal.Replace("' or 1=1--", " ");
                reVal = reVal.Replace("union", " ");
                reVal = reVal.Replace("select", " ");
                reVal = reVal.Replace("delete", " ");
                reVal = reVal.Replace("insert", " ");
                reVal = reVal.Replace("update", " ");
                reVal = reVal.Replace("drop", " ");
                reVal = reVal.Replace("on error resume", " ");
                reVal = reVal.Replace("execute", " ");
                reVal = reVal.Replace("windows", " ");
                reVal = reVal.Replace("boot", " ");
                reVal = reVal.Replace("-1 or", " ");
                reVal = reVal.Replace("-1' or", " ");
                reVal = reVal.Replace("../", " ");
                reVal = reVal.Replace("unexisting", " ");
                reVal = reVal.Replace("win.ini", " ");
            }

            return reVal;
        }


        /// <summary>
        /// 빈 테이블인 경우 true를 리턴
        /// </summary>
        /// <param name="ds"></param>
        /// <returns></returns>
        public bool ChkDsIsNull(DataSet ds)
        {
            if(ds!=null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// DataTable을 Json형태의 String으로 리턴
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public string GetJsonFromDataSet(DataTable table)
        {
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }

        /// <summary>
        /// DataTable을 Json형태의 String으로 리턴, count와 
        /// </summary>
        /// <param name="ds"></param>
        /// <param name="req_name"></param>
        /// <param name="data_obj_name"></param>
        /// <returns></returns>
        public string GetJsonFromDataSet(DataSet ds, String req_name, String data_obj_name)
        {
            StringBuilder jsonString = new StringBuilder();
            StringBuilder jsonHeaderString = new StringBuilder();
            StringBuilder jsonBodyString = new StringBuilder();

            jsonString.Append("{");

            int total_count = 0;

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                // 조회된 ds 전체 데이터 개수
                total_count = ds.Tables[0].Rows.Count;

                // 배열 시작
                jsonBodyString.Append("[");

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    jsonBodyString.Append("{");
                    for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
                    {
                        if (j < ds.Tables[0].Columns.Count - 1)
                        {
                            jsonBodyString.Append("\"" + ds.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + convertSpecialCharForJsonString(ds.Tables[0].Rows[i][j].ToString()) + "\",");
                        }
                        else if (j == ds.Tables[0].Columns.Count - 1)
                        {
                            jsonBodyString.Append("\"" + ds.Tables[0].Columns[j].ColumnName.ToString() + "\":" + "\"" + convertSpecialCharForJsonString(ds.Tables[0].Rows[i][j].ToString()) + "\"");
                        }
                    }

                    if (i == ds.Tables[0].Rows.Count - 1)
                    {
                        jsonBodyString.Append("}");
                    }
                    else
                    {
                        jsonBodyString.Append("},");
                    }
                }
                jsonBodyString.Append("]");
            }

            jsonHeaderString.Append("\"req_name\":" + "\"" + req_name + "\",");
            jsonHeaderString.Append("\"total_count\":" + "\"" + total_count.ToString() + "\"");

            if (string.IsNullOrEmpty(jsonBodyString.ToString()) == false)
            {
                // 결과 데이터 객체 이름 지정
                if (string.IsNullOrEmpty(data_obj_name) == true)
                {
                    data_obj_name = "data";
                }

                jsonHeaderString.Append(",\"" + data_obj_name + "\":").Append(jsonBodyString);
            }

            jsonString.Append(jsonHeaderString);
            jsonString.Append("}");

            return jsonString.ToString();

        }

        public string convertSpecialCharForJsonString(String str)
        {
            string tempStr = "";

            try
            {
                tempStr = str.ToString();

                // 공백기호 처리
                tempStr = tempStr.Replace("\t", "");
                tempStr = tempStr.Replace("\r", "");
                tempStr = tempStr.Replace("\n", "");

                // 태그, 역슬래시(\) 기호 처리
                tempStr = tempStr.Replace("<", "&lt;");
                tempStr = tempStr.Replace(">", "&gt;");
                tempStr = tempStr.Replace("\\", "\\\\");

                // 따옴표 처리
                tempStr = tempStr.Replace("\"", "\\\"");
                tempStr = tempStr.Replace("''", "\''");

                str = tempStr.ToString();
            }
            catch (Exception e)
            {
            }

            // 특수문자 치환 중 예외 발생시, 원래 문자열 반환
            return str;
        }

    }
}