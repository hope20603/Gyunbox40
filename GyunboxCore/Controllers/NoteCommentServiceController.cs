using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GyunboxCore.Models.DotNetNote;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GyunboxCore.Controllers
{
    [Route("api/[controller]")]
    public class NoteCommentServiceController : Controller
    {
        private INoteCommentRepository _repository;    

        public NoteCommentServiceController(INoteCommentRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public IEnumerable<NoteComment> Get()
        {
            //최근 댓글 리스트 반환
            return _repository.GetRecentComments();
        }
    }
}