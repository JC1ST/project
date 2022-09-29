var express = require("express");
var app = express();
var router = express.Router();
var path = require("path");
var mysql = require("mysql");

// database setting
var connection = mysql.createConnection({
  host: "localhost",
  port: "3306",
  user: "root",
  password: "kjc0207",
  database: "jsman",
});
connection.connect();

router.get("/list", function (req, res) {
  res.render("movie.ejs");
});

// /movie   GET 방식
router.get("/", function (req, res) {
  var responseData = {};

  var query = connection.query("select title from movie", function (err, rows) {
    if (err) throw err;
    if (rows.length) {
      responseData.result = "1";
      responseData.data = rows;
    } else {
      responseData.result = "0";
    }
    res.json(responseData);
  });
});

// /movie   POST 방식
router.post("/", function (req, res) {
  var title = req.body.title;
  var type = req.body.type;
  var grade = req.body.grade;
  var actor = req.body.actor;

  var sql = { title, type, grade, actor };
  var query = connection.query("insert into movie set ?", sql, function (err, rows) {
    if (err) throw err;
    return res.json({ result: 1 });
  });
});

// /movie/:title   GET 방식
router.get("/:title", function (req, res) {
  var title = req.params.title;

  var responseData = {};

  var query = connection.query("select * from movie where title = ?", [title], function (err, rows) {
    if (err) throw err;
    if (rows[0]) {
      responseData.result = "1";
      responseData.data = rows;
    } else {
      responseData.result = "0";
    }
    res.json(responseData);
  });
});

// /movie/:title   DELETE 방식
router.delete("/:title", function (req, res) {
  var title = req.params.title;

  var responseData = {};

  var query = connection.query("delete from movie where title = ?", [title], function (err, rows) {
    if (err) throw err;

    if (rows.affectedRows > 0) {
      responseData.result = "1";
      responseData.data = title;
    } else {
      responseData.result = "0";
    }
    res.json(responseData);
  });
});

// /movie/:id   PUT 방식
router.put("/:id", function (req, res) {});

// /movie?min=9   GET 방식
router.get("/", function (req, res) {});

// router.post("/form", function (req, res) {
//   res.render("email.ejs", { email: req.body.email });
// });

// router.post("/ajax", function (req, res) {
//   var email = req.body.email;
//
// });

module.exports = router;
