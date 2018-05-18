const express = require("express");
const nunjucks = require("nunjucks");
const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const getEvents = require("./handlers/getEvents");
const getExpenses = require("./handlers/getExpenses");
const getSignup = require("./handlers/getSignup");
const postExpense = require("./handlers/postExpense");
const updateExpense = require("./handlers/updateExpense");
const usersFromDB = require("./handlers/getUsersFromDB");
const postEvent = require("./handlers/postEvent");
const postParticpant = require("./handlers/postParticipant");
const getSumup = require("./handlers/getSumup");

const app = express()

const port = process.env.PORT || 3000;

app.use(require("body-parser").urlencoded({ extended: true }));
app.use(require("cookie-parser")());
app.use(
  require("express-session")({
    secret: "MPàç8IjnHy6TrfCdeZsXCvbnjKLp1230ç8è53é",
    resave: false,
    saveUninitialized: false
  })
);

// Initialize Passport and restore authentication state,
// if any, from the session.
app.use(passport.initialize());
app.use(passport.session());

passport.serializeUser(function(user, callback) {
  return callback(null, user.email);
});
passport.deserializeUser(function(email, callback) {
  //console.log(` >deserializeUser: ${email}`)
  if (email) {
    usersFromDB.findUserByEmail(email)
    .then(user => {
    callback(null, user);
    })
    .catch(function(error) {
      console.warn(` >deserializeUser: ${error}`);
      callback(error);
    });
  }
});
passport.use(
  new LocalStrategy(function(email, password, callback) {
    usersFromDB.validateUser(email, password)
      .then(user => {
        callback(null, user);
      })
      .catch(error => {
        console.warn(` >LocalStrategy: ${error}`);
        callback(error);
      });
  })
);

//nunjucks config
nunjucks.configure("views", {
  autoescape: true,
  express: app,
  watch: true
});
app.set("views", __dirname + "/views");
app.set("view engine", "njk");

//rooting

//signup
app.get("/signup", function (request, result) {
  result.render("signup");
});

app.post("/signupUser", getSignup.signup);

app.get("/accountexisted", function (request, result) {
  result.render("accountexisted");
});

// home page where you will login
app.get(
  "/",
    require("connect-ensure-login").ensureLoggedIn("/login"),
    function(request, result) {
      result.redirect("/userevents");
    }
);
app.get(
  "/login",
  function (request, result) {
  result.render("home", {errorMesage: request.query.errormessage});}
);
app.post("/",
  passport.authenticate("local", { failureRedirect: "/login?errormessage=wrong login or password"}),
  function(request, result) {
    result.redirect("/userevents");
  }
);
app.get("/logout", function(request, result) {
  request.logout();
  result.redirect("/login");
});

app.get(
  "/userevents",
  require("connect-ensure-login").ensureLoggedIn("/"),
  getEvents
);
app.post(
  "/userevents/newExpenses",
  require("connect-ensure-login").ensureLoggedIn("/"),
  postEvent
);
app.post(
  "/userevents/newParticipant",
  require("connect-ensure-login").ensureLoggedIn("/"),
  postParticpant
);

app.get(
  "/event/:id",
  require("connect-ensure-login").ensureLoggedIn("/"),
  getExpenses
);

app.post(
  "/event/:id/submitexpense",
  require("connect-ensure-login").ensureLoggedIn("/"),
  postExpense
);

app.post(
  "/event/:id/updateexpense",
  require("connect-ensure-login").ensureLoggedIn("/"),
  updateExpense
);

app.get(
  "/event/:id/sumup",
  // require("connect-ensure-login").ensureLoggedIn("/"),
  getSumup
);

//public ressource
app.use(express.static("public"));

//errors management
app.use(function (request, result, next) {
  result.status(404).render("template_error");
});

app.use(function (error, request, result, next) {
  console.warn(` >handle ERROR 500: ${error}`);
  switch (error) {
    case "wrong login or password":
        result.status(500).redirect("/login?errormessage=wrong login or password");
      break;
    default:
    result.send(error);
  }
  //res.status(500).redirect("/login")
});

//server test
app.listen(port, function () {
  console.log("Server listening on port:" + port);
});
