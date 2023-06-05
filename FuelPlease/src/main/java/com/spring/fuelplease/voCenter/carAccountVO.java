package com.spring.fuelplease.voCenter;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table calendar(
	acno INT primary key auto_increment,
	content varchar(50),
	writer varchar(50),
	allDay int
);
 */


@Getter
@Setter
@ToString
public class carAccountVO {
	
	private int acno;
	private String content;
	private String writer;
	private LocalDateTime allDay;
	
}
