using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Gyunbox40.Common;

namespace Gyunbox40.Models
{
    public class DaMember
    {
        public DataSet GetMember()
        {
            DataSet ds = new DataSet();
            DBConn db = new DBConn();
            DaMember daMem = new DaMember();
            string strQuery = "select * from hope20603.member;";
            try
            {
                ds = db.ExecuteWithDataSet(strQuery);
                db.Close();
            }
            catch(Exception e)
            {
                
            }
            finally
            {
                if(db != null)
                {
                    db.Close();
                }
            }
            
            return ds;
        }
    }

}