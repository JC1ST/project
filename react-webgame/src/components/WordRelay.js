import React from "react";
import { useState, useRef } from "react";

const WordRelay = () => {
  const [word, setWord] = useState("기러기");
  const [value, setValue] = useState("");
  const [result, setResult] = useState("");
  const inputEl = useRef(null);

  const onSubmitForm = (e) => {
    e.preventDefault();
    if (word[word.length - 1] === value[0]) {
      setResult("딩동댕");
      setWord(value);
      setValue("");
      inputEl.current.focus();
    } else {
      setResult("땡");
      setValue("");
      inputEl.current.focus();
    }
  };

  return (
    <>
      <div>{word}</div>
      <br />
      <form onSubmit={onSubmitForm}>
        <input ref={inputEl} value={value} onChange={(e) => setValue(e.currentTarget.value)} />
        &nbsp;&nbsp;
        <button disabled={!value}>입력!</button>
      </form>
      <br />
      <div>{result}</div>
    </>
  );
};

export default WordRelay;
