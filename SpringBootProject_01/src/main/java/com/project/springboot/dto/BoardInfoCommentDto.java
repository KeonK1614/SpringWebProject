package com.project.springboot.dto;

import lombok.Data;

@Data
public class BoardInfoCommentDto {
	private int idx;
	private String writer;
	private String content;
	private String targetId;
	private int refGroup;
	private java.sql.Date date;
}
