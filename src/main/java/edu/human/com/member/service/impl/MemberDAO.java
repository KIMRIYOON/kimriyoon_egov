package edu.human.com.member.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.human.com.common.EgovComAbstractMapper;
import edu.human.com.member.service.EmployerInfoVO;

@Repository
public class MemberDAO extends EgovComAbstractMapper {
	public List<EmployerInfoVO> selectMember() {
		return selectList("memberMapper.selectMember");
	}
	public void insertMember(EmployerInfoVO vo) {
		insert("memberMapper.insertMember", vo);
	}
	public void updateMember(EmployerInfoVO vo) {
		update("memberMapper.updateMember", vo);
	}
	public void deleteMember(String emplyr_id) {
		delete("memberMapper.deleteMember", emplyr_id);
	}
	public EmployerInfoVO viewMember(String emplyr_id) {
		return selectOne("memberMapper.viewMember", emplyr_id);
	}
}
