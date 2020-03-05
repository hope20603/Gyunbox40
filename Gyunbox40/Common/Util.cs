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
        public string DataTableToJSONWithStringBuilder(DataTable table)
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

    }
}