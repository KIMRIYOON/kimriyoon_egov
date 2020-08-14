package edu.human.com.member.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.human.com.member.service.AuthVO;
import edu.human.com.member.service.EmployerInfoVO;
import edu.human.com.member.service.MemberService;
import edu.human.com.member.service.impl.AuthDAO;

@Controller
public class MemberController {

	@Inject
	private MemberService memberService;
	
	@Inject
	private AuthDAO authDAO;
	
	/**
	 관리자관리 수정.
	*/
	@RequestMapping(value = "/com/member/updateMember.do", method = RequestMethod.GET)
	public String updateMember(@RequestParam("EMPLYR_ID") String EMPLYR_ID, Model model) throws Exception {
		EmployerInfoVO vo = memberService.viewMember(EMPLYR_ID);
		model.addAttribute("memberVO", vo);
		List<AuthVO> authVO = authDAO.selectAuth();
		model.addAttribute("authVO", authVO);
		return "com/member/update";
	}
	/**
	 관리자관리 상세보기.
	*/
	@RequestMapping(value = "/com/member/viewMember.do", method = RequestMethod.GET)
	public String viewMember(@RequestParam("EMPLYR_ID") String EMPLYR_ID, Model model) throws Exception {
		EmployerInfoVO vo = memberService.viewMember(EMPLYR_ID);
		model.addAttribute("memberVO", vo);
		List<AuthVO> authVO = authDAO.selectAuth();
		model.addAttribute("authVO", authVO);
		return "com/member/view";
	}
	
	/**
	 관리자관리 목록을 조회한다.
	*/
	@RequestMapping("/com/member/selectMember.do")
	public String selectMember(Model model) throws Exception {
		List<EmployerInfoVO> memberList = memberService.selectMember();
		model.addAttribute("memberList", memberList);
		return "com/member/list";
	}
}
