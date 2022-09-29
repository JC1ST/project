var mysql = require("mysql");

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "kjc0207",
  database: "opentutorials",
});

connection.connect();

connection.query("SELECT * FROM topic", function (err, results, fields) {
  if (err) {
    console.log(err);
  }
  console.log(results);
});

connection.end();
