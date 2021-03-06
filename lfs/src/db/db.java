package db;
import java.sql.*;
public class db {
	  private String dbDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	  private String sConnStr = "jdbc:sqlserver://localhost:1433;databasename=shiwuzhaoling"; 
	  public Connection connect = null;
	  public ResultSet rs=null;
	  
	  public db() {
	    try {
		      Class.forName(dbDriver).newInstance(); 
		      connect = DriverManager.getConnection(sConnStr,"sa","ok1314520"); 
	    }catch (Exception ex) {
	    	System.out.println("连接数据库失败！");
	    }
	  }
	  
	  public ResultSet executeQuery(String sql) {
			try{
					connect=DriverManager.getConnection(sConnStr,"sa","ok1314520");
					Statement stmt=connect.createStatement();
					rs=stmt.executeQuery(sql);
			}catch(SQLException ex){
				System.err.println(ex.getMessage());
			}
			return rs;
		}
	  
	  public void executeUpdate(String sql) {
	    	Statement stmt=null;
	    	rs=null;
	    	try {   
	    		connect=DriverManager.getConnection(sConnStr,"sa","ok1314520");
	    		stmt=connect.createStatement();
	    		stmt.executeUpdate(sql);
	    		stmt.close();
	    		connect.close();
	    	}catch(SQLException ex) {
	    		System.err.println(ex.getMessage());
	    	}
	  }
}
