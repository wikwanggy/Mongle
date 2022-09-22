package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;
import org.Mongle.model.adminCriteriaDTO;
import org.apache.ibatis.annotations.Param;
//
public interface LoginDAO {
	// 로그인 select
	public LoginDTO login(LoginDTO ldto);
	// 회원가입
	public void signup(SignupDTO sd);
	// 회원 멤버리스트
	public ArrayList<SignupDTO> list(adminCriteriaDTO cri);
	// 회원정보 상세
	public SignupDTO detail(SignupDTO sdto);
	// 회원정보 수정
	public void modify(SignupDTO sdto);
	// 회원탈퇴
	public void leave(SignupDTO sdto);
	// id 중복체크
	public LoginDTO idcheck(String id);
	// email 중복 체크
	public LoginDTO emailcheck(String email);
	// memberlist 전체 테이블 건수 체크
	public int total(adminCriteriaDTO cri);
	// 로그인 체크
	public int logincheck(LoginDTO ldto);
	// id찾기
	public LoginDTO searchidcheck(@Param("name") String name, @Param("email") String email, @Param("number") String number);
	// pw찾기
	public LoginDTO searchpwcheck(String id, String name, String email, String number);
}