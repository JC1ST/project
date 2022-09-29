package com.example.book.web;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.transaction.annotation.Transactional;

import com.example.book.domain.Book;
import com.example.book.domain.BookRepository;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

// 통합 테스트
// WebEnvironment.MOCK => 모의 웹 환경
// WebEnvironment.RANDOM_PORT => 실제 웹 환경

@Slf4j
@Transactional // 각각의 함수가 종료될 때마다 롤백해주는 어노테이션
@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class BookControllerIntegreTest {

	@Autowired
	private MockMvc mockMvc;
	
	@Autowired
	private BookRepository bookRepository;
	
	@Autowired
	private EntityManager entityManager;
	
	@BeforeEach
	public void init() {
		entityManager.createNativeQuery("ALTER TABLE book AUTO_INCREMENT = 1").executeUpdate();
	}
	
	@Test
	public void save_테스트() throws Exception {
		log.info("save_테스트() 시작 =====================");
		
		// given (테스르 준비)
		Book book = new Book(null, "스프링 따라하기", "kim");
		String content = new ObjectMapper().writeValueAsString(book);
		
		// when (테스트 실행)
		ResultActions resultAction = mockMvc.perform(post("/book")
				.contentType(MediaType.APPLICATION_JSON)
				.content(content)
				.accept(MediaType.APPLICATION_JSON));
		
		// then (검증)
		resultAction
			.andExpect(status().isCreated()) // 201
			.andExpect(jsonPath("$.title").value("스프링 따라하기"))
			.andDo(MockMvcResultHandlers.print());
	}
	
	@Test
	public void findAll_테스트() throws Exception {
		// given
		List<Book> books = new ArrayList<>();
		books.add(new Book(null, "스프링부트 따라하기", "kim"));
		books.add(new Book(null, "리액트 따라하기", "lee"));
		books.add(new Book(null, "JUnit 따라하기", "park"));
		
		bookRepository.saveAll(books);
		
		// when
		ResultActions resultAction = mockMvc.perform(get("/book")
				.accept(MediaType.APPLICATION_JSON));
		
		// then
		resultAction
			.andExpect(status().isOk()) // 200
			.andExpect(jsonPath("$", Matchers.hasSize(3)))
			.andExpect(jsonPath("$.[2].title").value("JUnit 따라하기"))
			.andDo(MockMvcResultHandlers.print());
	}
	
	@Test
	public void findById_테스트() throws Exception {
		// given
		Long id = 2L;
		
		List<Book> books = new ArrayList<>();
		books.add(new Book(null, "스프링부트 따라하기", "kim"));
		books.add(new Book(null, "리액트 따라하기", "lee"));
		books.add(new Book(null, "JUnit 따라하기", "park"));
		
		bookRepository.saveAll(books);
		
		//when
		ResultActions resultAction = mockMvc.perform(get("/book/{id}", id)
				.accept(MediaType.APPLICATION_JSON));
		
		// then
		resultAction
			.andExpect(status().isOk()) // 200
			.andExpect(jsonPath("$.title").value("리액트 따라하기"))
			.andDo(MockMvcResultHandlers.print());
	}
	
	@Test
	public void update_테스트() throws Exception {
		// given
		Long id = 3L;
		
		List<Book> books = new ArrayList<>();
		books.add(new Book(null, "스프링부트 따라하기", "kim"));
		books.add(new Book(null, "리액트 따라하기", "lee"));
		books.add(new Book(null, "JUnit 따라하기", "park"));
		
		bookRepository.saveAll(books);
		
		Book book = new Book(null, "C++ 따라하기", "kang");
		String content = new ObjectMapper().writeValueAsString(book);
		
		// when
		ResultActions resultAction = mockMvc.perform(put("/book/{id}", id)
				.contentType(MediaType.APPLICATION_JSON)
				.content(content)
				.accept(MediaType.APPLICATION_JSON));
		
		// then
		resultAction
			.andExpect(status().isOk()) // 200
			.andExpect(jsonPath("$.title").value("C++ 따라하기"))
			.andDo(MockMvcResultHandlers.print());
	}
	
	@Test
	public void delete_테스트() throws Exception {
		// given
		Long id = 1L;
		
		List<Book> books = new ArrayList<>();
		books.add(new Book(null, "스프링부트 따라하기", "kim"));
		books.add(new Book(null, "리액트 따라하기", "lee"));
		books.add(new Book(null, "JUnit 따라하기", "park"));
		
		bookRepository.saveAll(books);
		
		// when
		ResultActions resultAction = mockMvc.perform(delete("/book/{id}", id)
				.accept(MediaType.TEXT_PLAIN));
		
		// then
		resultAction
			.andExpect(status().isOk()) // 200
			.andDo(MockMvcResultHandlers.print());
		
		MvcResult requestResult = resultAction.andReturn();
		String result = requestResult.getResponse().getContentAsString();
		
		assertEquals("ok", result);
	}
}
