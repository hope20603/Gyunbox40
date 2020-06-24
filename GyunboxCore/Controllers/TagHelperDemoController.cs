using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace GyunboxCore.Controllers
{
    public class TagHelperDemoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// environment 태그 헬퍼 사용하기
        /// </summary>
        /// <returns></returns>
        public IActionResult EnvironmentDemo()
        {
            return View();
        }

        /// <summary>
        /// 내장 태그 헬퍼에 접두사 붙이기
        /// </summary>
        /// <returns></returns>
        public IActionResult PrefixDemo()
        {
            return View();
        }

        /// <summary>
        /// 사용자 정의 태그 헬퍼
        /// </summary>
        /// <returns></returns>
        public IActionResult MyTagHelperDemo()
        {
            return View();
        }

        /// <summary>
        /// 커스텀 태그 헬퍼
        /// </summary>
        /// <returns></returns>
        public IActionResult EmailLinkDemo()
        {
            return View();
        }

        /// <summary>
        /// 유닉스 시간 변경기 태그 헬퍼 사용 테스트
        /// </summary>
        /// <returns></returns>
        public IActionResult TagHelperDemo()
        {
            return View();
        }

        /// <summary>
        /// 페이징 헬퍼
        /// </summary>
        /// <returns></returns>
        public IActionResult PagingHelperDemo()
        {
            return View();
        }

        /// <summary>
        /// Cache 태그 헬퍼
        /// </summary>
        /// <returns></returns>
        public IActionResult CacheDemo()
        {
            return View();
        }


    }
}