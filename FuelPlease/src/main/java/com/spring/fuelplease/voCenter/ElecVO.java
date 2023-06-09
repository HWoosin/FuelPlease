package com.spring.fuelplease.voCenter;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@JsonIgnoreProperties(ignoreUnknown = true)
public class ElecVO {
	
	private int eno; //기본 순서
	
    @JsonProperty("charging_capacity")
    private String chargingCapacity; //충전용량
    
    @JsonProperty("utztn_psblty_tm")
    private String utztnPsbltyTm; //이용가능시간
    
    @JsonProperty("addr")
    private String addr; //도로명전체주소
    
    @JsonProperty("charger_type")
    private String chargerType; //충전 타입


}
