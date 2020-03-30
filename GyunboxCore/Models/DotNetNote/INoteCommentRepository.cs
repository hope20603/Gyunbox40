using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Models.DotNetNote
{
    public interface INoteCommentRepository
    {
        void AddNoteComment(NoteComment model);
        int DeleteNoteComment(int boardId, int id, string password);
        int GetCountBy(int boardId, int id, string password);
        List<NoteComment> GeteNoteComments(int boardId);
        List<NoteComment> GetRecentComments();

    }
}
