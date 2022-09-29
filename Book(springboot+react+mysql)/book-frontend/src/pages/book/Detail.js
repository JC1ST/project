import React, { useEffect, useState } from 'react';
import { Button } from 'react-bootstrap';
import { useNavigate, useParams } from 'react-router-dom';

const Detail = (props) => {
  const navigate = useNavigate();

  const propsParam = useParams();
  const id = propsParam.id;

  const [book, setBook] = useState({
    id: '',
    title: '',
    author: '',
  });

  useEffect(() => {
    fetch('http://localhost:8080/book/' + id)
      .then((res) => res.json())
      .then((res) => {
        setBook(res);
      });
  }, [id]);

  const updateBook = () => {
    navigate('/updateForm/' + id);
  };

  const deleteBook = () => {
    fetch('http://localhost:8080/book/' + id, {
      method: 'DELETE',
    })
      .then((res) => res.text())
      .then((res) => {
        if (res === 'ok') {
          navigate('/');
        } else {
          alert('삭제 실패');
        }
      });
  };

  return (
    <div>
      <h1>책 상세보기</h1>
      <Button onClick={updateBook}>수정</Button>{' '}
      <Button variant="danger" onClick={deleteBook}>
        삭제
      </Button>
      <hr />
      <h1>Title : {book.title}</h1>
      <h4>Author : {book.author}</h4>
    </div>
  );
};

export default Detail;
