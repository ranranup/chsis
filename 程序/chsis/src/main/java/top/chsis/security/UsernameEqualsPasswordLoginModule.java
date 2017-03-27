package top.chsis.security;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.security.auth.Subject;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.login.LoginException;
import javax.security.auth.spi.LoginModule;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import top.chsis.model.User;
import top.chsis.util.DBUtil;

/**
 * A LoginModule that will allow login if the username equals the password. Upon
 * successful authentication it adds the username as a Principal.
 *
 * @author Rob Winch
 */
public class UsernameEqualsPasswordLoginModule implements LoginModule {
	
	private static final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	private String password;
	private String userName;
	private String type;
	private Subject subject;
	
	public boolean abort() throws LoginException {
		return true;
	}

	public boolean commit() throws LoginException {
		return true;
	}

	public void initialize(Subject subject, CallbackHandler callbackHandler, Map<String, ?> sharedState, Map<String, ?> options) {
		this.subject = subject;
		
		try {
			NameCallback nameCallback = new NameCallback("prompt");
			PasswordCallback passwordCallback = new PasswordCallback("prompt", false);

			callbackHandler.handle(new Callback[] { nameCallback, passwordCallback});

			password = new String(passwordCallback.getPassword());
			
			String temp = nameCallback.getName();
			userName = temp.split("%")[0];
			type = temp.split("%")[1];
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public boolean login() throws LoginException {
		User user = null;
		user = getUserByName(userName);
		if(user == null || !passwordEncoder.matches(password, user.getPassword())) {
			return false;
		}
		
		//token里放的是用户名和用户对象
		UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userName, user);
		subject.getPrincipals().add(authenticationToken);
		return true;
	}

	private User getUserByName(String userName) {
		ResultSet rs;
		User u = null;
		//DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String table = "t_resident";
		if(type.equals("admin")) {
			table = "t_manager";
		} else if(type.equals("doctor")) {
			table = "t_doctor";
		}
		try {
			rs = DBUtil.executeQuery("select * from " + table + " where userName='" + userName + "'");
			if(rs.next()) {
				u = new User();
				u.setUuid(rs.getString("uuid"));
				u.setUserName(rs.getString("userName"));
				u.setPassword(rs.getString("password"));
				u.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	public boolean logout() throws LoginException {
		return true;
	}
	
}
