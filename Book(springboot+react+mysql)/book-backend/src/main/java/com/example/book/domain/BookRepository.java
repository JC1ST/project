package com.example.book.domain;

import org.springframework.data.jpa.repository.JpaRepository;

// @Repository
// JpaRepository를 extends하면 @Repository 생략 가능
// JpaRepository는 CRUD 함수 보유
public interface BookRepository extends JpaRepository<Book, Long>{

}
