using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gyunbox40.Common
{
    public class CommonController
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

        /// <summary>
        /// sql injection 방지
        /// </summary>
        /// <param name="reqVal"></param>
        /// <returns></returns>
        public string ChkParam(object reqVal)
        {
            string reVal = "";
            if (reqVal != null)
            {
                reVal = reqVal.ToString();
                reVal = reVal.Replace("'", "''");
            }
            return reVal;
        }
    }
}