package com.spring.fuelplease.voCenter;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@JsonIgnoreProperties(ignoreUnknown = true)
public class GasolineVO {
	
	private int gno; //기본 순서
	
    @JsonProperty("sitetel")
    private String siteTel; //소재지전화
    
    @JsonProperty("rdnwhladdr")
    private String rdnWhladdr; //도로명전체주소
    
    @JsonProperty("bplcnm")
    private String bplcNm; //사업장명
    
    @JsonProperty("trdstatenm")
    private String trdStatenm; //영업상태


}
