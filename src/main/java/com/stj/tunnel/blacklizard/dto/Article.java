package com.stj.tunnel.blacklizard.dto;

import java.util.Map;

import org.springframework.web.util.HtmlUtils;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Article {
	private int id;
	private String regDate;
	private String updateDate;
	private int boardId;
	private int memberId;
	private String title;
	private String body;
	
	private Map<String, Object> extra;
	
	// xss 이슈
		@JsonProperty("forPrintTitle")
		public String getForPrintTitle() {
			String titleForPrint = HtmlUtils.htmlEscape(title);
			
			return titleForPrint;
		}
		
		@JsonProperty("forPrintBody")
		public String getForPrintBody() {
			String bodyForPrint = HtmlUtils.htmlEscape(body);
			bodyForPrint = bodyForPrint.replace("\n",  "<br>");
			
			return bodyForPrint;
		}
}
