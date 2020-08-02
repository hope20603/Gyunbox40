using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gyunbox40.Controller
{
    public class LottoController : Common.CommonController
    {
        /// <summary>
        /// 실수령액 리턴
        /// </summary>
        /// <param name="money"></param>
        /// <returns></returns>
        public double getRealGetMoney(double money)
        {
            // wMoney: 당첨금 wtaxmoney: 과세 대상금
            double revenuMoney = 0;
            double wMoney = money;
            double wTaxMoney = 0;
            wTaxMoney = wMoney - 1000; //게임비 제외한 금액이 과세 대상금

            double totalTax = 0;
            if (wMoney <= 50000)
            {
                revenuMoney = wMoney;
            }
            else if (50000 < wMoney && wMoney <= 300000000)
            {
                totalTax = Math.Round(wTaxMoney * 0.22);
                revenuMoney = wMoney - totalTax;
            }
            else if (300000000 < wMoney)
            {
                double aTax = Math.Round(300000000 * 0.22);
                double divMoney = wTaxMoney - 300000000;
                double bTax = Math.Round(divMoney * 0.33);
                totalTax = aTax + bTax;
                revenuMoney = wMoney - totalTax;
            }

            return revenuMoney;

        }

        public string getBallClass(int num)
        {
            if (num <= 10)
            {
                return "color_1";
            }
            else if (num <= 20)
            {
                return "color_2";
            }
            else if (num <= 30)
            {
                return "color_3";
            }
            else if (num <= 40)
            {
                return "color_4";
            }
            else
            {
                return "color_5";
            }

        }
    }
}