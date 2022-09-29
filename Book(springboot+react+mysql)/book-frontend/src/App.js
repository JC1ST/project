import React from 'react';
import { Container } from 'react-bootstrap';
import { Route, Routes } from 'react-router-dom';

import Header from './components/Header';

import LoginForm from './pages/user/LoginForm';
import JoinForm from './pages/user/JoinForm';
import Detail from './pages/book/Detail';
import Home from './pages/book/Home';
import SaveForm from './pages/book/SaveForm';
import UpdateForm from './pages/book/UpdateForm';

import 'bootstrap/dist/css/bootstrap.min.css';

// <Container fluid> 꽉찬 화면
function App() {
  return (
    <div>
      <Header />
      <Container style={{ marginTop: '20px' }}>
        <Routes>
          <Route path="/" exact={true} element={<Home />}></Route>
          <Route path="/saveForm" exact={true} element={<SaveForm />}></Route>
          <Route path="/book/:id" exact={true} element={<Detail />}></Route>
          <Route path="/loginForm" exact={true} element={<LoginForm />}></Route>
          <Route path="/joinForm" exact={true} element={<JoinForm />}></Route>
          <Route
            path="/updateForm/:id"
            exact={true}
            element={<UpdateForm />}
          ></Route>
        </Routes>
      </Container>
    </div>
  );
}

export default App;
