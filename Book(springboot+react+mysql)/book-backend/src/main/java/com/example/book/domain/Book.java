package com.example.book.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String title;
	private String author;
	
//	public Object getTitle() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	public void setTitle(Object title) {
//		// TODO Auto-generated method stub
//		
//	}
//	public Object getAuthor() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	public void setAuthor(Object author) {
//		// TODO Auto-generated method stub
//		
//	}
}
