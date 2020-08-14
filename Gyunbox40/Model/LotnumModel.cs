using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Gyunbox40.Model
{
    /// <summary>
    /// 로또 당첨번호 모델
    /// </summary>
    public class LotnumModel
    {
        public int SEQ { get; set; }
        public int NUM1 { get; set; }
        public int NUM2 { get; set; }
        public int NUM3 { get; set; }
        public int NUM4 { get; set; }
        public int NUM5 { get; set; }
        public int NUM6 { get; set; }
        public int NUM7 { get; set; } //보너스 번호
        public string WIN_DATE { get; set; } //추첨일
        public string TOTAL_SEL { get; set; } //총 판매금액

    }

    public class LotColorModel
    {
        public int SEQ { get; set; }
        public int NUM1 { get; set; }
        public int COL1 { get; set; }
        public int NUM2 { get; set; }
        public int COL2 { get; set; }
        public int NUM3 { get; set; }
        public int COL3 { get; set; }
        public int NUM4 { get; set; }
        public int COL4 { get; set; }
        public int NUM5 { get; set; }
        public int COL5 { get; set; }
        public int NUM6 { get; set; }
        public int COL6 { get; set; }
        public int NUM7 { get; set; } //보너스 번호
        public int COL7 { get; set; }
        public string WIN_DATE { get; set; } //추첨일
        public string TOTAL_SEL { get; set; } //총 판매금액

    }

    /// <summary>
    /// 등수별 당첨정보
    /// </summary>
    public class LotWinner
    {
        public int ORD { get; set; }
        public string CNT { get; set; }
        public string MNY { get; set; }
        
    }

    /// <summary>
    /// 맵에서 가게 정보를 불러올때 사용
    /// </summary>
    public class LotStore
    {
        public string store_name { get; set; }
        public string store_add { get; set; }
        public string store_loc { get; set; }
        public string wincnt { get; set; }
    }

    public class LotUser
    {
        public int IDX { get; set; }
        public string UID { get; set; }
        public string PWD { get; set; }
        public string EML { get; set; }
    }
}