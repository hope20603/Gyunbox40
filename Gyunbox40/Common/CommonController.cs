using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;

namespace Gyunbox40.Common
{
    public class CommonController
    {
        //기본이 되는 호스트 url
        public string hostString = "";
        public string g_USER_ID { get { return GetSession("USER_ID"); } set { SetSession("USER_ID", value); } }                    // 사용자 아이디
        public string g_PUSH_NUM { get { return GetSession("PUSH_NUM"); } set { SetSession("PUSH_NUM", value); } }                    // 행운의번호

        private HttpRequest iRequest = null;
        private HttpResponse iResponse = null;
        private HttpRequestBase bRequest = null;
        private HttpResponseBase bResponse = null;

        /// <summary>
        /// 생성자에서 기본 셋팅처리
        /// </summary>
        public CommonController()
        {
#if (DEBUG != true)
            hostString = ConfigurationManager.AppSettings["REAL_HOST"].ToString();
#else
            hostString = ConfigurationManager.AppSettings["DEBUG_HOST"].ToString();
#endif

        }

        /// <summary>
        /// Null 인지 Blank인지 여부 체크
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

        public string CookieRead(string key)
        {
            if (iRequest != null)
            {
                if (iRequest.Cookies[key] == null)
                    iResponse.Cookies[key].Value = null;

                return iRequest.Cookies[key].Value;
            }
            else if (bRequest != null)
            {
                if (bRequest.Cookies[key] == null)
                    bResponse.Cookies[key].Value = null;

                return bRequest.Cookies[key].Value;
            }
            else
            {
                
                if (HttpContext.Current.Request.Cookies[key] == null)
                    HttpContext.Current.Response.Cookies[key].Value = null;

                return HttpContext.Current.Request.Cookies[key].Value;
            }
        }

        public void CookieWrite(string key, string value)
        {
            
            if (iResponse != null)
            {
                iResponse.Cookies[key].Value = value;
                iRequest.Cookies[key].Value = value;
            }
            else if (bResponse != null)
            {
                bResponse.Cookies[key].Value = value;
                bRequest.Cookies[key].Value = value;
            }
            else
            {
                HttpContext.Current.Response.Cookies[key].Value = value;
                HttpContext.Current.Request.Cookies[key].Value = value;
            }
            
        }

        public void CookieDelete(string key)
        {
            //HttpCookie c = HttpContext.Request.Cookies["KALTOUR"];
            //c.Values.Remove(key);
            //c.Expires = DateTime.Now.AddDays(1);
            //c.Path = "/";
            //HttpContext.Response.Cookies.Add(c);
            if (iRequest != null)
            {
                iResponse.Cookies[key].Value = null;
                iRequest.Cookies[key].Value = null;
            }
            else if (bRequest != null)
            {
                bResponse.Cookies[key].Value = null;
                bRequest.Cookies[key].Value = null;
            }
            else
            {
                HttpContext.Current.Response.Cookies[key].Value = null;
                HttpContext.Current.Request.Cookies[key].Value = null;
            }
        }

        public void SetSession(string sessionKey, string value)
        {
            HttpContext.Current.Session[sessionKey] = value;
        }

        public string GetSession(string sessionKey)
        {
            if (HttpContext.Current.Session == null || HttpContext.Current.Session[sessionKey] == null || HttpContext.Current.Session[sessionKey].ToString().Length == 0)
                return "";
            else
                return HttpContext.Current.Session[sessionKey].ToString();
        }

        public static bool CheckSession(string sessionKey)
        {
            if (HttpContext.Current.Session == null || HttpContext.Current.Session[sessionKey] == null || HttpContext.Current.Session[sessionKey].ToString().Length == 0) //세션없음
                return false;
            else
                return true;
        }

        public static string GetSessionValue(string sessionKey)
        {
            return HttpContext.Current.Session[sessionKey].ToString();
        }

        // SHA256  256bit 암호화 - kaldev에서 복사
        public string ComputeHash(string input)
        {
            System.Security.Cryptography.SHA256 algorithm = System.Security.Cryptography.SHA256Managed.Create();
            Byte[] inputBytes = Encoding.UTF8.GetBytes(input);
            Byte[] hashedBytes = algorithm.ComputeHash(inputBytes);

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < hashedBytes.Length; i++)
            {
                sb.Append(String.Format("{0:x2}", hashedBytes[i]));
            }


            return sb.ToString();
        }
    }
}