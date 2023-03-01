package templete;

public class OracleGlobal extends JdbcGlobal {
    private final String dbUrl = "jdbc:oracle:thin:@%ip:%port:%schema";

    public OracleGlobal(String ip, String port, String schema){
        super(ip, port, schema);
    }
    
    protected void set_driver(){
        jdbcDriver="oracle.jdbc.driver.OracleDriver";
    }
    protected void set_url(){
        super.dbUrl=dbUrl.toString();
    }
}
