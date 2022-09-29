import React, { memo } from "react";

const Ball = memo(({ number }) => {
  let background;
  if (number < 10) {
    background = "#FF6663"; // pastel red
  } else if (number < 20) {
    background = "#FEB144"; // pastel orange
  } else if (number < 30) {
    background = "#FDFD97"; // pastel yellow
  } else if (number < 40) {
    background = "#9EE09E"; // pastel green
  } else {
    background = "#9EC1CF"; // pastel blue
  }
  return (
    <div className="ball" style={{ background }}>
      {number}
    </div>
  );
});

export default Ball;
