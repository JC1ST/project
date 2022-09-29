import React from "react";
import { useState, useRef } from "react";

const Gugudan = () => {
  const [first, setFirst] = useState(Math.ceil(Math.random() * 9));
  const [second, setSecond] = useState(Math.ceil(Math.random() * 9));
  const [value, setValue] = useState("");
  const [result, setResult] = useState("");
  const inputEl = useRef(null);

  const onSubmitForm = (e) => {
    e.preventDefault();
    if (parseInt(value) === first * second) {
      setResult("정답 : " + value);
      setFirst(Math.ceil(Math.random() * 9));
      setSecond(Math.ceil(Math.random() * 9));
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
      <div>
        {first} * {second} = ?
      </div>
      <br />
      <form onSubmit={onSubmitForm}>
        <input ref={inputEl} type="number" value={value} onChange={(e) => setValue(e.target.value)} />
        &nbsp;&nbsp;
        <button>입력!</button>
      </form>
      <br />
      <div id="result">{result}</div>
    </>
  );
};

export default Gugudan;
