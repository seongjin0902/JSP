package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/join.do")
public class C04Servlet_Test extends HttpServlet{

	
	//join페이지 접근시
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET /join.do ");
		req.getRequestDispatcher("/WEB-INF/join.jsp").forward(req, resp);
	}

	//join페이지의 내용완성후 가입요청시 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("POST /join.do ");
		//01 파라미터 
		String email=req.getParameter("email");
		String pwd=req.getParameter("pwd");
		
		String path = req.getContextPath();
		//02 유효성
		if(email==null||pwd==null) {
			resp.sendRedirect(path+"/join.do");
			return ;
		}
		//03 서비스
		
		//04 View 이동(Forward/Redirect)
		HttpSession session =  req.getSession();
		session.setAttribute("email",email);
		resp.sendRedirect(path+"/C03Main.jsp");
	}

	



	
}