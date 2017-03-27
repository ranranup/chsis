package top.chsis.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.alibaba.druid.pool.DruidDataSource;

public class DBUtil {
	
	private static DruidDataSource dataSource;
	
	static {
		Properties props = new Properties();
		String path ="/config.properties";
		try {
			props.load(DBUtil.class.getResourceAsStream(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		dataSource = new DruidDataSource();
		dataSource.setDriverClassName(props.getProperty("driverClassName"));
		dataSource.setUrl(props.getProperty("jdbc_url"));
		dataSource.setUsername(props.getProperty("jdbc_username"));
		dataSource.setPassword(props.getProperty("jdbc_password"));
		dataSource.setInitialSize(Integer.parseInt(props.getProperty("initialSize")));
		dataSource.setMaxActive(Integer.parseInt(props.getProperty("maxActive")));
		dataSource.setMaxIdle(Integer.parseInt(props.getProperty("maxIdle")));
		dataSource.setMinIdle(Integer.parseInt(props.getProperty("minIdle")));
		dataSource.setMaxWait(Long.parseLong(props.getProperty("maxWait")));
	}
	
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	public static Statement getStatement() throws SQLException {
		return getConnection().createStatement();
	}
	
	public static Statement getStatement(Connection conn) throws SQLException {
		return conn.createStatement();
	}
	
	public static ResultSet executeQuery(String sql) throws SQLException {
		return getStatement().executeQuery(sql);
	}

}
