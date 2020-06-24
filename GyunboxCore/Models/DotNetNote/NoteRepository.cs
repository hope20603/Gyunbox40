using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace GyunboxCore.Models.DotNetNote
{
    public class NoteRepository : INoteRepository
    {
        private IConfiguration _config;
        private SqlConnection con;
        private ILogger<NoteRepository> _logger;

        /// <summary>
        /// 환경변수와 로그 개체 주입
        /// </summary>
        public NoteRepository(IConfiguration config, ILogger<NoteRepository> logger)
        {
            _config = config;
            con = new SqlConnection(_config.GetSection("ConnectionStrings").GetSection("DefaultConnection").Value);
            _logger = logger;
        }

        /// <summary>
        /// 데이터 저장, 수정, 답변 공통 메서드
        /// </summary>
        /// <param name="n"></param>
        /// <param name="formType"></param>
        /// <returns></returns>
        public int SaveOrUpdate(Note n, BoardWriteFormType formType)
        {
            int r = 0;

            //파라미터 추가
            var p = new DynamicParameters();

            //[a] 공통
            p.Add("@Name", value: n.Name, dbType: DbType.String);
            p.Add("@Email", value: n.Email, dbType: DbType.String);
            p.Add("@Title", value: n.Title, dbType: DbType.String);
            p.Add("@Content", value: n.Content, dbType: DbType.String);
            p.Add("@Password", value: n.Password, dbType: DbType.String);
            p.Add("@Encoding", value: n.Encoding, dbType: DbType.String);
            p.Add("@Homepage", value: n.Homepage, dbType: DbType.String);
            p.Add("@Filename", value: n.FileName, dbType: DbType.String);
            p.Add("@Filesize", value: n.FileSize, dbType: DbType.Int32);

            switch (formType) 
            {
                case BoardWriteFormType.Write:
                    //글쓰기 전용
                    p.Add("@PostIp", value: n.PostIp, dbType: DbType.String);
                    r = con.Execute("WriteNote", p, commandType: CommandType.StoredProcedure);
                    break;
                case BoardWriteFormType.Modify:
                    //수정하기 전용
                    p.Add("@ModifyIp", value: n.ModifyIp, dbType: DbType.String);
                    p.Add("@Id", value: n.Id, dbType: DbType.Int32);
                    r = con.Execute("ModifyNote", p, commandType: CommandType.StoredProcedure);
                    break;
                case BoardWriteFormType.Reply:
                    //답변쓰기 전용
                    p.Add("@PostIp", value: n.PostIp, dbType: DbType.String);
                    p.Add("@ParentNum", value: n.ParentNum, dbType: DbType.Int32);
                    r = con.Execute("ReplyNote", p, commandType: CommandType.StoredProcedure);
                    break;
            }

            return r;
        }

        /// <summary>
        /// 게시판 글스기
        /// </summary>
        /// <param name="model"></param>
        public void Add(Note vm)
        {
            _logger.LogInformation("데이터 입력");
            try
            {
                SaveOrUpdate(vm, BoardWriteFormType.Write);
            }
            catch(System.Exception ex)
            {
                _logger.LogError("데이터 입력 에러: " + ex);
            }
        }

        /// <summary>
        /// 수정 하기
        /// </summary>
        /// <param name="model"></param>
        public int UpdateNote(Note vm)
        {
            int r = 0;
            _logger.LogInformation("데이터 수정");
            try
            {
                r = SaveOrUpdate(vm, BoardWriteFormType.Modify);
            }
            catch (System.Exception ex)
            {
                _logger.LogError("데이터 수정 에러: " + ex);
            }
            return r;
        }


        /// <summary>
        /// 답변 글쓰기
        /// </summary>
        /// <param name="model"></param>
        public void ReplyNote(Note vm)
        {
            
            _logger.LogInformation("데이터 답변");
            try
            {
                SaveOrUpdate(vm, BoardWriteFormType.Reply);
            }
            catch (System.Exception ex)
            {
                _logger.LogError("데이터 답변 에러: " + ex);
            }
            
        }

        /// <summary>
        /// 게시판 리스트
        /// </summary>
        /// <param name="page">페이지 번호</param>
        /// <returns></returns>
        public List<Note> GetAll(int page)
        {
            _logger.LogInformation("데이터 출력");
            try
            {
                var parameters = new DynamicParameters(new { Page = page });
                return con.Query<Note>("ListNotes", parameters, commandType: CommandType.StoredProcedure).ToList();
            }
            catch(System.Exception ex)
            {
                _logger.LogError("데이터 출력 에러: " + ex);
                return null;
            }
        }

        /// <summary>
        /// 검색 카운트
        /// </summary>
        /// <param name="searchField"></param>
        /// <param name="searchQuery"></param>
        /// <returns></returns>
        public int GetCountBySearch(string searchField, string searchQuery)
        {
            try
            {
                return con.Query<int>("SearchNoteCount", new { SearchField = searchField, SearchQuery = searchQuery }, commandType: CommandType.StoredProcedure).SingleOrDefault();
            }
            catch(System.Exception ex)
            {
                _logger.LogError("카운트 출력 에러: " + ex);
                return -1;
            }
        }

        /// <summary>
        /// Notes 테이블의 모든 레코드 수
        /// </summary>
        /// <returns></returns>
        public int GetCountAll()
        {
            try
            {
                return con.Query<int>("Select Count(*) From Notes").SingleOrDefault();
            }
            catch (System.Exception)
            {
                _logger.LogError("에러발생");
                return -1;
            }
        }

        /// <summary>
        /// Id에 해당하는 파일명 반환
        /// </summary>
        public string GetFileNameById(int id)
        {
            return con.Query<string>("Select FileName From Notes Where Id=@id", new { Id = id }).SingleOrDefault();
        }

        /// <summary>
        /// 검색 결과 리스트
        /// </summary>
        public List<Note> GetSearchAll(int page, string searchField, string searchQuery)
        {
            var parameters = new DynamicParameters(new { 
                Page = page,
                SearchField = searchField,
                SearchQuery = searchQuery
            });
            return con.Query<Note>("SearchNotes", parameters, commandType: CommandType.StoredProcedure).ToList();
        }

        /// <summary>
        /// 다운카운트 1 증가
        /// </summary>
        /// <param name="fileName"></param>
        public void UpdateDownCount(string fileName)
        {
            con.Execute("update Notes Set DownCount = DownCount + 1 Where FileName = @FileName", new { FileName = fileName });
        }

        /// <summary>
        /// 다운카운트 1 증가
        /// </summary>
        public void UpdateDownCountById(int id)
        {
            var p = new DynamicParameters(new { Id = id });
            con.Execute("update Notes Set DownCount = DownCount + 1 Where id = @Id", p, commandType: CommandType.Text);
        }

        /// <summary>
        /// 상세보기
        /// </summary>
        public Note GetNoteById(int id)
        {
            var parameters = new DynamicParameters(new { Id = id });
            return con.Query<Note>("ViewNote", parameters, commandType: CommandType.StoredProcedure).SingleOrDefault();
        }

        /// <summary>
        /// 삭제
        /// </summary>
        public int DeleteNote(int id, string password)
        {
            return con.Execute("DeleteNote", new { Id = id, Password = password }, commandType: CommandType.StoredProcedure);
        }

        /// <summary>
        /// 최근 올라온 사진 리스트 4개 출력
        /// </summary>
        /// <returns></returns>
        public List<Note> GetNewPhotos()
        {
            string sql = "Select Top 4 Id, Title, FileName, FileSize From Notes Where FileName like '%.png' Or FileName Like '%.jpg' "
                        + " Or FileName Like '%.jpeg' Or FileName Like '%.gif' Order by Id Desc";
            return con.Query<Note>(sql).ToList();
        }

       
        /// <summary>
        /// 최근 글 리스트
        /// </summary>
        public List<Note> GetNoteSummaryByCategory(string category)
        {
            string sql = "Select top 3 id, title, name, postdate, filename, filesize, readcount, commentCount, step from Notes "
                         + " Where Category = @Category Order By Id Desc";
            return con.Query<Note>(sql, new { Category = category }).ToList();
        }

        /// <summary>
        /// 최근 글 리스트 전체(최근 글 5개 리스트)
        /// </summary>
        /// <returns></returns>
        public List<Note> GetRecentPosts()
        {
            string sql = " Select top 3 id, title, name, postdate, filename, filesize, readcount, commentCount, step from Notes "
                         + " Order By Id Desc";
            return con.Query<Note>(sql).ToList();
        }


        /// <summary>
        /// 최근 글 리스트 n개
        /// </summary>
        /// <returns></returns>
        public List<Note> GetRecentPosts(int numberOfNotes)
        {
            string sql = $" Select top {numberOfNotes} id, title, name, postdate from Notes "
                         + " Order By Id Desc";
            return con.Query<Note>(sql).ToList();
        }

        /// <summary>
        /// 특정 게시물을 공지사항(notice)으로 올리기
        /// </summary>
        /// <param name="id"></param>
        public void Pinned(int id)
        {
            con.Execute("Update Notes Set Category = 'Notice' Where Id = @Id", new { Id = id });
        }


    }
}
