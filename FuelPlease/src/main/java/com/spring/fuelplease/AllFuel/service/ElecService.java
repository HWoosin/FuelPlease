package com.spring.fuelplease.AllFuel.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.fuelplease.AllFuel.mapper.IElecMapper;
import com.spring.fuelplease.voCenter.ElecVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ElecService implements IElecService {

	@Autowired
	private IElecMapper mp;

	@Override
	public void inputElec() {
		List<ElecVO> storeList = new ArrayList<>();

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode rootNode = objectMapper.readTree(new File("C:\\Work\\mid_project_fuel\\FuelPlease_MUN\\seoul_elec.json"));
			JsonNode dataNode = rootNode.get("DATA");

			if (dataNode.isArray()) {
				for (JsonNode node : dataNode) {
					ElecVO spot = objectMapper.convertValue(node, ElecVO.class);
					storeList.add(spot);
					//여기서 로그 찍을 생각 마세요. 난 분명히 말했어.
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		for (ElecVO vo : storeList) {
			mp.inputElec(vo);
		}
	}

	@Override
	public List<String> findElec(String keyword) {
		log.info(keyword);
		return mp.findElec(keyword);
	}

	@Override
	public ElecVO getElecInfo(String loadId) {
		log.info(loadId);
		return mp.getElecInfo(loadId);
	}
	
	

}
