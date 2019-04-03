using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gyunbox40.Views.Shared
{
    public partial class Pagenavigator : System.Web.UI.UserControl
    {
        public int PageCount = 1;
        public int CurrentPage = 1;
        public int hiddenTyp = 0;

        public string txtStart = " <img src='/images/btn/btn_first.gif' alt='첫페이지' /> ";
        public string txtPrev = " <img src='/images/btn/btn_prev.gif' alt='이전페이지' /> ";
        public string txtNext = " <img src='/images/btn/btn_next.gif' alt='다음페이지' /> ";
        public string txtEnd = " <img src='/images/btn/btn_end.gif' alt='마지막페이지' /> ";
        public int boardKind;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string makeLink(string linkstr, int page, string title, string stylestr)
        {
            string values = "";

            if (hiddenTyp == 1)
                values = String.Format("&nbsp;<a href=\"javascript:ActionPaging2({0},{1});\" title=\"{2}\" {4}>{3}</a>", page, boardKind, title, linkstr, stylestr);  //인자: 페이지번호,게시판종류,풍선도움말타이틀,페이지번호문자
            else
                values = String.Format("&nbsp;<a href=\"javascript:ActionPaging({0},{1});\" title=\"{2}\" {4}>{3}</a>", page, boardKind, title, linkstr, stylestr);   //인자: 페이지번호,게시판종류,풍선도움말타이틀,페이지번호문자


            return values;
        }


        protected string PageLink
        {
            get
            {
                int pageStart;
                int pageEnd;
                string str = "";

                pageStart = CurrentPage - 4;
                if (pageStart < 1)
                    pageStart = 1;
                pageEnd = pageStart + 9;
                if (pageEnd >= PageCount)
                    pageEnd = PageCount;
                pageStart = pageEnd - 9;
                if (pageStart < 1)
                    pageStart = 1;

                if (CurrentPage > 1)
                {
                    int JumpPage = (((CurrentPage / 10) - 1) * 10) + 1;

                    if (JumpPage < 1)
                        JumpPage = 1;

                    str = makeLink(txtStart, 1, "첫페이지로 이동", "class='btn'")
                        + " " + makeLink(txtPrev, JumpPage, "이전페이지로 이동", "class='btn prev'");
                }
                else
                {
                    //str = txtStart + " " + txtPrev;
                    str = "";
                }
                str += " ";

                for (int i = pageStart; i <= pageEnd; i++)
                {
                    if (i == CurrentPage)
                        //str += i;
                        str += makeLink("<font color='#FFFFFF'>" + i + "</font>", i, i + "페이지로 이동 [현재페이지]", "class='on'");
                    else
                        str += makeLink("" + i + "", i, i + "페이지로 이동", "");
                }


                if (CurrentPage < PageCount)
                {
                    int JumpPage = ((CurrentPage / 10) * 10) + 11;

                    if (JumpPage > PageCount)
                        JumpPage = PageCount;

                    str += makeLink(txtNext, JumpPage, "다음페이지로 이동", "class='btn next'")
                        + " " + makeLink(txtEnd, PageCount, "마지막페이지로 이동", "class='btn'");
                }
                else
                {
                    //str += txtNext + " " + txtEnd;
                    str += "";
                }
                return str;
            }
        }
    }
}