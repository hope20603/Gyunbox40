﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GyunboxCore.Models.DotNetNote;
using Microsoft.AspNetCore.Mvc;

namespace GyunboxCore.Controllers
{
    [Route("api/[controller]")]
    public class NoteServiceController : Controller
    {
        private INoteRepository _repository;

        public NoteServiceController(INoteRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public IEnumerable<Note> Get()
        {
            //최근 글 리스트 반환
            return _repository.GetRecentPosts();
        }
    }
}