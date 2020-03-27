using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GyunboxCore.Models;
using Microsoft.AspNetCore.Mvc;

namespace GyunboxCore.Controllers
{
    public class CommunityCampController : Controller
    {
        private ICommunityCampJoinMemberRepository _repository;

        public CommunityCampController(ICommunityCampJoinMemberRepository repository)
        {
            _repository = repository;
        }

        public IActionResult Index()
        {
            var list = _repository.GetAll();
            return View(list);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(CommunityCampJoinMember model)
        {
            //서버측 유효성 검사 진행
            if (string.IsNullOrEmpty(model.Email))
            {
                ModelState.AddModelError("Email", "이메일을 입력하시오.");
            }

            if (ModelState.IsValid)
            {
                ViewBag.Result = $"커뮤니티:{model.CommunityName}, 이름:{model.Name}";

                //저장
                _repository.AddMember(model);
                TempData["Message"] = "데이터가 저장되었습니다.";

                return RedirectToAction("Index");
            }

            return View();
        }

        [HttpGet]
        public IActionResult Delete()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Delete(CommunityCampJoinMember model)
        {
            if (ModelState.IsValid)
            {
                //저장
                _repository.DeleteMember(model);
                TempData["Message"] = "데이터가 삭제되었습니다.";
                return RedirectToAction("Index");
            }
            return View();
        }

        //[Authorize]
        //[Authorize("Administrators")]
        public IActionResult ComCampAdmin()
        {
            //관리자
            var list = _repository.GetAll();
            return View(list); 
        }
    }
}