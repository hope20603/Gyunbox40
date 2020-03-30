using Dapper;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Models.DotNetNote
{
    public class NoteCommentRepository : INoteCommentRepository
    {
        private string _connectionString;
        private SqlConnection con;
        
        public NoteCommentRepository(string connecitonString)
        {
            _connectionString = connecitonString;
            con = new SqlConnection(_connectionString);
        }

        /// <summary>
        /// 특정 게시물에 댓글 추가
        /// </summary>
        /// <param name="model"></param>
        public void AddNoteComment(NoteComment model)
        {
            //파라미터 추가
            var parameters = new DynamicParameters();
            parameters.Add("@BoardId", value: model.BoardId, dbType: DbType.Int32);
            parameters.Add("@Name", value: model.BoardId, dbType: DbType.String);
            parameters.Add("@Opinion", value: model.BoardId, dbType: DbType.String);
            parameters.Add("@Password", value: model.BoardId, dbType: DbType.String);

            string sql = @"
                Insert Into NoteComments ( BoardId, Name, Opinion, Password)
                Values (@BoardId, @Name, @Opinion, @Password );
                Update Notes Set CommentCount = CommentCount + 1
                Where Id = @BoardId ";

            con.Execute(sql, parameters, commandType: CommandType.Text);
        }

        /// <summary>
        /// 특정 게시물에 해당하는 댓글 리스트
        /// </summary>
        /// <param name="boardId"></param>
        /// <returns></returns>
        public List<NoteComment> GeteNoteComments(int boardId)
        {
            return con.Query<NoteComment>("select * from NoteComments Where BoardId = @BoardId"
                                        , new { BoardId = boardId }
                                        , commandType:CommandType.Text).ToList();
        }

        /// <summary>
        /// 특정 게시물의 즉정 id에 해당하는 댓글 카운트
        /// </summary>
        /// <param name="boardId"></param>
        /// <param name="id"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public int GetCountBy(int boardId, int id, string password)
        {
            return con.Query<int>(@"Select Count(*) From NoteComments Where BoardId=@BoardId And Id = @Id And Password=@Password"
                                , new { BoardId = boardId, Id = id, Password = password }
                                , commandType: CommandType.Text).SingleOrDefault();
        }

        /// <summary>
        /// 댓글 삭제
        /// </summary>
        public int DeleteNoteComment(int boardId, int id, string password)
        {
            return con.Execute(@"Delete NoteComments Where BoardId = @BoardId And Id = @Id And Password = @Password; 
                                Update Notes Set CommentCount = CommentCount - 1
                                Where Id = @BoardId"
                                 , new { BoardId = boardId, Id = id, Password = password }
                                 , commandType: CommandType.Text
                                 );
        }


        /// <summary>
        /// 최근 댓글 리스트 전체
        /// </summary>
        /// <returns></returns>
        public List<NoteComment> GetRecentComments()
        {
            string sql = @"Select Top 3 Id, BoardId, Opinion, PostDate From NoteComments Order By Id Desc";
            return con.Query<NoteComment>(sql).ToList();
        }

    }
}
