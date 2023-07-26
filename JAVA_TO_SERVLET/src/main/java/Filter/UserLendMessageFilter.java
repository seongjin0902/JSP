package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UserLendMessageFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("UserLendMessageFilter's doFilter call! ^_^ ");
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		String role = (String) session.getAttribute("ROLE");
		
		chain.doFilter(request, response);
		

	}

}
