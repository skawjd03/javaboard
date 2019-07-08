package com.increpas.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private String boardCategory,boardTitle,boardWriter,boardContent;
	private int boardBno,boardHit;
	private char boardIsShow;
	private Date boardDate,boardUpdateDate;	
}
