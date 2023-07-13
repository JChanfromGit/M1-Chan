namespace M1_CHAN.Controllers.Database
{
    public class DBConnections
    {
        private static IConfigurationBuilder builder;
        private static IConfiguration config;
        private static ISqlDataAccess dbAccess;
        public DBConnections()
        {
            builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json");

            config = builder.Build();
            dbAccess = new SqlDataAccess(config);

        }

        public ISqlDataAccess GetAccess()
        {
            return dbAccess;
        }

        public IConfiguration GetConfig()
        {
            return config;
        }
    }
}
