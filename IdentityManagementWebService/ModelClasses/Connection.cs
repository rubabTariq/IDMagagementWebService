using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace IdentityManagementWebService.ModelClasses
    {
    public class Connection : IDisposable
        {
            private static SqlConnection _connection;

        static string connectionString = "Server =tcp:testdatabaseserverrt01.database.windows.net,1433;Initial Catalog = TestDatabase; Persist Security Info=False;User ID = { rubab.tariq@bentley.com }; Password={T@ariq5121472}; MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout = 30";
    public static SqlConnection establish ()
                {
            _connection = new SqlConnection(connectionString); /*ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString*/
                _connection.Open();
                return _connection;
                }
            public void Dispose ()
                {
                Dispose(true);
                GC.SuppressFinalize(this);
                }

            protected virtual void Dispose (bool disposing)
                {
                if ( disposing == true )
                    {
                    _connection.Close();
                    }
                }

            ~Connection ()
                {
                Dispose(false);
                }

            }
        }