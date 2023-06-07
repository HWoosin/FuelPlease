package com.spring.fuelplease.voCenter;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table caraccount(
	acno int primary key auto_increment,
   writer varchar(100),
   `year` int,
   `month` int,
   `day` int,
   `type` varchar(100),
   price int    
);
*/


@Getter
@Setter
@ToString
public class CarAccountVO {

	private int acno;
	private String writer;
	private int year;
	private int month;
	private int day;
	private String type;
	private int price;
	private String note;
	
	private List<CarAccountVO> userAccountList;
	
}
