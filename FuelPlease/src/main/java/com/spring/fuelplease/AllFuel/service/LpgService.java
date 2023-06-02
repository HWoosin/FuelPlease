package com.spring.fuelplease.AllFuel.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.fuelplease.AllFuel.mapper.ILpgMapper;
import com.spring.fuelplease.voCenter.ElecVO;
import com.spring.fuelplease.voCenter.LpgVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LpgService implements ILpgService {

	@Autowired
	private ILpgMapper mp;

	@Override
	public void inputLpg() {
		List<LpgVO> filteredList = new ArrayList<>();
		List<LpgVO> storeList = new ArrayList<>();

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode rootNode = objectMapper.readTree(new File("C:\\Work\\fuelplease\\FuelPlease\\seoul_lpg.json"));
			JsonNode dataNode = rootNode.get("DATA");

			if (dataNode.isArray()) {
				for (JsonNode node : dataNode) {
					LpgVO spot = objectMapper.convertValue(node, LpgVO.class);
					storeList.add(spot);
					//여기서 로그 찍을 생각 마세요. 난 분명히 말했어.
				}
				filteredList = storeList.stream().filter(spot -> spot.getTrnmNm().equals("판매사업"))
						.collect(Collectors.toList());
				filteredList = storeList.stream().filter(spot -> spot.getTrnmNm().equals("충전사업"))
						.collect(Collectors.toList());

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		for (LpgVO vo : storeList) {
			mp.inputLpg(vo);
		}
	}

	@Override
	public List<String> findLpg(String keyword) {
		log.info(keyword);
		return mp.findLpg(keyword);
	}




}
