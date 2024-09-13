package com.example.test1.model;

import java.util.Date;

import lombok.Data;

@Data
public class Study {
    private int StudyId;
    private String StudyName;
    private String description;
    private Date creationDate;
    
    private int UserId;
    private String UserName;
    private String email;
    private String password;
	
}
