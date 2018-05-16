const express = require("express");
const nunjucks = require("nunjucks");
const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const getEvents = require("./handlers/getEvents");
const getExpenses = require("./handlers/getExpenses");

const usersFromDB = require("./handlers/getUsersFromDB");

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
  console.log(` >serializeUser: ${user.id} ${user.email}`);
  return callback(null, user.email);
});
passport.deserializeUser(function(email, callback) {
  console.log(` >deserializeUser: ${email}`)
  if (email) {
    usersFromDB.findUserByEmail(email)
    .then(user => {
    callback(null, user);
    });
  }
});
passport.use(
  new LocalStrategy(function(email, password, callback) {
    if (email === "julien.littler@decathlon.com" && password === "1234") {
      callback(null, {
        id: "00f41ad3-1f65-4650-b122-b3c0b272632d",
        email: email
      });
    } else {
      console.log(" >LocalStrategy: user not found");
      callback("User not found (LocalStrategy)");
    }
  })
);

//nunjucks config
nunjucks.configure("views", {
  autoescape: true,
  express: app
});
app.set("views", __dirname + "/views");
app.set("view engine", "njk");

//rooting

// home page where you will login
app.get("/", function (request, result) {
  result.render("home");
});

app.post("/",
  passport.authenticate("local", { failureRedirect: '/' }),
  function(request, result) {
    result.redirect("/userevents");
  }
);

app.get(
  "/userevents",
  //require("connect-ensure-login").ensureLoggedIn("/home"),
  getEvents
);

app.get(
  "/event/:id",
  //require("connect-ensure-login").ensureLoggedIn("/home"),
  getExpenses
);

//public ressource
app.use(express.static("public"));

//errors management
app.use(function (req, res, next) {
  res.status(404).render("template_error");
});

app.use(function (err, req, res, next) {
  console.error(err.stack);
  res.status(500).send('ERROR 500 : Something broken!')
});

//server test
app.listen(port, function () {
  console.log("Server listening on port:" + port);
});
