package com.spring.fuelplease.AllFuel.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.fuelplease.AllFuel.mapper.IGasolineMapper;
import com.spring.fuelplease.voCenter.GasolineVO;
import com.spring.fuelplease.voCenter.LpgVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class GasolineService implements IGasolineService{

	@Autowired
	private IGasolineMapper mp;

	@Override
	public void inputGasoline() {
		List<GasolineVO> storeList = new ArrayList<>();
		List<GasolineVO> filteredList = new ArrayList<GasolineVO>();

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode rootNode = objectMapper.readTree(new File("C:\\Work\\mid_project_fuel\\FuelPlease_MUN\\seoul_gasoline.json"));
			JsonNode dataNode = rootNode.get("DATA");

			if (dataNode.isArray()) {
				for (JsonNode node : dataNode) {
					GasolineVO spot = objectMapper.convertValue(node, GasolineVO.class);
					storeList.add(spot);
					//여기서 로그 찍을 생각 마세요. 난 분명히 말했어.
				}
				filteredList = storeList.stream().filter(spot -> spot.getTrdStatenm().equals("영업/정상"))
						.collect(Collectors.toList());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		for (GasolineVO vo : filteredList) {
			mp.inputGasoline(vo);
		}
	}
	
	@Override
	public List<String> findGasoline(String keyword) {
		log.info(keyword);
		return mp.findGasoline(keyword);
	}
	
	@Override
	public GasolineVO getGasolineInfo(String loadId) {
		log.info(loadId);
		return mp.getGasolineInfo(loadId);
	}

	
}
