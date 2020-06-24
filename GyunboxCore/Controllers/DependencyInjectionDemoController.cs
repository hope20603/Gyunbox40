using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System;
using GyunboxCore.Services;

namespace GyunboxCore.Controllers
{
    public class DependencyInjectionDemoController : Controller
    {
        #region 생성자에서 직접 클래스의 인스턴스 생성
        //private CopyrightService _svc;
        //public DependencyInjectionDemoController()
        //{
        //    _svc = new CopyrightService();
        //}

        //public IActionResult Index()
        //{
        //    ViewBag.CopyRight = _svc.GetCopyrightString();

        //    return View();
        //}

        //public IActionResult About()
        //{
        //    ViewBag.CopyRight = _svc.GetCopyrightString();

        //    return View();
        //}
        #endregion

        #region 생성자 주입을 통한 클래스의 인스턴스 생성

        // [1] 생성자 주입을 통한 클래스의 인스턴스 생성
        //private CopyrightService _service;
        //public DependencyInjectionDemoController(CopyrightService service)
        //{
        //    _service = service;
        //}

        private ICopyrightService _service;
        private ICopyrightService _service2;

        public DependencyInjectionDemoController(ICopyrightService service, ICopyrightService service2)
        {
            _service = service;
            _service2 = service2;
        }


        public IActionResult Index()
        {
            ViewBag.CopyRight = _service.GetCopyrightString() +"," +
                _service2.GetCopyrightString();
        
            return View();
        }
        
        public IActionResult About()
        {
            ViewBag.CopyRight = _service.GetCopyrightString();
        
            return View();
        }

        public IActionResult AtInjectDemo()
        {
            return View();
        }

        #endregion


        //public IActionResult Index()
        //{
        //    CopyrightService _svc = new CopyrightService();
        //    ViewBag.CopyRight = _svc.GetCopyrightString();
        //
        //    return View();
        //}
        //
        //public IActionResult About()
        //{
        //    CopyrightService _svc = new CopyrightService();
        //    ViewBag.CopyRight = _svc.GetCopyrightString();
        //
        //    return View();
        //}
    }
}