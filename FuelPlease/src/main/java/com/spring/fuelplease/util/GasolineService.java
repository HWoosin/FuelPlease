package com.spring.fuelplease.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.fuelplease.voCenter.GasolineVO;

public class GasolineService {
	

	public void readOpenStoresFromJson() {
		List<GasolineVO> storeList = new ArrayList<>();
		List<GasolineVO> filteredList = new ArrayList<GasolineVO>();

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode rootNode = objectMapper.readTree(new File("C:\\woosin\\FuelFuelPlease"));
			JsonNode dataNode = rootNode.get("DATA");

			if (dataNode.isArray()) {
				for (JsonNode node : dataNode) {
					GasolineVO spot = objectMapper.convertValue(node, GasolineVO.class);
					storeList.add(spot);
				}
				filteredList = storeList.stream().filter(spot -> spot.getTrdstatenm().equals("영업/정상"))
						.collect(Collectors.toList());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		for (GasolineVO vo : filteredList) {
//			mp.inputData(vo);
		}
	}
}
