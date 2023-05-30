package com.spring.fuelplease.voCenter;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table infoboard (
	bno INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(300) NOT NULL,
    writer VARCHAR(50) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    w_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    u_date DATETIME DEFAULT NULL,
    hit INT default 0,
    rcd INT default 0
);
 */

@Getter
@Setter
@ToString
public class InfoBoardVO {

	private int bno;
	private String title;
	private String writer;
	private String content;
	private LocalDateTime wDate;
	private LocalDateTime uDate;
	private int hit; //조회 수
	private int rcd; //좋아요

	//하나의 게시물이 몇 개의 댓글을 포함하는가에 대한 값.
	private int replyCnt;







}
