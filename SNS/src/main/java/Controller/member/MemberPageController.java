package Controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.SubController;
import Domain.Common.Dao.BoardDao;
import Domain.Common.Dao.BoardDaoImpl;
import Domain.Common.Dto.BoardDto;
import Domain.Common.Dao.MemberDao;
import Domain.Common.Dao.MemberDaoImpl;

import java.util.List;

public class MemberPageController implements SubController {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) {
        try {
            HttpSession session = req.getSession();
            String role = (String) session.getAttribute("ROLE");
            if (role.equals("ROLE_USER")) {
                // User 페이지로 이동
                req.getRequestDispatcher("/WEB-INF/view/member/user.jsp").forward(req, resp);
            } else if (role.equals("ROLE_MEMBER")) {
                // Member 페이지로 이동
                MemberDao memberDao = MemberDaoImpl.getInstance();
                String userId = (String) session.getAttribute("ID");

                // 사용자의 글 목록을 가져오기
                BoardDao boardDao = BoardDaoImpl.getInstance();
                List<BoardDto> mypageData = boardDao.search_id(userId);
                req.setAttribute("mypageData", mypageData);

                req.getRequestDispatcher("/WEB-INF/view/member/member.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
