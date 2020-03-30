using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Settings
{
    public class DotNetNoteSettings
    {
        public string SiteName { get; set; } = "DotNetNote";
        public string SiteUrl { get; set; } = "http://www.dotnetnote.com";
        public string SiteAdmin { get; set; } = "Admin"; // 관리자 아이디 지정
    }
}
