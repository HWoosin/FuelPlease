package com.spring.fuelplease.util;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FuelAvg {

	String key = "F230523134";

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
			String url = "https://www.opinet.co.kr/api/avgLastWeek.do?prodcd=B027&code=F230523134&sido=01&out=xml";

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
			String url = "https://www.opinet.co.kr/api/avgLastWeek.do?prodcd=D047&code=F230523134&sido=01&out=xml";

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
			String url = "https://www.opinet.co.kr/api/avgLastWeek.do?prodcd=B034&code=F230523134&sido=01&out=xml";

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

}