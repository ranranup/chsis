package top.chsis.exception;

public class RoleException extends Exception{
	private static final long serialVersionUID = -961349783722251894L;
	
	private String msg;

	public RoleException(String msg) {
		super(msg);
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public RoleException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoleException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public RoleException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public RoleException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
	
}
