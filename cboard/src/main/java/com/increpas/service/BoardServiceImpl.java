package com.increpas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.increpas.domain.BoardVO;
import com.increpas.domain.Criteria;
import com.increpas.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper board;

	@Override
	public List<BoardVO> getBoardList(Criteria cri) {
		return board.getList(cri);
	}

	@Override
	public BoardVO getBoardView(int boardBno) {
		return board.getView(boardBno);
	}

	@Override
	public boolean removeBoard(int boardBno) {
		try {
			board.deleteBoard(boardBno);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateBoard(BoardVO board) {
		try {
			this.board.updateBoard(board);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public int writeBoard(BoardVO board) {
		try {
			this.board.writeBoard(board);
			return board.getBoardBno();
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int getTotal(Criteria cri) {
		return board.countTotal(cri);
	}

	@Override
	public void hitBoard(int boardBno) {
		board.hitBoard(boardBno);
	}

}
