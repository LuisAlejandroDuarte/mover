using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace Mover.Repositories.EFCore.DataContext
{
    class MoverContextFactory : IDesignTimeDbContextFactory<MoverContext>
    {
        public MoverContext CreateDbContext(string[] args)
        {
            var OptionBuilder =
                new DbContextOptionsBuilder<MoverContext>();


            //OptionBuilder.UseSqlServer("Data Source=DESKTOP-9REACFU;Initial Catalog=Mover;User ID=sa;Password=Lu1sAlej0;");
            OptionBuilder.UseSqlServer("Server=DESKTOP-THBEC3H;database=MOVER;Trusted_Connection=True;TrustServerCertificate=True");
            //OptionBuilder.UseSqlServer("Server = mover.chwdf5yrc2kw.us-east-1.rds.amazonaws.com,1433;Encrypt=True;TrustServerCertificate=True;database=mover;;User ID=userMover;Password=Lu1sAlejandr0;");
            //"Server = (localdb)\\mssqllocaldb;database=Mover"
            //OptionBuilder.UseSqlServer("Server = servermover.database.windows.net;Initial Catalog=mover;Persist Security Info=False;User ID=useradmin;Password=Lu1sAlejandr0;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");

            return new MoverContext(OptionBuilder.Options);
            
        }
    }
}
