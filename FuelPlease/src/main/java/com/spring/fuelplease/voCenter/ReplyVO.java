package com.spring.fuelplease.voCenter;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
/*
CREATE TABLE inforeply(
	rno INT PRIMARY KEY AUTO_INCREMENT,
    bno INT,
    
    foreign key (bno) 
    references infoboard(bno)
    on delete cascade,
    
    reply VARCHAR(1000),
    reply_id VARCHAR(50),
    relpy_pw VARCHAR(50),
    relpy_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME DEFAULT NULL
);
 */

@Getter
@Setter
@ToString
public class ReplyVO {

	private int rno;
	private int bno;
	
	private String reply;
	private String replyId;
	private String replyPw;
	private LocalDateTime replyDate;
	private LocalDateTime updateDate;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
