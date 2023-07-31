package Controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.SubController;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberPageController implements SubController {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) {

        try {
            HttpSession session = req.getSession();
            String role = (String) session.getAttribute("ROLE");
            if (role.equals("ROLE_USER")) {
                req.getRequestDispatcher("/WEB-INF/view/member/user.jsp").forward(req, resp);
            } else if (role.equals("ROLE_MEMBER")) {
                // 데이터베이스에 연결하여 회원 정보를 조회
                String url = "jdbc:mysql://localhost:3306/your_db";
                String username = "your_username";
                String password = "your_password";
                
                String memberId = "조회할_회원_ID"; // 조회할 회원의 ID를 '조회할_회원_ID'로 바꾸세요.
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, username, password);
                    String query = "SELECT id, password, name, phoneNumber, birthdate FROM members WHERE id = ?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, memberId);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        Member member = new Member();
                        member.setId(rs.getString("id"));
                        member.setPassword(rs.getString("password"));
                        member.setName(rs.getString("name"));
                        member.setPhoneNumber(rs.getString("phoneNumber"));
                        member.setBirthdate(rs.getString("birthdate"));
                        req.setAttribute("member", member);
                    }

                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                req.getRequestDispatcher("/WEB-INF/view/member/member.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
