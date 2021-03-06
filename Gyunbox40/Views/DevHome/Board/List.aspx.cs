﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gyunbox40.Common;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

namespace Gyunbox40.Views.DevHome.Board
{
    public partial class List : System.Web.UI.Page
    {
        public int PAGE_SIZE = 2000;
        public int now_page = 0;
        public int total_page = 0;
        protected CommonController cc;

        protected void Page_Load(object sender, EventArgs e)
        {
            cc = new CommonController();
            now_page = cc.NullToZero(Request["page"]);

            if (!IsPostBack)
            {
                //페이지 초기화
                GetBoardList();
                InitCategory();
            }
            else
            {
                //페이징 관련 처리-하나의 UserControll로 paging 처리 가능한지 확인 
                //전체 페이지
                //현재페이지
                //페이지사이즈 -- 전달 후 호출하는 방식 구상
            }
        }

        /// <summary>
        /// 카테고리 초기화
        /// </summary>
        public void InitCategory()
        {

            DataSet ds = null;
            //ope20603.sp_selectBRDMNU 
            //초기화
            //ListItem item1 = new ListItem("카테고리", "0");
            //this.ddl_category.Items.Add(item1);

            string spName = "sp_getBRDMNU";
            SqlConnection oCon = new SqlConnection(cc.GetConnectionString());
            //SqlParameter[] _sqlParam = null;

            try
            {
                ds = SqlHelper.ExecuteDataset(oCon, CommandType.StoredProcedure, spName);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    this.ltl_brdMnu.Text += "<select name='category'><option value='0'>카테고리</option>";
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        //ListItem tmpItem = new ListItem(ds.Tables[0].Rows[i]["BRDNME"].ToString(), ds.Tables[0].Rows[i]["BRDSEQ"].ToString());
                        //this.ddl_category.Items.Add(tmpItem);
                        this.ltl_brdMnu.Text += "<option  value='" + ds.Tables[0].Rows[i]["BRDSEQ"].ToString() + "'>" + ds.Tables[0].Rows[i]["BRDNME"].ToString() + "</option>";
                    }
                    this.ltl_brdMnu.Text += "</select>";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
                Response.Flush();
                Response.End();
            }
            finally
            {
                ds.Dispose();
                if (oCon.State == ConnectionState.Open)
                    oCon.Close();

                oCon.Dispose();

            }
        }

        //게시판 내용 가져오기
        protected void GetBoardList()
        {
            StringBuilder sb = new StringBuilder();
            DataSet ds = new DataSet();
            int start_id, end_id;

            //페이징처리
            now_page = (now_page == 0) ? 1 : now_page;
            start_id = (now_page - 1) * PAGE_SIZE;
            end_id = (now_page * PAGE_SIZE) + 1;

            //1. 쿼리자체에서 페이징 처리해서 가져오는 방법
            //2. C# 에서 FILL 시에 시작과 끝을 지정해주는 방법 - 2번방법으로 실행
            sb.AppendLine(" SELECT * FROM(   ");
            sb.AppendLine("     select ROW_NUMBER() OVER(ORDER BY serial_no desc) as row_num, * ");
            sb.AppendLine("     from hope20603.board A LEFT JOIN hope20603.BRDMNU B on A.board_num = B.BRDSEQ where del_flag ='N' ");
            sb.AppendLine(" ) as BOARD ");
            sb.AppendLine(" WHERE row_num > @start  and row_num< @end ; ");
            sb.AppendLine(" SELECT count(*) as totalCnt from hope20603.board where del_flag ='N'; ");
            
            DBConn conn = new DBConn();
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn.GetConn());
            cmd.Parameters.AddWithValue("@start", start_id);
            cmd.Parameters.AddWithValue("@end", end_id);

            try
            {
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
            }
            catch (Exception error)
            {
                Response.Write(error.ToString());
            }
            finally
            {
                conn.Close();
            }

            if (ds.Tables[1].Rows.Count > 0) total_page = ((int.Parse(ds.Tables[1].Rows[0]["totalCnt"].ToString()) - 1) / PAGE_SIZE) + 1;

            PageNavigator.boardKind = 1; //게시판구분 1
            PageNavigator.PageCount = total_page;  //페이지 총갯수 대입
            PageNavigator.CurrentPage = now_page;  //초기 1페이지 대입
            PageNavigator.DataBind();

            //데이터바인딩
            rptBoard.DataSource = ds.Tables[0].DefaultView;
            rptBoard.DataBind();
        }

        //답글 들여쓰기
        protected string ShowDepth(int depth)
        {
            string returnString = "";
            for(int i=0; i< depth; i++)
            {
                returnString += "&nbsp;&nbsp;&nbsp;";
            }
            return returnString;
        }

        protected string ShowReplyIcon(int innerId)
        {
            string returnString = "";
            if(innerId != 0)
            {
                returnString += "<img src='' />";
            }
            return returnString;
        }

        protected string ShowTitle(string serialNo, string category, string title, string delFlag)
        {
            string returnString = "";
            if(delFlag == "N")
            {
                returnString += "<a href='Detail.aspx?sn=" + serialNo +"'  ";
                returnString += "class='a01'>[ " + category + " ] " + title + "</a>";
            }
            else
            {
                returnString += "삭제된 게시물입니다.";
            }
            return returnString;
        }

        protected string ShowDate(DateTime regDate)
        {
            return string.Format("{0:yyyy-MM-dd}", regDate);
        }

    }
}