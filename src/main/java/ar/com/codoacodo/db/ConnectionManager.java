package ar.com.codoacodo.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	public static Connection initConnection() {
		String host = "localhost";
		String port = "3306";
		String dbName = "supermarket";
		String userName = "root";
		String password = "289137tx";

		String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?serverTimeZone=UTC&useSSL=false";
		String driverClassname = "com.mysql.cj.jdbc.Driver";

		try {
			Class.forName(driverClassname);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		try {
			connection = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
}
