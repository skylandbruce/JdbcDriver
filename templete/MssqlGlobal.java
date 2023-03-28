package templete;

public class MssqlGlobal extends JdbcGlobal {
    private final String dbUrl = "jdbc:sqlserver://%ip:%port;encrypt=true;datatabase=%schema;integratedSecurity=true";
    public MssqlGlobal(String ip, String port, String schema){
        super(ip, port, schema);
    }

    protected void set_driver(){
        jdbcDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    }
    protected void set_url(){
        super.dbUrl=dbUrl.toString();
    }
}
