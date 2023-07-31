package Controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MypageController")
public class MypageController extends HttpServlet{
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JSP 파일 경로 설정
        String jspPath = "/WEB-INF/view/mypage.jsp";

        // JSP 파일을 포함시킴
        getServletContext().getRequestDispatcher(jspPath).forward(request, response);
    }

}