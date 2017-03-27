package top.chsis.exception;

public class UserException extends Exception{
	private static final long serialVersionUID = -961349783722251894L;
	
	private String msg;

	public UserException(String msg) {
		super(msg);
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public UserException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public UserException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public UserException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
	
}
