package com.project.springboot.dto;

import lombok.Data;

@Data
public class BoardInfoCommentDto {
	private int cIdx;
	private String writer;
	private String commentText;
	private String refGroup;
	private java.sql.Date regidate;
	private String deleted;
}
