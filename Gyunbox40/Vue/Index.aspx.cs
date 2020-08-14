using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Newtonsoft.Json.Linq;
using Gyunbox40.Model;
using System.Text;
using System.Collections;
using System.Data;
using Gyunbox40.Common;

namespace Gyunbox40.Vue
{
    public partial class Index : System.Web.UI.Page
    {
        public string hostString = "";
        public string luckyPoint = "";
        public Hashtable htLucky = new Hashtable();
        public List<int> datas = new List<int>(); //행운의 번호 - 서버에서 제공해줄 번호!
        public Util util = new Util();
        CommonController cc = new CommonController();

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("Index_v2.aspx");
            Response.End();

            hostString = new Common.CommonController().hostString;
            
            //아래 내용은 캐시에 저장해서 속도를 향상 시킬 수 있음.
            if (HttpContext.Current.Application["LUCKY_POINT"] == null)
            {
                
                HttpContext.Current.Application["LUCKY_POINT"] = MakeHashtable();
                HttpContext.Current.Application["LUCKY_POINT_INSERT_TIME"] = DateTime.Now;
            }
            else
            {
                if(Convert.ToDateTime(HttpContext.Current.Application["LUCKY_POINT_INSERT_TIME"]) < DateTime.Now.AddHours(-1))
                {
                    HttpContext.Current.Application["LUCKY_POINT"] = MakeHashtable();
                    HttpContext.Current.Application["LUCKY_POINT_INSERT_TIME"] = DateTime.Now;
                }
                else
                {
                    htLucky = (Hashtable)HttpContext.Current.Application["LUCKY_POINT"];
                }
            }
            
            InsertLottoInfo();

            //행운의 번호에 대한 정책이 필요함..
            //영업기밀..
            //0. 우선은 비율을 가지고 와야함... 각 당첨번호가 얼마나 나왔는지 비율계산 ( 우선은 가중치를 통한 숫자 뽑기만 진행함 )
            //1. 얼마마다 번호를 생성할 것인가??? -> index.aspx 페이지가 새로고침 될때마다 생성함.  시간이 조금 걸릴 수 있어서 로딩창이 필요할 수 있음
            //2. 모든 회원에게 같은 번호를 지급할 것인가??? -> 아님
            //3. 로그인 하지 않으면.. 행운의 번호를 저장할 곳이 없음.. --> 행운의 번호는 저장하지 않음
            //4. 로그인 하지 않은 사용자에게도 행운의 번호는 제공해주어야 함... --> 오키
            //5. 모든 회원에게 행운의 번호를 동일하게 제공하는 것은 .. 별로임.. --> 오키
            //6. 새로고침 할때마다 행운의 번호를 계속 바꾸는 것도 별로임... --> 행운의 번호를 계속 바꿀 예정임
            //7. 행운의 번호를 쿠키로 구워뒀다가.. 계속 사용함...--> 별로임->쿠키가 남음...
            //8 -> index 페이지에서 행운의 번호를 생성하고... createNumber에서는 행운의 번호를 가지고 와서 사용만 하면됨 --session에 담아두고 사용하면 됨.

            if (util.NullToBlank(cc.g_PUSH_NUM) == "")
            {
                GetLuckyNumber();
            }
            else
            {
                //string[] tmp = cc.g_PUSH_NUM.Split('|');
                datas = cc.g_PUSH_NUM.Split('|').Select(Int32.Parse).ToList();
            }

            //GetRandom();
        }

        /// <summary>
        /// 추천할 번호 7개를 가져온다.
        /// 그동안 나왔던 비중을 토대로 숫자를 만들어옴-사실 큰 의미는 없음..
        /// </summary>
        public void GetLuckyNumber()
        {
            Util util = new Util();
            //Dictionary<int, int> datas = new Dictionary<int, int>();
            
            DaDdogram daDdo = new DaDdogram();
            DataSet ds = daDdo.GetLuckyNumber(); //비중을 가지고 옴
            float[] inputNumbers = new float[45];
            
            //로또 번호의 비중치를 넣어준다.
            if (!util.ChkDsIsNull(ds))
            {
                for(int i=0; i<ds.Tables[0].Rows.Count; i++)
                {
                    inputNumbers[i] = ((float)Convert.ToDouble(ds.Tables[0].Rows[i]["DDOWGT"])) * 100;
                }
            }

            float sumVal = 0;
            for(int i=0; i<inputNumbers.Length; i++)
            {
                sumVal += inputNumbers[i];
            }

            //겹치는 숫자는 제외하고 보너스 번호를 포함해서 총 7개 번호를 뽑는다.
            //마지막 번호를 보너스 번호로 두고, 나머지는 정렬해서 사용.

            int getNumberCount = 7;

            while(getNumberCount > 0)
            {
                Random seedOfSeed = new Random();
                int seedInt = seedOfSeed.Next(0, 100);
                Random seedRnd = new Random((int)DateTime.Now.Ticks + getNumberCount + seedInt); //단순히 중복된 seed를 피하기위함임.
                
                int returnValue = GetLottoNumber(inputNumbers, seedRnd);
                if(datas.Contains(returnValue) == false)
                {
                    datas.Add(returnValue);
                    getNumberCount--;
                }
            }

            int bonusNum = datas[6];
            datas.RemoveAt(6);
            datas.Sort();
            datas.Add(bonusNum);

            //문자열로 세션에 담아두고, CreateNumber.aspx 에서 고정할 번호에 동일하게 노출시켜 준다.
            cc.g_PUSH_NUM = string.Join("|",datas); //세션에 집어넣어 주기

        }

        /// <summary>
        /// 제공된 비중에 따라서 로또번호를 뽑는다.
        /// 숫자 하나당 거의 1~2프로 정도의 확률을 가지고 있어서, 거의 랜덤으로 뽑는것과 동일한 확률이긴 함.
        /// </summary>
        /// <param name="inputDatas"></param>
        /// <param name="seedRnd"></param>
        /// <returns></returns>
        public int GetLottoNumber(float[] inputDatas, Random seedRnd)
        {
            float pivot = (float)seedRnd.NextDouble();
            float dr = pivot * 100.0f;
            //float dr = pivot/10;
            float cumulative = 0.0f;
            int reVal = 0;
            
            for(int i=0; i<inputDatas.Length; i++)
            {
                cumulative += inputDatas[i];
                if(dr <= cumulative)
                {
                    //reVal = 45 - i; break;
                    reVal = i+1; break;
                }
            }

            return reVal;
        }

        /// <summary>
        /// 차트에 사용할 해시테이블을 구성해준다.
        /// </summary>
        /// <returns></returns>
        public Hashtable MakeHashtable()
        {
            DaDdogram daddo = new DaDdogram();
            DataSet ds = daddo.GetLuckyPoint();

            if (!util.ChkDsIsNull(ds))
            {
                for (int i = 0; i < 45; i++)
                {
                    htLucky.Add("" + (i + 1) + "", ds.Tables[0].Rows[i]["CNT"].ToString());
                }
            }
            else
            {
                for (int i = 0; i < 45; i++)
                {
                    htLucky.Add("" + i + "", "0");
                }
            }

            return htLucky;
        }

        /// <summary>
        /// 추첨이 이루어 지면 다음날에 해당데이터를 DB에 insert 해준다.
        /// --> 비중 조정이 이루어 져야함.
        /// </summary>
        public void InsertLottoInfo()
        {
            int nowTime = 898;

            string SDate = "2020-02-15";
            string EDate = DateTime.Now.ToString("yyyy-MM-dd");
            DateTime T1 = DateTime.Parse(SDate);
            DateTime T2 = DateTime.Parse(EDate);

            TimeSpan ts = T2 - T1;
            int diffDay = ts.Days;
            int dayPlus = diffDay / 7;
            nowTime += dayPlus;

            DaDdogram daddo = new DaDdogram();

            if (diffDay % 7 == 1) //당첨일 다음날 해당데이터를 insert 해줌
            {
                daddo.InsertLottoNumber(nowTime.ToString());
            }
        }
        /// <summary>
        /// 참고 소스
        /// </summary>
        /// <param name="inputDatas"></param>
        /// <param name="seed"></param>
        /// <returns></returns>
        public float GetRandomNumber(float[] inputDatas, int seed)
        {
            Random random = new Random(seed);
            //rand.Next(); //음수가 아닌 임의의 정수를 반환
            //rand.Next(n); n보다 작은 음수가 아닌 임의의 정수를 반환 0~n-1 사이의 값을 반환
            //rand.Next(n,m); n보다 같거나 크며 m보다 작은 음수가 아닌 임의의 정수를 반환 n~m-1 사이의 값을 반환
            //rand.NextDouble() 0.0과 1.0사이의 임의의 부동 소수점 난수를 반환
            //  Byte[] array=new Byte[10] rand.NextBytes(array);  byte형식의 배열에 난수를 채운다. 


            float total = 0;

            //float[] probs = new float[] { 10f, 20f, 30f, 40f, 50f };

            for (int i = 0; i < inputDatas.Length; i++)
            {
                total += inputDatas[i];
            }
            
            float pivot = (float)random.NextDouble() * total; 

            for (int i = 0; i < inputDatas.Length; i++)
            {
                if (pivot < inputDatas[i])
                {
                    return inputDatas[i];
                }
                else
                {
                    pivot -= inputDatas[i];
                }
            }
            return inputDatas[inputDatas.Length - 1];

        }

        /// <summary>
        /// 참고소스
        /// </summary>
        public void GetRandom()
        {
            Dictionary<float, int> datas = new Dictionary<float, int>();

            float[] probs = new float[] { 10f, 20f, 30f, 40f, 50f };

            int tryNum = 500000;

            Random seedRnd = new Random();
            int startIndex = seedRnd.Next(); //음수가 아닌 임의의 정수를 반환

            for (int i = startIndex; i < startIndex + tryNum; i++)
            {
                float returnValue = GetRandomNumber(probs, i);

                //해당 숫자가 처음 뽑혔을 경우
                if (datas.ContainsKey(returnValue) == false)
                {
                    datas.Add(returnValue, 1);
                }
                //해당 숫자가 이미 있는 경우
                else
                {
                    datas[returnValue]++;
                }
            }

            System.Diagnostics.Debug.WriteLine(string.Format("시행 횟수 : {0}", tryNum));

            List<float> keys = datas.Keys.ToList();
            keys.Sort();

            for (int i = 0; i < keys.Count; i++)
            {
                System.Diagnostics.Debug.WriteLine(string.Format("{0}이 {1}번 나옴 비율 : {2}%", keys[i], datas[keys[i]], ((float)datas[keys[i]] / (float)tryNum) * 100f));
            }
        }

    }
}