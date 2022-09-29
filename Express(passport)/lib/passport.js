var db = require("../lib/db");
var bcrypt = require("bcrypt");
var shortid = require("shortid");

module.exports = function (app) {
  // passport 설치
  var passport = require("passport"),
    LocalStrategy = require("passport-local").Strategy,
    GoogleStrategy = require("passport-google-oauth").OAuth2Strategy,
    FacebookStrategy = require("passport-facebook").Strategy;

  // passport 사용, sesseion에 사용
  app.use(passport.initialize());
  app.use(passport.session());

  // session 처리 방법
  // 로그인 성공 시 1회만 호출, 사용자를 session store에 저장
  passport.serializeUser(function (user, done) {
    console.log("serializeUser", user);
    done(null, user.id);
  });

  // 그 저장된 데이터를 기준으로 필요한 정보를 조회할 때 사용
  passport.deserializeUser(function (id, done) {
    var user = db
      .get("users")
      .find({
        id: id,
      })
      .value();
    console.log("deserializeUser", id, user);
    done(null, user);
  });

  // 사용자 로그인 성공, 실패 여부
  passport.use(
    new LocalStrategy(
      {
        usernameField: "email",
        passwordField: "pwd",
      },
      function (email, password, done) {
        console.log("LocalStrategy", email, password);
        var user = db
          .get("users")
          .find({
            email: email,
          })
          .value();
        if (user) {
          bcrypt.compare(password, user.password, function (err, result) {
            if (result) {
              return done(null, user, {
                message: "Welcome.",
              });
            } else {
              return done(null, false, {
                message: "Password is not correct.",
              });
            }
          });
        } else {
          return done(null, false, {
            message: "There is no email.",
          });
        }
      }
    )
  );

  var googleCredentials = require("../config/google.json");
  passport.use(
    new GoogleStrategy(
      {
        clientID: googleCredentials.web.client_id,
        clientSecret: googleCredentials.web.client_secret,
        callbackURL: googleCredentials.web.redirect_uris[0],
      },
      function (accessToken, refreshToken, profile, done) {
        var email = profile.emails[0].value;
        var user = db.get("users").find({ email: email }).value();
        if (user) {
          user.googleId = profile.id;
          db.get("users").find({ id: user.id }).assign(user).write();
        } else {
          user = {
            id: shortid.generate(),
            email: email,
            displayName: profile.displayName,
            googleId: profile.id,
          };
          db.get("users").push(user).write();
        }
        done(null, user);
      }
    )
  );

  app.get(
    "/auth/google",
    passport.authenticate("google", {
      scope: ["https://www.googleapis.com/auth/plus.login", "email"],
    })
  );

  app.get(
    "/auth/google/callback",
    passport.authenticate("google", {
      failureRedirect: "/auth/login",
    }),
    function (req, res) {
      res.redirect("/");
    }
  );

  var facebookCredentials = require("../config/facebook.json");
  passport.use(
    new FacebookStrategy(facebookCredentials, function (accessToken, refreshToken, profile, done) {
      console.log("FacebookStrategy", accessToken, refreshToken, profile);
    })
  );

  app.get("/auth/facebook", passport.authenticate("facebook"));
  app.get(
    "/auth/facebook/callback",
    passport.authenticate("facebook", {
      successRedirect: "/",
      failureRedirect: "/auth/login",
    })
  );

  return passport;
};
