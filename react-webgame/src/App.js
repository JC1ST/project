import "./App.css";
import { BrowserRouter, Routes, Route, NavLink } from "react-router-dom";
import GameMatcher from "./GameMatcher";

function App() {
  return (
    <BrowserRouter>
      <div className="App-header">
        <NavLink to="/game/gugudan" style={{ textDecoration: "none" }}>
          구구단
        </NavLink>
        <NavLink to="/game/lotto-generator" style={{ textDecoration: "none" }}>
          로또
        </NavLink>
        <NavLink to="/game/minesearch" style={{ textDecoration: "none" }}>
          지뢰찾기
        </NavLink>
        <NavLink to="/game/number-baseball" style={{ textDecoration: "none" }}>
          숫자야구
        </NavLink>
        <NavLink to="/game/responsecheck" style={{ textDecoration: "none" }}>
          반응속도 테스트
        </NavLink>
        <NavLink to="/game/rock-scissors-paper" style={{ textDecoration: "none" }}>
          가위바위보
        </NavLink>
        <NavLink to="/game/tic-tac-toe" style={{ textDecoration: "none" }}>
          틱택토
        </NavLink>
        <NavLink to="/game/wordrelay" style={{ textDecoration: "none" }}>
          끝말잇기
        </NavLink>
        <NavLink to="/game/index" style={{ textDecoration: "none" }}>
          게임 매쳐
        </NavLink>
      </div>
      <br />
      <br />
      <div className="App">
        <Routes>
          <Route path="/" element={<GameMatcher />} />
          <Route path="/game/*" element={<GameMatcher />} />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;
