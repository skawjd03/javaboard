package com.increpas.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReReplyVO {
	private String replyWriter,replyContent,replyTagName;
	private int replyCno,replyCCno,replyThumbs;
	private Date replyDate,replyUpdate;
	private char isShow;
}
