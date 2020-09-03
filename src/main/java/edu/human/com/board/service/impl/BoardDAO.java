package edu.human.com.board.service.impl;

import org.springframework.stereotype.Repository;

import edu.human.com.common.EgovComAbstractMapper;

@Repository
public class BoardDAO extends EgovComAbstractMapper {
	public void deleteBoard(long NTT_ID) {
		delete("boardMapper.deleteBoard",NTT_ID);
	}
}