package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Type.Role;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet LoginServlet Start^_^");

		req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost LoginServlet Start^_^");
		

		String userid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		
		System.out.println("userid : " + userid);
		System.out.println("pwd : " + pwd);
		
//		PrintWriter out = resp.getWriter();
//		out.println("USERID : " + userid);
//		out.print("PWD : " + pwd);
		
//		ROLE 부여(in Session) - 일반계정 : user / 관리자 계정 : admin
		HttpSession session = req.getSession();
		
		if(userid.equals("user"))
		{
			session.setAttribute("ROLE", Role.ROLE_USER);
		}
		else if(userid.equals("damin"))
		{
			session.setAttribute("ROLE", Role.ROLE_ADMIN);
		}
		
		
		
		
		
	}

}
