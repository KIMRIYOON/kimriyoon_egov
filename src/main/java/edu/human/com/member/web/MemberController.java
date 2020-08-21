package edu.human.com.member.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.human.com.member.service.AuthVO;
import edu.human.com.member.service.EmployerInfoVO;
import edu.human.com.member.service.MemberService;
import edu.human.com.member.service.impl.AuthDAO;
import egovframework.let.utl.sim.service.EgovFileScrty;

@Controller
public class MemberController {

	@Inject
	private MemberService memberService;
	
	@Inject
	private AuthDAO authDAO;
	
	/**
	 AdminLTE용 관리자관리 삭제 POST.
	*/
	@RequestMapping(value = "/admin/member/deleteMember.do", method = RequestMethod.POST)
	public String adminDeleteMember(@RequestParam("EMPLYR_ID") String emplyr_id , Model model) throws Exception {
		memberService.deleteMember(emplyr_id);
		return "redirect:/admin/member/selectMember.do";
	}
	/**
	 AdminLTE용 관리자관리 입력 POST.
	*/
	@RequestMapping(value = "/admin/member/insertMember.do", method = RequestMethod.POST)
	public String adminInsertMember(EmployerInfoVO vo, Model model) throws Exception {
		//패스워드 암호화처리
		String enpassword = EgovFileScrty.encryptPassword(vo.getPASSWORD(), vo.getEMPLYR_ID());
		vo.setPASSWORD(enpassword);
		memberService.insertMember(vo);
		return "redirect:/admin/member/selectMember.do";
	}
	/**
	AdminLTE용 관리자관리 입력 GET.
	*/
	@RequestMapping(value = "/admin/member/insertMember.do", method = RequestMethod.GET)
	public String adminInsertMember(Model model) throws Exception {
		List<AuthVO> authVO = authDAO.selectAuth();
		model.addAttribute("authVO", authVO);
		return "admin/member/insert";
	}
	
	/**
	 AdminLTE용 관리자관리 수정 POST.
	*/
	@RequestMapping(value = "/admin/member/updateMember.do", method = RequestMethod.POST)
	public String adminUpdateMember(EmployerInfoVO vo, Model model) throws Exception {
		//패스워드 암호화처리
		if(vo.getPASSWORD() != "") {
			// 1. 입력한 비밀번호를 암호화한다.
			String enpassword = EgovFileScrty.encryptPassword(vo.getPASSWORD(), vo.getEMPLYR_ID());
			vo.setPASSWORD(enpassword);
		}
		memberService.updateMember(vo);
		return "redirect:/admin/member/viewMember.do?EMPLYR_ID=" + vo.getEMPLYR_ID();
	}
	/**
	 AdminLTE용 관리자관리 수정 GET.
	*/
	@RequestMapping(value = "/admin/member/updateMember.do", method = RequestMethod.GET)
	public String adminUpdateMember(@RequestParam("EMPLYR_ID") String EMPLYR_ID, Model model) throws Exception {
		EmployerInfoVO vo = memberService.viewMember(EMPLYR_ID);
		model.addAttribute("memberVO", vo);
		List<AuthVO> authVO = authDAO.selectAuth();
		model.addAttribute("authVO", authVO);
		return "admin/member/update";
	}
	/**
	 AdminLTE용 관리자관리 상세보기.
	*/
	@RequestMapping(value = "/admin/member/viewMember", method = RequestMethod.GET)
	public String adminViewMember(@RequestParam("EMPLYR_ID") String EMPLYR_ID, Model model) throws Exception {
		EmployerInfoVO vo = memberService.viewMember(EMPLYR_ID);
		model.addAttribute("memberVO", vo);
		List<AuthVO> authVO = authDAO.selectAuth();
		model.addAttribute("authVO", authVO);
		return "admin/member/view";
	}
	
	/**
	 AdminLTE용 관리자 홈 입니다.
	*/
	@RequestMapping("/admin/home.do")
	public String adminHome() throws Exception {
		return "admin/home";
	}
	
	/**
	 AdminLTE용 관리자관리 목록을 조회한다.
	*/
	@RequestMapping("/admin/member/selectMember.do")
	public String adminSelectMember(Model model) throws Exception {
		List<EmployerInfoVO> memberList = memberService.selectMember();
		model.addAttribute("memberList", memberList);
		return "admin/member/list";
	}
	
	/**
	 관리자관리 중복ID체크 GET.
	 @ResponseBody 에노테이션은 RestAPI방식에서 데이터만 리턴한다.
	*/
	@RequestMapping(value = "/com/member/restViewMember.do", method = RequestMethod.GET)
	@ResponseBody
	public int idCheckMember(@RequestParam("EMPLYR_ID") String emplyr_id , Model model) throws Exception {
		int result = 0;
		//뷰멤버 쿼리를 실행해서 결과가 존재하면 result 변수에 1을 입력한다(아래)
		if(memberService.viewMember(emplyr_id) != null) {
			result = 1;
		}
		return result;
	}
	/**
	 관리자관리 삭제 POST.
	*/
	@RequestMapping(value = "/com/member/deleteMember.do", method = RequestMethod.POST)
	public String deleteMember(@RequestParam("EMPLYR_ID") String emplyr_id , Model model) throws Exception {
		memberService.deleteMember(emplyr_id);
		return "redirect:/com/member/selectMember.do";
	}
	/**
	 관리자관리 입력 POST.
	*/
	@RequestMapping(value = "/com/member/insertMember.do", method = RequestMethod.POST)
	public String insertMember(EmployerInfoVO vo, Model model) throws Exception {
		//패스워드 암호화처리
		String enpassword = EgovFileScrty.encryptPassword(vo.getPASSWORD(), vo.getEMPLYR_ID());
		vo.setPASSWORD(enpassword);
		memberService.insertMember(vo);
		return "redirect:/com/member/selectMember.do";
	}
	/**
	 관리자관리 입력 GET.
	*/
	@RequestMapping(value = "/com/member/insertMember.do", method = RequestMethod.GET)
	public String insertMember(Model model) throws Exception {
		List<AuthVO> authVO = authDAO.selectAuth();
		model.addAttribute("authVO", authVO);
		return "com/member/insert";
	}
	/**
	 관리자관리 수정 POST.
	*/
	@RequestMapping(value = "/com/member/updateMember.do", method = RequestMethod.POST)
	public String updateMember(EmployerInfoVO vo, Model model) throws Exception {
		//패스워드 암호화처리
		if(vo.getPASSWORD() != "") {
			// 1. 입력한 비밀번호를 암호화한다.
			String enpassword = EgovFileScrty.encryptPassword(vo.getPASSWORD(), vo.getEMPLYR_ID());
			vo.setPASSWORD(enpassword);
		}
		memberService.updateMember(vo);
		return "redirect:/com/member/viewMember.do?EMPLYR_ID=" + vo.getEMPLYR_ID();
	}
	/**
	 관리자관리 수정 GET.
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
