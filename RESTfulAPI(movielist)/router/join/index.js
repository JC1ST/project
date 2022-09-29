var express = require("express");
var app = express();
var router = express.Router();
var path = require("path");
var mysql = require("mysql");
const passport = require("passport");
var LocalStrategy = require("passport-local").Strategy;

// database setting
var connection = mysql.createConnection({
  host: "localhost",
  port: "3306",
  user: "root",
  password: "kjc0207",
  database: "jsman",
});
connection.connect();

router.get("/", function (req, res) {
  var msg;
  var errMsg = req.flash("error");
  if (errMsg) msg = errMsg;
  res.render("join.ejs", { message: msg });
});

passport.serializeUser(function (user, done) {
  done(null, user.id);
});

passport.deserializeUser(function (id, done) {
  done(null, id);
});

passport.use(
  "local-join",
  new LocalStrategy(
    {
      usernameField: "email",
      passwordField: "password",
      passReqToCallback: true,
    },
    function (req, email, password, done) {
      var query = connection.query("select * from user where email=?", [email], function (err, rows) {
        if (err) return done(err);
        if (rows.length) {
          return done(null, false, { message: "your email is already used" });
        } else {
          var sql = { email: email, pw: password };
          var query = connection.query("insert into user set ?", sql, function (err, rows) {
            if (err) throw err;
            return done(null, { email: email, id: rows.insertId });
          });
        }
      });
    }
  )
);

router.post(
  "/",
  passport.authenticate("local-join", {
    successRedirect: "/main",
    failureRedirect: "/join",
    failureFlash: true,
  })
);

// router.post("/", function (req, res) {
//   var body = req.body;
//   var email = body.email;
//   var name = body.name;
//   var password = body.password;

//   var sql = { email: email, name: name, pw: password };

//   var query = connection.query("insert into user set ?", sql, function (err, rows) {
//     if (err) {
//       throw err;
//     } else res.render("welcome.ejs", { name: name, id: rows.insertId });
//   });
// });

module.exports = router;
