package edu.human.com.member.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.human.com.common.EgovComAbstractMapper;
import edu.human.com.member.service.AuthVO;

@Repository
public class AuthDAO extends EgovComAbstractMapper {
	public List<AuthVO> selectAuth() throws Exception {
		return selectList("memberMapper.selectAuth");
	}
}

