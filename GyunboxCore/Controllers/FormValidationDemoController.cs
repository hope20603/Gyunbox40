using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GyunboxCore.Models;
using Microsoft.AspNetCore.Mvc;

namespace GyunboxCore.Controllers
{
    public class FormValidationDemoController : Controller
    {
        //[1] 따라하기 1: 폼 유효성 검사 테스트용 메인페이지 작성
        #region Main Page
        public IActionResult Index()
        {   
            return View();
        }
        #endregion

        //[2] 따라하기 2: 순수 html과 javascript를 사용한 유효성검사
        #region HTML
        public IActionResult Html()
        {
            return View();
        }

        public IActionResult HtmlProcess(string txtName, string txtContent)
        {
            ViewBag.ResultString = $"이름: {txtName}, 내용:{Request.Form["txtContent"]}";
            return View();
        }
        #endregion

        #region Helper Method
        [HttpGet]
        public IActionResult HelperMethod()
        {
            return View();
        }

        [HttpPost]
        public IActionResult HelperMethod(string txtName, string txtContent)
        {
            ViewBag.ResultString = $"이름:{txtName}, 내용:{txtContent}";

            return View();
        }
        #endregion

        #region Strongly Type View + Model Binding
        public IActionResult StronglyTypeView()
        {
            

            return View();
        }

        [HttpPost]
        public IActionResult StronglyTypeView(MaximModel model)
        {
            return View();
        }


        #endregion

        #region Model Validation + Server Validation
        public IActionResult ModelValidation()
        {
            return View();
        }

        [HttpPost]

        public IActionResult ModelValidation(MaximModel model)
        {
            //직접 유효성 검사
            if (string.IsNullOrEmpty(model.Name))
            {
                ModelState.AddModelError("Name", "이름을 입력하세요.");
            }

            if (string.IsNullOrEmpty(model.Content))
            {
                ModelState.AddModelError("Content", "내용을 입력하세요.");
            }

            if (!ModelState.IsValid)
            {
                //@Html.ValidationSummary(true)일 때는 아래 에러만 표시
                ModelState.AddModelError("", "모든에러");
            }

            //넘어온 모델에 대한 유효성 검사
            if (ModelState.IsValid)
            {
                return View("Completed");
            }
            return View();
        }

        public IActionResult Completed()
        {
            return View();
        }
        #endregion

        #region Client Validation
        public IActionResult ClientValidation()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ClientValidation(MaximModel model)
        {
            if (ModelState.IsValid)
            {
                return View("Completed");
            }
            return View();
        }
        #endregion

        #region TagHelper
        public IActionResult TagHelperValidation()
        {
            return View();
        }

        [HttpPost]
        public IActionResult TagHelperValidation(MaximModel model)
        {
            //넘어온 모델에 대한 유효성 검사
            if (ModelState.IsValid)
            {
                return View("Completed");
            }
            return View();
        }
        #endregion
    }
}