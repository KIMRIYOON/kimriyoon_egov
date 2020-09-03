package edu.human.com.board.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.human.com.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void deleteBoard(long NTT_ID) throws Exception {
		boardDAO.deleteBoard(NTT_ID);
	}

}