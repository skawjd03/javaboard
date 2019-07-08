package com.increpas.mapper;

import java.util.List;

import com.increpas.domain.BoardVO;
import com.increpas.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList(Criteria cri);
	public int writeBoard(BoardVO board);
	public BoardVO getView(long boardBno);
	public boolean deleteBoard(int boardBno);
	public boolean updateBoard(BoardVO board);
	public int countTotal(Criteria cri);
	public void hitBoard(int boardBno);
}
