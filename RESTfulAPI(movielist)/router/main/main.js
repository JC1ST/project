var express = require("express");
var app = express();
var router = express.Router();
var path = require("path");

// main page는 login이 될 때만(세션 정보가 있을 때만) 접근 가능하게
router.get("/", function (req, res) {
  var id = req.user;
  if (!id) res.render("login.ejs");
  res.render("main.ejs", { id: id });
});

module.exports = router;
