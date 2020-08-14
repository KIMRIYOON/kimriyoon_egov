package edu.human.com.member.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.human.com.member.service.EmployerInfoVO;
import edu.human.com.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public List<EmployerInfoVO> selectMember() throws Exception {
		return memberDAO.selectMember();
	}

	@Override
	public void insertMember(EmployerInfoVO vo) throws Exception {
		memberDAO.insertMember(vo);
	}

	@Override
	public void updateMember(EmployerInfoVO vo) throws Exception {
		memberDAO.updateMember(vo);
	}

	@Override
	public void deleteMember(String emplyr_id) throws Exception {
		memberDAO.deleteMember(emplyr_id);
	}

	@Override
	public EmployerInfoVO viewMember(String emplyr_id) throws Exception {
		return memberDAO.viewMember(emplyr_id);
	}

}
