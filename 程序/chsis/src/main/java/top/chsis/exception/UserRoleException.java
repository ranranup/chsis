package top.chsis.exception;

public class UserRoleException extends Exception{
	private static final long serialVersionUID = -961349783722251894L;
	
	private String msg;

	public UserRoleException(String msg) {
		super(msg);
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public UserRoleException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserRoleException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public UserRoleException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public UserRoleException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
	
}
