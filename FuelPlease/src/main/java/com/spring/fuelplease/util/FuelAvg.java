package com.spring.fuelplease.util;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@PropertySource("classpath:properties/fuelApiKey.properties")
public class FuelAvg {
	@Value("${ApiKey}")
	private String ApiKey;

	// tag값의 정보를 가져오는 함수
	public static String getTagValue(String tag, Element eElement) {

		// 결과를 저장할 result 변수 선언
		String result = "";
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		result = nlList.item(0).getTextContent();
		return result;
	}

	// tag값의 정보를 가져오는 함수
	public static String getTagValue(String tag, String childTag, Element eElement) {

		// 결과를 저장할 result 변수 선언
		String result = "";
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		for (int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {
			// result += nlList.item(i).getFirstChild().getTextContent() + " ";
			result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
		}
		return result;
	}

	//휘발유
	public String getGasAvg() {

		try {
			// parsing할 url 지정(API 키 포함해서)

			String url = "https://www.opinet.co.kr/api/avgLastWeek.do?prodcd=B027&code="+ApiKey+"&sido=01&out=xml";


			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// 제일 첫번째 태그
			doc.getDocumentElement().normalize();

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("OIL");

			int temp =0;
			Node nNode = nList.item(temp);
			Element eElement = (Element) nNode;
			for (temp = 0; temp < nList.getLength(); temp++) {


				log.info("휘발유 평균가격: " + getTagValue("PRICE", eElement));

			}
			return getTagValue("PRICE", eElement);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	//디젤
	public String getDisAvg() {

		try {
			// parsing할 url 지정(API 키 포함해서)

			String url = "https://www.opinet.co.kr/api/avgLastWeek.do?prodcd=D047&code="+ApiKey+"&sido=01&out=xml";
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// 제일 첫번째 태그
			doc.getDocumentElement().normalize();

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("OIL");

			int temp =0;
			Node nNode = nList.item(temp);
			Element eElement = (Element) nNode;
			for (temp = 0; temp < nList.getLength(); temp++) {
				log.info("경유 평균가격: " + getTagValue("PRICE", eElement));
			}
			return getTagValue("PRICE", eElement);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	//고급휘발유
	public String getPreGasAvg() {

		try {
			// parsing할 url 지정(API 키 포함해서)
			String url = "https://www.opinet.co.kr/api/avgLastWeek.do?prodcd=B034&code="+ApiKey+"&sido=01&out=xml";

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// 제일 첫번째 태그
			doc.getDocumentElement().normalize();

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("OIL");

			int temp =0;
			Node nNode = nList.item(temp);
			Element eElement = (Element) nNode;
			for (temp = 0; temp < nList.getLength(); temp++) {
				log.info("고급휘발유 평균가격: " + getTagValue("PRICE", eElement));

			}
			return getTagValue("PRICE", eElement);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//휘발유 최저가
	public List<String> getMinGasInfo() {
		
		try {
			// parsing할 url 지정(API 키 포함해서)
			String url = "https://www.opinet.co.kr/api/lowTop10.do?out=xml&code="+ApiKey+"&prodcd=B027&area=01&cnt=1";
			
			List<String> gasList = new ArrayList<>();
			
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			// 제일 첫번째 태그
			doc.getDocumentElement().normalize();
			
			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("OIL");
			
			int temp =0;
			Node nNode = nList.item(temp);
			Element eElement = (Element) nNode;
			for (temp = 0; temp < nList.getLength(); temp++) {
				log.info("최저가 휘발유 가격: " + getTagValue("PRICE", eElement));
				log.info("최저가 주유소 이름: " + getTagValue("OS_NM", eElement));
				log.info("최저가 주유소 주소(구만 얻어냄): " + getTagValue("VAN_ADR", eElement).split(" ",3)[1]); //구 만 잘라서 사용
				gasList.add(getTagValue("OS_NM", eElement));
				gasList.add(getTagValue("PRICE", eElement));
				gasList.add(getTagValue("VAN_ADR", eElement).split(" ",3)[1]);
			}
			return gasList;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//고급휘발유 최저가
		public List<String> getMinPreGasInfo() {
			
			try {
				// parsing할 url 지정(API 키 포함해서)
				String url = "https://www.opinet.co.kr/api/lowTop10.do?out=xml&code="+ApiKey+"&prodcd=B034&area=01&cnt=1";
				
				List<String> preGasList = new ArrayList<>();
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				// 제일 첫번째 태그
				doc.getDocumentElement().normalize();
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("OIL");
				
				int temp =0;
				Node nNode = nList.item(temp);
				Element eElement = (Element) nNode;
				for (temp = 0; temp < nList.getLength(); temp++) {
					log.info("최저가 고급휘발유 가격: " + getTagValue("PRICE", eElement));
					log.info("최저가 주유소 이름: " + getTagValue("OS_NM", eElement));
					log.info("최저가 주유소 주소(구만 얻어냄): " + getTagValue("VAN_ADR", eElement).split(" ",3)[1]); //구 만 잘라서 사용
					preGasList.add(getTagValue("OS_NM", eElement));
					preGasList.add(getTagValue("PRICE", eElement));
					preGasList.add(getTagValue("VAN_ADR", eElement).split(" ",3)[1]);
				}
				return preGasList;
				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		
		//경유 최저가
		public List<String> getMinDisInfo() {
			
			try {
				// parsing할 url 지정(API 키 포함해서)
				String url = "https://www.opinet.co.kr/api/lowTop10.do?out=xml&code="+ApiKey+"&prodcd=D047&area=01&cnt=1";
				
				List<String> disList = new ArrayList<>();
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				// 제일 첫번째 태그
				doc.getDocumentElement().normalize();
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("OIL");
				
				int temp =0;
				Node nNode = nList.item(temp);
				Element eElement = (Element) nNode;
				for (temp = 0; temp < nList.getLength(); temp++) {
					log.info("최저가 경유 가격: " + getTagValue("PRICE", eElement));
					log.info("최저가 주유소 이름: " + getTagValue("OS_NM", eElement));
					log.info("최저가 주유소 주소(구만 얻어냄): " + getTagValue("VAN_ADR", eElement).split(" ",3)[1]); //구 만 잘라서 사용
					disList.add(getTagValue("OS_NM", eElement));
					disList.add(getTagValue("PRICE", eElement));
					disList.add(getTagValue("VAN_ADR", eElement).split(" ",3)[1]);
				}
				return disList;
				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		
		
	
}