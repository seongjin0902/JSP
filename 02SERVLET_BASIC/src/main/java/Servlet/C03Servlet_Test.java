package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login.do")
public class C03Servlet_Test extends HttpServlet{
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGET!!");
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		System.out.println("email : " + email + " pwd : " + pwd);
		
		//reqeust에 내용저장
		req.setAttribute("email",email);
		req.setAttribute("pwd",pwd);
		
		//Forward
		req.getRequestDispatcher("/C03Main.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPOST!!");
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		System.out.println("email : " + email + " pwd : " + pwd);
		
		//reqeust에 내용저장
		req.setAttribute("email",email);
		req.setAttribute("pwd",pwd);
		
		//Forward
		req.getRequestDispatcher("/C03Main.jsp").forward(req, resp);
	}
	





	@Override
	public void init() throws ServletException {
		 //최초 1회 실행
		System.out.println("INIT!");
	}
//	@Override
//	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
//		System.out.println("SERVICE!");
//	}
	@Override
	public void destroy() {
		 //서비스 종료,재시작,코드수정 시
		System.out.println("DESTROY!");
	}

	
	




	
}