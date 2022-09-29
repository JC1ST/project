var mysql = require("mysql");

// 정보 암호화를 위해 비어둠
var db = mysql.createConnection({
  host: "",
  user: "",
  password: "",
  database: "",
});
db.connect();

module.exports = db;
