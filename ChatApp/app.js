/* express 모듈 사용 */
const express = require("express");

/* http 모듈은 npm install 하지 않아도 사용 가능(기본 내장 모듈) */
const http = require("http");

/* http 모듈은 서버 생성 메소드(createServer)를 제공하며 파라미터로 express를 넘겨줌
   server 변수에 담은 이유는 생성된 서버를 제어하기 위해 */
const app = express();
const server = http.createServer(app);

/* fs도 기본 내장 모듈(파일을 읽어서 사용자가 볼 수 있게) */
const fs = require("fs");
const io = require("socket.io")(server);

/* src 폴더 접근 권한 설정(필수) */
app.use(express.static("src"));

/* 사용자가 사이트에 접근할 때 get과 post 방식으로 접근
   첫 번째 파라미터인 '/'는 사용자가 접근할 url의 경로
   접근 성공 시 function 실행
   req(요청), res(응답) */
app.get("/", function (req, res) {
  fs.readFile("./src/index.html", (err, data) => {
    if (err) throw err;

    res
      .writeHead(200, {
        "Content-Type": "text/html",
      })
      .write(data)
      .end();
  });
});

/* 소켓이 연결되면 'connection' 이벤트 호출됨 */
io.sockets.on("connection", function (socket) {
  socket.on("newUserConnect", function (name) {
    socket.name = name;

    io.sockets.emit("updateMessage", {
      name: "SERVER",
      message: name + "님이 접속했습니다.",
    });
  });

  socket.on("disconnect", function () {
    io.sockets.emit("updateMessage", {
      name: "SERVER",
      message: socket.name + "님이 퇴장했습니다.",
    });
  });

  socket.on("sendMessage", function (data) {
    data.name = socket.name;
    io.sockets.emit("updateMessage", data);
  });
});

/* 생성된 서버를 사용자가 웹에서 확인 */
server.listen(8080, function () {
  console.log("서버 실행 중..");
});
