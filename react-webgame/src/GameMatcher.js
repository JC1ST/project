import React from "react";
import Gugudan from "./components/Gugudan";
import Lotto from "./components//Lotto/Lotto";
import MineSearch from "./components/MineSearch/MineSearch";
import NumberBaseball from "./components/NumberBaseball/NumberBaseball";
import ResponseCheck from "./components/ResponseCheck";
import RSP from "./components/RSP/RSP";
import TicTacToe from "./components/TicTacToe/TicTacToe";
import WordRelay from "./components/WordRelay";
import { Routes, Route } from "react-router-dom";

const GameMatcher = () => {
  return (
    <Routes>
      <Route path="gugudan" element={<Gugudan />} />
      <Route path="lotto-generator" element={<Lotto />} />
      <Route path="minesearch" element={<MineSearch />} />
      <Route path="number-baseball" element={<NumberBaseball />} />
      <Route path="responsecheck" element={<ResponseCheck />} />
      <Route path="rock-scissors-paper" element={<RSP />} />
      <Route path="tic-tac-toe" element={<TicTacToe />} />
      <Route path="wordrelay" element={<WordRelay />} />
      <Route path="*" element={<div>일치하는 게임이 없습니다.</div>} />
    </Routes>
  );
};

export default GameMatcher;
