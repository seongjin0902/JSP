package Domain.Common.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import Domain.Common.Dto.MemberDto;

public interface MemberService {

	//회원 가입하기
	boolean memberJoin(MemberDto dto) throws Exception;

	//회원 조회하기(전체) - 관리자
	List<MemberDto> memberSearch(String sid) throws Exception;

	//회원 조회하기(한명) - 관리자
	MemberDto memberSearchOne(String role, String id) throws Exception;

	//회원 조회하기(한 회원) - 로그인한 회원만 
	MemberDto memberSearch(String id, String sid) throws Exception;

	//회원 수정하기 -- 본인확인
	boolean memberUpdate(MemberDto dto, String sid) throws Exception;

	//회원 삭제하기
	boolean memberDelete(String id, String sid) throws Exception;

	//로그인
	boolean login(HttpServletRequest req) throws Exception;

	//로그아웃
	boolean logout(String id, String sid);

	//역할반환함수 
	String getRole(String sid);

}