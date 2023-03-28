package templete;

public abstract class JdbcGlobal {
    protected String jdbcDriver;
    private String ip;
    private String port;
    private String schema;
    protected String dbUrl;
    private String dbUser = "root";
    private String dbPwd;
    JdbcGlobal(String ip, String port, String schema){
        //to go:암호화된 파일에서 읽어와 dbUser, dbPwd, port, schema 설정
        set_driver();
        set_url();
        this.ip=ip;
        this.port=port;
        this.schema=schema;
        gen_url();
    }
    abstract protected void set_driver();
    abstract protected void set_url();
    
    public void set_ip(String ip){
        this.ip=ip;
        gen_url();
    }
    public void set_port(String port){
        this.port=port;
        gen_url();
    }
    public void set_schema(String schema){
        this.schema=schema;
        gen_url();
    }
    
    private void gen_url(){
        set_url();
        dbUrl=dbUrl.replace("%ip", ip);
        dbUrl=dbUrl.replace("%port", port);
        dbUrl=dbUrl.replace("%schema", schema);        
    }

    public String get_driver(){
        return jdbcDriver;
    }
    public String get_url(){
        return dbUrl;
    }

    public void set_user(String user){
        dbUser=user;
    }
    public String get_user(){
        return dbUser;
    }
    public void set_password(String password){
        dbPwd=password;
    }
    public String get_password(){
        return dbPwd;
    }
}
