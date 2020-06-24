using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Models.DotNetNote
{
    /// <summary>
    /// 게시판의 글쓰기 폼 구성 분류(Write, Modify, Reply)
    /// </summary>
    public enum BoardWriteFormType
    {
        /// <summary>
        /// 글쓰기 페이지
        /// </summary>
        Write,
        /// <summary>
        /// 글수정 페이지
        /// </summary>
        Modify,
        /// <summary>
        /// 글답변 페이지
        /// </summary>
        Reply
    }

}
