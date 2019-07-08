package com.increpas.domain;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Data;

@Data
public class ReplyVO {
	private String replyWriter,replyContent;
	private int replyBno,replyCno,replyThumbs,cnt;
	private Date replyDate,replyUpdate;
	private char isShow;
}
