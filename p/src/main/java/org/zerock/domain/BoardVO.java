package org.zerock.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
public class BoardVO {

	private Integer bno;
	private String title, content, regdate, writer;
	private Date updatedate;

}