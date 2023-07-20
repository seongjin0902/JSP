package Ch08;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class SessionDto {
	
	private Map<String, HttpSession> sessionMap ;
	
	public SessionDto() {
		sessionMap = new HashMap<>();
	}

	public Map<String, HttpSession> getSessionMap() {
		return sessionMap;
	}
	
}