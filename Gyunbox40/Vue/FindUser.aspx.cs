using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;
using Gyunbox40.Model;

namespace Gyunbox40.Vue
{
    public partial class FindUser : System.Web.UI.Page
    {
        DaDdogram daDDo;
        protected void Page_Load(object sender, EventArgs e)
        {
            daDDo = new DaDdogram();
        }

        protected void btn_find_Click(object sender, EventArgs e)
        {
            var eml = tb_eml.Text;
            var uid = tb_uid.Text;

            if(Util.IsNullOrBlank(eml) || Util.IsNullOrBlank(uid))
            {
                Util.WriteMsg("아이디와 이메일을 다시 입력해주세요.",string.Empty);
            }
            else
            {
                var data = daDDo.GetUserPwd(uid, eml);

                if (data == null)
                {
                    //Util.WriteMsg("일치하는 정보가 없습니다.", string.Empty);
                    ltl_result.Text = "일치하는 정보가 없습니다.";
                }
                else
                {
                    ltl_result.Text = "등록하신 패스워드는[ <span style='color:#FF6550;font-weight:bold;'>" + data.PWD + "</span> ]입니다.";
                }
            }

        }
    }
}