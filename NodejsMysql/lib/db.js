var mysql = require("mysql");

var db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "kjc0207",
  database: "opentutorials",
});
db.connect();

// 외부에서 쓸 수 있도록 export
module.exports = db;

// .gitignore에 추가
