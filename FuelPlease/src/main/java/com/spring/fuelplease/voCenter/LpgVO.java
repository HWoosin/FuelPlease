package com.spring.fuelplease.voCenter;

import lombok.ToString;

import lombok.Setter;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;

@Getter
@Setter
@ToString
@JsonIgnoreProperties(ignoreUnknown = true)
public class LpgVO {
	
	private int lno; //기본 순서
	
	@JsonProperty("lpg_bsin_sort_code")
    private String lpgBsinSortCode; //소재지전화
    
    @JsonProperty("site_addr")
    private String siteAddr; //도로명전체주소
    
    @JsonProperty("off_telno")
    private String offTelno; //사업장명
    
    @JsonProperty("trnm_nm")
    private String trnmNm; //영업상태
	
	
	

}
