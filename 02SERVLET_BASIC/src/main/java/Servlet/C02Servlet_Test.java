package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;


public class C02Servlet_Test extends HttpServlet{
	int i=1;
	@Override
	public void init() throws ServletException {
		 //최초 1회 실행
		System.out.println("INIT!");
	}
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		
		 //요청시마다 동작_!_!
		//arg0에 연결된 객체는 HttpServletRequest로 만들어진 request객체의 주소이다
		//그 HttpServletRequest객체를 상위인터페이스 참조변수인 arg0로 받는 파라미터
		HttpServletResponse response = (HttpServletResponse)arg1;
		PrintWriter out = response.getWriter();
		out.write("hellWorld "+(i++));
		System.out.println("SERVICE!");
	}
	@Override
	public void destroy() {
		 //서비스 종료,재시작,코드수정 시
		System.out.println("DESTROY!");
	}

	
	




	
}